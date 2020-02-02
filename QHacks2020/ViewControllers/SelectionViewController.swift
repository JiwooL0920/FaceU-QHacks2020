//
//  SelectionViewController.swift
//  QHacks2020
//
//  Created by Jiwoo Lee on 2020-02-01.
//  Copyright © 2020 Jiwoo Lee. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class SelectionViewController: UIViewController {
    @IBOutlet weak var analyzeButton: UIButton!
    @IBOutlet weak var myAnalyticsButton: UIButton!
    
    @IBOutlet weak var right: UIImageView!
    
    @IBOutlet weak var left: UIImageView!
    
    @IBOutlet weak var logout: UIButton!
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        let auth = Auth.auth()
        do {
             try Auth.auth().signOut()
            let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
            self.view.window?.rootViewController = homeViewController
            self.view.window?.makeKeyAndVisible()
         } catch let error {
             // handle error here
             print("Error trying to sign out of Firebase: \(error.localizedDescription)")
         }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
        self.view.addSubview(right!)
        self.view.addSubview(left!)
    }
    
    //rotate
    override func viewWillAppear(_ animated: Bool) {
        
        // transform base on UIView
        //start
        UIView.beginAnimations(nil, context: nil)
        //duration
        UIView.setAnimationDuration(2)
        //>1: bigger <1: smaller
        right!.transform = CGAffineTransform(scaleX: 3, y: 3)
        left!.transform = CGAffineTransform(scaleX: 3, y: 3)
        //submit
        UIView.commitAnimations()
    }
    
    

    
    func setUpElements() {
        //ui
        Utilities.styleFilledButton(analyzeButton)
        Utilities.styleHollowButton(myAnalyticsButton)
    }
    
    
}
