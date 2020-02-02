//
//  SignUpViewController.swift
//  QHacks2020
//
//  Created by Jiwoo Lee on 2020-01-30.
//  Copyright © 2020 Jiwoo Lee. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth //<--
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var returnButton: UIButton!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    
    
    func setUpElements() {
        //hide error label
        errorLabel.alpha = 0
        //ui
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleFilledButton(returnButton)

        
    }
    
    
    //check the fields and validate that the data is correct. If everything is correct, this method returns nil otherwise it returns the error message as a string -> put into error label
    func validateFields() -> String? {
        //Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        //Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !isPasswordValid(cleanedPassword) {
            //password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number"
        }
        
        
        return nil
    }
    
    func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@#!%*?&])[A-Za-z\\d$@#~%*?&]{8,}")
        return passwordTest.evaluate(with: password)
        
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
         //Validate the fields
         let error = validateFields()
         if error != nil {
             //there's something wrong with the fields, show error message
             showError(error!)
         }
         else {
             //Create cleaned version of the data
             let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             
             //Create user
             Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                 //Check for errors
                 if err != nil {
                     //there was an error
                     self.showError("Error creating user")
                 }
                 else {
                    guard let userID = Auth.auth().currentUser?.uid else { return }
                     //user was created successfully, now store the first name and last name
                     let db = Firestore.firestore()
                    db.collection("users").document(userID).setData(["firstname" : firstName, "lastname" : lastName, "uid" : result!.user.uid, "predictions":[] ])
                     //Transition to the home screen
                  self.transitionToHome()
                 }
             }
         }
    }
    
   func showError(_ message:String) {
       errorLabel.text = message
       errorLabel.alpha = 1
   }
       
     
    func transitionToHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.mainViewController) as? MainViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
       
    
    
    

}
