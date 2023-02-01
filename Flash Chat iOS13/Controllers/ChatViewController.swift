//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    @IBOutlet weak var logOutButton: UIBarButtonItem!
    
    var messages :[Messages] = []
    
     
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessage()
    }
    
    func loadMessage(){
        
        db.collection(K.FStore.collectionName).order(by: <#T##String#>) .addSnapshotListener() { (querySnapshot, err) in
            self.messages = []
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    print("\(document.documentID) => \(document.data())")
                    let doc = document.data()
                    self.messages.append(Messages(sender: doc[K.FStore.senderField] as? String ?? "", messages: doc[K.FStore.bodyField] as? String ?? ""))
                    
                   
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
            }
        }
    }
    @IBAction func sendPressed(_ sender: UIButton) {
        
       if let message = messageTextfield.text,
        let email = Auth.auth().currentUser?.email
        {
           messages.append(Messages(sender: email, messages: message))
           db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField : email, K.FStore.bodyField : message])
           {
               (error) in if let e = error {
                   print("hata oldu")
               }
               else {
                   print("data gönderildi")
               }
           }
           
           
       }
       
      
      
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
