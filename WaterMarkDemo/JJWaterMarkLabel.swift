//
//  JJWaterMarkLabel.swift
//  WaterMarkDemo
//
//  Created by 叶佳骏 on 2017/11/14.
//  Copyright © 2017年 Mr.JJ. All rights reserved.
//

import UIKit

class JJWaterMarkLabel: UILabel {
    
    /// 边长
    let sideLength: CGFloat
    /// 文字间距，默认值10
    var textSpacing: Int = 10
    /// 行间距, 默认值30
    var lineSpacing: CGFloat = 30
    /// 旋转角度，默认值-45
    var rotationAngle: CGFloat = -45 {
        willSet {
            self.transform = CGAffineTransform(rotationAngle: newValue * CGFloat(Double.pi) / 180 )
        }
    }

    override init(frame: CGRect) {
        sideLength = sqrt(frame.width * frame.width + frame.height * frame.height)
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: sideLength, height: sideLength))
        center = CGPoint(x: frame.origin.x + frame.width / 2, y: frame.origin.y + frame.height / 2)
        numberOfLines = 0
        backgroundColor = UIColor.clear
        transform = CGAffineTransform(rotationAngle: rotationAngle * CGFloat(Double.pi) / 180)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        /// 计算文本复制次数，得到最后的水印内容
        var waterMarkContent = ""
        let numberX: Int = Int(sideLength) / ((text?.count)! + textSpacing)
        let numberY: Int = Int(sideLength / (font.pointSize + lineSpacing))
        for _ in 0..<numberX * numberY {
            waterMarkContent += text! + String(repeating: " ", count: textSpacing)
        }
        
        let attributedString = NSMutableAttributedString(string: waterMarkContent, attributes: [NSAttributedStringKey.font: self.font])
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineBreakMode = .byCharWrapping
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        attributedText = attributedString
        
        super.drawText(in: rect)
    }
}
