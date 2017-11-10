//
//  UIScreen+YF.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/10/31.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

extension UIScreen {

   class var YF_Width:CGFloat{
        return UIScreen.main.bounds.size.width
    }
    
   class var YF_Height:CGFloat{
        return UIScreen.main.bounds.size.height
    }
    
    class var YF_StatusBarHeight:CGFloat{
        return UIApplication.shared.statusBarFrame.size.height
    }
  
    
}
