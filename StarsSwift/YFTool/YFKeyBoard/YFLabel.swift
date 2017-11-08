//
//  YFLabel.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/11/8.
//  Copyright © 2017年 李永飞. All rights reserved.
import UIKit

class YFLabel: UILabel {
    
    private lazy var textIconArray = { () -> NSArray in
        let path=Bundle.main.path(forResource: "emotion_icons.plist", ofType: nil)
        let tempArray  =  NSArray.init(contentsOfFile: path!)!
        return tempArray
    }()
    
    private lazy var textArray = { [weak self] () -> [String] in
        var array=[String]()
        for dict in self?.textIconArray ?? [] {
            let dict=dict as! Dictionary<String, String>
            array.append((dict["text"])!)
        }
        return array
    }()
    
    private lazy var iconArray = { [weak self] () ->  [String] in
        var array=[String]()
        for dict in self?.textIconArray ?? []  {
            let dict=dict as! Dictionary<String, String>
            array.append((dict["image"])!)
        }
        return array
    }()
 
    func setText(text:String){
        
        //定义富文本即有格式的字符串
        let attributedString : NSMutableAttributedString = NSMutableAttributedString()
         var tempText=text
        repeat {
                    let index1 = tempText.index(of: "[") ?? tempText.endIndex
                    if index1.encodedOffset==0 {
                    let index2 = tempText.index(tempText.index(of: "]")!, offsetBy: 1)
                    let emoji = tempText[index1..<index2]//获取表情
                    tempText.removeSubrange(index1..<index2)//移除emoji
                      
                        
                        let index =  textArray.index(of: String(emoji))
                        let smileImage : UIImage = UIImage(named: iconArray[index!])!
                        let textAttachment : NSTextAttachment = NSTextAttachment()
                        textAttachment.image = smileImage
                        textAttachment.bounds = CGRect(x: 0, y: -4, width: 25, height: 25)
                        attributedString.append(NSAttributedString(attachment: textAttachment))
                       
                    }else{
                        let getText:String = String(tempText[..<index1])//获取文本
                        let theText:NSAttributedString=NSAttributedString.init(string: getText)
                        
                         attributedString.append(theText)
                         tempText.removeSubrange(..<index1)//移除文本
 
                    }
 
        }while(tempText.count>0)
        
       
        
      
        
//        let text:NSAttributedString=NSAttributedString.init(string: text)
//
//        //表情图片
//        let smileImage : UIImage = UIImage(named: "emotion_aiqing")!
//        let textAttachment : NSTextAttachment = NSTextAttachment()
//        textAttachment.image = smileImage
//        textAttachment.bounds = CGRect(x: 0, y: -4, width: 22, height: 22)
//
//        attributedString.append(text)
//
//        attributedString.append(NSAttributedString(attachment: textAttachment))
        
        self.attributedText = attributedString
    }
    

}
