//
//  ChatView.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/5/17.
//
//

import UIKit

class ChatView: UIView {

    let scrollView: UIScrollView
    var messages: [Message]
    var bubbles: [BubbleView] = []
    let bubbleSeperatorSpace: CGFloat = 30
    let labelSpace: CGFloat = 5
    let horizontalMargin: CGFloat = 10
    let topMargin: CGFloat = 15
    
    init(frame: CGRect, messages: [Message]) {
        scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        self.messages = messages
        super.init(frame: frame)
        scrollView.frame = bounds
        scrollView.contentSize = bounds.size
        addSubview(scrollView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        var drawPoint = CGPoint(x: horizontalMargin, y: topMargin)
        var drawOnLhs = true
        for message in messages {
            let bubbleWidth: CGFloat = BubbleView.bubbleWidth(forParentSize: bounds.size, andText: message.text)
            let bubbleHeight: CGFloat = BubbleView.bubbleHeight(for: bubbleWidth, andText: message.text)
            if !drawOnLhs {
                drawPoint.x = rect.width - horizontalMargin - bubbleWidth
            } else {
                drawPoint.x = horizontalMargin
            }
            let frame = CGRect(x: drawPoint.x, y: drawPoint.y, width: bubbleWidth, height: bubbleHeight)
            let bubble = BubbleView(frame: frame, message: message, onLhs: drawOnLhs)
            bubbles.append(bubble)
            scrollView.addSubview(bubble)
            
            drawPoint.y += bubbleHeight + labelSpace
            let metaDataLabel = UILabel()
            metaDataLabel.textColor = UIColor.lightGray
            metaDataLabel.font = UIFont.systemFont(ofSize: 12)
            metaDataLabel.text = message.getMetaData()
            metaDataLabel.sizeToFit()
            
            if drawOnLhs {
                metaDataLabel.frame.origin = drawPoint
                metaDataLabel.frame.origin.x += 3
            } else {
                metaDataLabel.frame.origin = CGPoint(x: rect.width - metaDataLabel.frame.width - horizontalMargin - 3, y: drawPoint.y)
            }
            
            scrollView.addSubview(metaDataLabel)
            
            drawPoint.y += bubbleSeperatorSpace
            
            drawOnLhs = !drawOnLhs
        }
        
    }
 

}
