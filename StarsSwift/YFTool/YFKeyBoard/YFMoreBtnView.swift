//
//  YFMoreBtnView.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/11/2.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFMoreBtnView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let buttonW:CGFloat = 55
        let buttonH:CGFloat = buttonW
        let btnTitleArray = ["照片","拍摄"]
        for i in 0..<2 {
           
            let X = (((self.bounds.width - (4 * buttonW)) / 5.0) * CGFloat((i % 4) + 1)) + (buttonW * CGFloat(i % 4));
            let Y = 15 + CGFloat(i / 4) * CGFloat(buttonH + 35);
            let button = YFButton.init(frame:CGRect.init(x: X, y: Y, width: buttonW, height: buttonH))
            button.positionType = .bottom
            button.setImage(UIImage.init(named: btnTitleArray[i]), for: .normal)
            button.titleLabel?.font=UIFont.systemFont(ofSize: 14)
            self.addSubview(button)
            
        }
       
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
