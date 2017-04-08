//
//  BubbleView.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/5/17.
//
//

import UIKit

class BubbleView: UIView {

    let message: Message
    let lhs: Bool
    let messageTextView: UITextView
    
    init(frame: CGRect, message: Message, onLhs lhs: Bool) {
        self.message = message
        self.lhs = lhs
        self.messageTextView = UITextView()
        super.init(frame: frame)
        addSubview(messageTextView)
    }
    
    override func layoutSubviews() {
        if lhs {
            backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        } else {
            backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.6509803922, blue: 0.137254902, alpha: 1)
            messageTextView.textColor = .white
        }
        layer.cornerRadius = 18
        layer.masksToBounds = true
        
        messageTextView.text = message.text
        messageTextView.font = UIFont.systemFont(ofSize: 16)
        messageTextView.isUserInteractionEnabled = false
        messageTextView.backgroundColor = .clear
        messageTextView.frame = CGRect(x: 8, y: 0, width: frame.width, height: frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
