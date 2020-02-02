//
//  HomeViewController.swift
//  QHacks2020
//
//  Created by Jiwoo Lee on 2020-01-30.
//  Copyright © 2020 Jiwoo Lee. All rights reserved.
//

import Foundation

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    @IBOutlet weak var hand: UIImageView!
    @IBOutlet weak var form: UIImageView!
    @IBOutlet weak var name: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
       
        self.view.addSubview(hand!)
        self.view.addSubview(form!)
        name!.alpha = 0// opacity
        self.view.addSubview(name!)


        
    }

    override func viewWillAppear(_ animated: Bool) {

        // base on transform
        UIView.beginAnimations(nil, context: nil)// animation start
        UIView.setAnimationDuration(2)// animation ends
        
        // translation move vertically from bottom into circle
        hand!.transform = CGAffineTransform(translationX: 0, y: -65)
        
        // translation move vertically from up into circle
        form!.transform = CGAffineTransform(translationX: 0, y: 50)
        name!.alpha = 1
        UIView.commitAnimations()// submit animation

    }
    
    func setUpElements() {
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
        
    }

}
