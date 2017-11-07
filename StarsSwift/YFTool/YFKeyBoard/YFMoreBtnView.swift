//
//  YFMoreBtnView.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/11/2.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFMoreBtnView: UIView {
    
    var moreBtnClick:((_ index:Int)->())?

    convenience  init(frame: CGRect,titleArray:[String] ) {
        self.init(frame: frame)
    
        self.backgroundColor=UIColor.YF_RGB(r: 243, g: 243, b: 243)
        let buttonW:CGFloat = 55
        let buttonH:CGFloat = buttonW
        let btnTitleArray = titleArray //["照片","拍摄","AR"]
        for i in 0..<btnTitleArray.count {
           
            let X = (((self.bounds.width - (4 * buttonW)) / 5.0) * CGFloat((i % 4) + 1)) + (buttonW * CGFloat(i % 4));
            let Y = 15 + CGFloat(i / 4) * CGFloat(buttonH + 35);
            let button = YFButton.init(frame:CGRect.init(x: X, y: Y, width: buttonW, height: buttonH))
            button.positionType = .bottom
            button.tag=i
            button.setImage(UIImage.init(named: btnTitleArray[i]), for: .normal)
            button.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
            button.titleLabel?.font=UIFont.systemFont(ofSize: 14)
            self.addSubview(button)
            
        }
       
        
    }
    
    @objc func btnClick(btn:UIButton){
    
        if moreBtnClick != nil{
            moreBtnClick!(btn.tag)
        }
    
    }
 
    
}
