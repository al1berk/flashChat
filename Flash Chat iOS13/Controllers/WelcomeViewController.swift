//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel
class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        titleLabel.text = "⚡️FlashChat"
    /*    titleLabel.text = ""
        let title = "⚡️FlashChat"
        var charIndex = 1.0
        for letter in title{
            Timer.scheduledTimer(withTimeInterval: 0.2*charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
                print(charIndex)
                print(letter)
               
            }
            charIndex += 1
         }*/
       
    }
    

}
