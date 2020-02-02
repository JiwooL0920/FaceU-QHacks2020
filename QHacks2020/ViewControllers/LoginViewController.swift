//
//  LoginViewController.swift
//  QHacks2020
//
//  Created by Jiwoo Lee on 2020-01-30.
//  Copyright © 2020 Jiwoo Lee. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var returnButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        //hide errorlabel
        errorLabel.alpha = 0
        //ui
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        Utilities.styleFilledButton(returnButton)

        
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
            //TODO: Validate text field
                //same
            
            //Create cleaned version of the text field
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Signing in the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    //can't sign in
                    self.errorLabel.text = error!.localizedDescription
                    self.errorLabel.alpha = 1
                }
                else {
                    //user signed in successfully; go to home screen
                    let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.selectionViewController) as? SelectionViewController
                    self.view.window?.rootViewController = homeViewController
                    self.view.window?.makeKeyAndVisible()
                }
            }
            
            
        }
    }

    

