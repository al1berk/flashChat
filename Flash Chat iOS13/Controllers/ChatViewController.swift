//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    @IBOutlet weak var logOutButton: UIBarButtonItem!
    
    var messages = [
    Messages(sender: "a@b.com", messages: "adsad asdasd asdasd \n asdad asdasd \n asdasd asdas asdasd asdasd adsad asdasd asdasda asdasd asdasd"),
    Messages(sender: "a@b.com", messages: "2. mesaj"),
    Messages(sender: "a@b.com", messages: "3. mesaj")
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        messageTextfield.text = "çıkış yapıldı"
       
      
      
    }
    

    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
               
           do {
             try firebaseAuth.signOut()
               navigationController?.popToRootViewController(animated: true)
           } catch let signOutError as NSError {
             print("Error signing out: %@", signOutError)
           }
    }
    
}
extension ChatViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = messages[indexPath.row].messages
        return cell
    }
    
    
}
