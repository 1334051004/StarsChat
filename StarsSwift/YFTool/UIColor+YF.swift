//
//  Color+YF.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/10/31.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

extension UIColor{
 
    class func YF_RGB(r:CGFloat,g:CGFloat,b:CGFloat) ->UIColor{
        return UIColor(red: r/225.0, green: g/225.0, blue: b/225.0, alpha: 1.0)
    }
    
}
