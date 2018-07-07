//
//  CustomMessageCell.swift
//  Flash Chat
//
//  Created by Angela Yu on 30/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework

class cell: UITableViewCell {


    @IBOutlet var messageBackground: UIView!
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var messageBody: UILabel!
    @IBOutlet var senderUsername: UILabel!
    
    func configureCell(msg:Message){
    
        messageBody.text=msg.messageBody
        senderUsername.text=msg.sender
        if senderUsername.text==Auth.auth().currentUser?.email as? String{
            avatarImageView.backgroundColor=UIColor.flatMint()
        }else{
            avatarImageView.backgroundColor=UIColor.flatWatermelon()
        }
        
    }


}
