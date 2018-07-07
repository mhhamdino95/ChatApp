//
//  ViewController.swift
//  Flash Chat
//
//  Created by Angela Yu on 29/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift


class ChatViewController: UIViewController {
    
    // Declare instance variables here

    
    // We've pre-linked the IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    
    var arrMessage=[Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Set yourself as the delegate and datasource here:
        
        messageTableView.delegate = self
        messageTableView.dataSource = self

        
        messageTableView.rowHeight=UITableViewAutomaticDimension
        messageTableView.estimatedRowHeight=120
        
        messageTableView.register(UINib(nibName: "cell", bundle: nil), forCellReuseIdentifier: "cell")
        
        //TODO: Set yourself as the delegate of the text field here:

        retriveMessage()
        
        //TODO: Set the tapGesture here:
        
        

        //TODO: Register your MessageCell.xib file here:

        
    }

    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    //TODO: Declare cellForRowAtIndexPath here:
    
    
    
    //TODO: Declare numberOfRowsInSection here:
    
    
    
    //TODO: Declare tableViewTapped here:
    
    
    
    //TODO: Declare configureTableView here:
    
    
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
    

    
    //TODO: Declare textFieldDidBeginEditing here:
    
    
    
    
    //TODO: Declare textFieldDidEndEditing here:
    

    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    
    
    
    
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        
var messageDB=Database.database().reference().child("Message")
        
        let messageDict=[
            "Sender":Auth.auth().currentUser?.email,
            "MessageBody":messageTextfield.text!
            ]
        
        messageDB.childByAutoId().setValue(messageDict) { (error, ref) in
            if error != nil{print(error?.localizedDescription)}
            else{
                print("done")
                self.messageTextfield.text=""
            }
        }
        
    }
    
    func retriveMessage(){
        var messageDB=Database.database().reference().child("Message")
        messageDB.observe(.childAdded) { (snap) in
            if let sValue=snap.value as? [String:String]{
                
                let messageBody=sValue["MessageBody"]!
                let sender=sValue["Sender"]!
                
                let msg=Message()
                msg.messageBody=messageBody
                msg.sender=sender
                
                self.arrMessage.append(msg)
                self.messageTableView.rowHeight=UITableViewAutomaticDimension
                self.messageTableView.estimatedRowHeight=120
                self.messageTableView.reloadData()
                

                
            }
        }
    }
    
    //TODO: Create the retrieveMessages method here:
    
    

    
    
    
    @IBAction func logOutPressed(_ sender: AnyObject) {
        
        do{
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }catch{
            print("err")
        }
        
    }
    


}


extension ChatViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? cell {
            
            let list = arrMessage[indexPath.row]
            
            
            cell.configureCell(msg: list)
            return cell
            
        } else {
            return cell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMessage.count
    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//       // let list = lists[indexPath.row]
//
//        performSegue(withIdentifier: "show", sender: list)
//
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if let destination = segue.destination as? VideoVC {
//
//            if let li = sender as? myCell {
//                destination. =
//            }
//
//        }
//
//    }
}
