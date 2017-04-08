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
    let messageTextLabel: UILabel
    let cornerRadiusToWidth: CGFloat = 0.33
    static let textSize: CGFloat = 16
    static let verticalMargin: CGFloat = 20
    static let totalHorizontalMargin: CGFloat = 20
    static var horizontalMargin: CGFloat {
        return totalHorizontalMargin / 2
    }
    static let bubbleWidthMultiplier:CGFloat = 0.6
    
    init(frame: CGRect, message: Message, onLhs lhs: Bool) {
        self.message = message
        self.lhs = lhs
        self.messageTextLabel = UILabel()
        messageTextLabel.numberOfLines = 2
        super.init(frame: frame)
        addSubview(messageTextLabel)
    }
    
    override func layoutSubviews() {
        if lhs {
            backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        } else {
            backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.6509803922, blue: 0.137254902, alpha: 1)
            messageTextLabel.textColor = .white
        }
        layer.cornerRadius = frame.height * cornerRadiusToWidth
        layer.masksToBounds = true
        
        messageTextLabel.text = message.text
        messageTextLabel.font = UIFont.systemFont(ofSize: BubbleView.textSize)
        messageTextLabel.sizeToFit()
        let bubbleWidthWithMargin = bounds.width - BubbleView.totalHorizontalMargin
        messageTextLabel.numberOfLines = Int(ceil(messageTextLabel.frame.width / bubbleWidthWithMargin))
        messageTextLabel.frame = CGRect(x: BubbleView.horizontalMargin, y: 0, width: bounds.width - BubbleView.horizontalMargin, height: bounds.height)
    }
    
    static func bubbleHeight(for bubbleWidth: CGFloat, andText text: String) -> CGFloat {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: BubbleView.textSize)
        label.sizeToFit()
        let bubbleWidthWithMargin = bubbleWidth - totalHorizontalMargin
        var lines = ceil(label.frame.width / bubbleWidthWithMargin)
        if lines < 1 {
            lines = 1
        }
        return lines * label.frame.height + verticalMargin
    }
    
    static func bubbleWidth(forParentSize size: CGSize, andText text: String) -> CGFloat {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: BubbleView.textSize)
        label.sizeToFit()
        let labelWidth = label.frame.width
        let bubbleWidth = size.width * BubbleView.bubbleWidthMultiplier
        if labelWidth < bubbleWidth {
            return labelWidth + BubbleView.totalHorizontalMargin
        } else {
            return bubbleWidth
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
