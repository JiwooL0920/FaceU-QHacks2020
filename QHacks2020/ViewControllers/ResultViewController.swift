//
//  ResultViewController.swift
//  QHacks2020
//
//  Created by Jiwoo Lee on 2020-02-01.
//  Copyright © 2020 Jiwoo Lee. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var emotionResult = ""
    var genderResult = ""
    var ageResult = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("RECEIVED SEGUE")
        print(emotionResult)
        print(genderResult)
        print(ageResult)
        // Do any additional setup after loading the view.
        
        resultLabel.text = emotionResult
        genderLabel.text = genderResult
        ageLabel.text = ageResult
        
        showImage(emot: emotionResult)
    }
    
    func showImage(emot : String) {
        switch emot {
            case "Happy":
                imageView.image = UIImage(named: "Happy")
        case "Sad":
            imageView.image = UIImage(named: "Sad")
        case "Disgust":
            imageView.image = UIImage(named: "Disgust")
        case "Angry":
            imageView.image = UIImage(named: "Angry")
        case "Surprised":
            imageView.image = UIImage(named: "Surprised")
        case "Neutral":
            imageView.image = UIImage(named: "Neutral")
        case "Fear":
            imageView.image = UIImage(named: "Fear")
        default:
            imageView.image = UIImage(named: "Neutral")
        }
    }
    
    
    
}
