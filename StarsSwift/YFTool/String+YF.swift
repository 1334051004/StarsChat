//
//  String+YF.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/10/31.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

extension String {
    
    public func YF_Width(font:UIFont,height:CGFloat)->CGFloat{
        let attributes = [NSAttributedStringKey.font:font]
        
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = self.boundingRect(with: CGSize.init(width: CGFloat(MAXFLOAT), height: height), options: option, attributes: attributes, context:nil)
        return rect.size.width
    }
    
    public func YF_Height(font:UIFont,width:CGFloat)->CGFloat{
        let attributes = [NSAttributedStringKey.font:font]
        
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = self.boundingRect(with: CGSize.init(width: width, height: CGFloat(MAXFLOAT)), options: option, attributes: attributes, context:nil)
        return rect.size.height
    }

}
