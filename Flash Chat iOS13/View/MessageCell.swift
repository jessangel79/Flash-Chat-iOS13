//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Angelique Babin on 09/11/2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore


class MessageCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightAvatarImageView: UIImageView!
    @IBOutlet weak var leftAvatarImageView: UIImageView!
    
    // MARK: - Properties
    
    var message: Message? {
        didSet {
            label.text = message?.body
            // This is a message from the current user.
            if message?.sender == Auth.auth().currentUser?.email {
                leftAvatarImageView.isHidden = true
                rightAvatarImageView.isHidden = false
                messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
                label.textColor = UIColor(named: K.BrandColors.purple)
            } else { // This is a message from another sender.
                leftAvatarImageView.isHidden = false
                rightAvatarImageView.isHidden = true
                messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
                label.textColor = UIColor(named: K.BrandColors.lightPurple)
            }
        }
    }
    
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
    }

    // MARK: - Methods
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
