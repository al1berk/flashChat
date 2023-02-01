//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
    
        
        if   let email = emailTextfield.text ,
          let password = passwordTextfield.text{
         register(email: email, password: password
         )
     }
        else
        {
            print("e posta ve passowrd kutuları boş olamaz")
        }
        
        
    }
    
    
    func register (email : String, password : String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(" hata verdi \(e)")
            }
            else{
                print("e mail \(email) password \(password) kayıt oldu ")
            }
        }
    }
    
}
