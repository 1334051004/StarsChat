//
//  YFButton.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/11/2.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

enum YFPositionType {
    case nomal //正常，默认为图标在左，文本在右(居中)
    case nomalLeft //正常左对齐，图标在左，文本在右
    case nomalRight //正常右对齐，图标在左，文本在右
    case left  //交换左对齐，文本在左，图标在右
    case right//交换右对齐，文本在左，图标在右
    case center //交换居中对齐，文本在左，图标在右
    case top  //文本在上，图标在下(居中)
    case bottom //文本在下，图标在上(居中)
}

enum YFAlignType {
    case center  //居中对齐
    case left //左对齐
    case right //右对齐
}

class YFButton: UIButton {

    var positionType:YFPositionType = .nomal
    

    //正常左对齐，图标在左，文本在右
    func configPositionTypeNomalLeft(){
        setLeftView(leftView: self.imageView!, rightView: self.titleLabel!, alignType: .left)
    }
    
    //正常右对齐，图标在左，文本在右
    func configPositionTypeNomalRight() {
    
         setLeftView(leftView: self.titleLabel!, rightView: self.imageView!, alignType: .right)
    }
    
    //交换左对齐，文本在左，图标在右
    func configPositionTypeLeft() {
    
         setLeftView(leftView: self.titleLabel!, rightView: self.imageView!, alignType: .left)
    
    }
    
    //交换右对齐，文本在左，图标在右
    func configPositionTypeRight() {
       setLeftView(leftView: self.imageView!, rightView: self.titleLabel!, alignType: .right)
     
    }
    
    //交换居中对齐，文本在左，图标在右
     func configPositionTypeCenter() {
       setLeftView(leftView: self.titleLabel!, rightView: self.imageView!, alignType: .center)
    
    }
    
    //文本在上，图标在下(居中)
    func configPositionTypeTop() {
        setTopView(topView: self.titleLabel!, bottomView: self.imageView!)
        
    }
 
    
    //文本在下，图标在上(居中)
    func configPositionTypeBottom() {
        setTopView(topView: self.imageView!, bottomView: self.titleLabel!)
        
    }
 
    
 
    func setLeftView(leftView:UIView,rightView:UIView,alignType:YFAlignType) {
        /**
         *  注： 当为左对齐时，左边的view即为leftView
         *          当为右对齐时，右边的view即为leftView
         */
        
        //调整左边view的frame
        var leftViewFrame=leftView.frame
        switch alignType {
           case .center:
              let width=leftView.bounds.width + rightView.bounds.width
               leftViewFrame.origin.x = (self.bounds.width - width) / 2.0
            case .left:
               leftViewFrame.origin.x = 0
            case .right:
               leftViewFrame.origin.x = self.bounds.width - leftView.bounds.width
         
        }
        
        leftView.frame=leftViewFrame
        
        //调整右边view的Frame
        var rightViewFrame=rightView.frame
        switch alignType {
            case .center:
               rightViewFrame.origin.x = leftViewFrame.maxX
            case .left:
               rightViewFrame.origin.x = leftViewFrame.width
            case .right:
               rightViewFrame.origin.x = leftViewFrame.origin.x - rightView.bounds.width
        }
        
        rightView.frame=rightViewFrame
    }
    
    
    // 调整上下子视图位置
    func setTopView(topView:UIView,bottomView:UIView){
        let height = topView.bounds.height + bottomView.bounds.height
        var originX = (self.bounds.width - topView.bounds.width) / 2.0
        var originY = (self.bounds.width - height) / 2.0
        
        var topViewFrame = topView.frame
        topViewFrame.origin.x = originX
        topViewFrame.origin.y = originY
        topView.frame=topViewFrame
        
        originX =  (self.bounds.width - bottomView.bounds.width) / 2.0
        originY = topViewFrame.maxY
        var bottomViewFrame = bottomView.frame
        bottomViewFrame.origin.x = originX
        bottomViewFrame.origin.y = originY
        bottomView.frame=bottomViewFrame
    }
    
 
    // 布局子视图
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch positionType {
        case .nomal:
            break//默认状态下不处理
        case .nomalLeft:
            configPositionTypeNomalLeft()
        case .nomalRight:
             configPositionTypeNomalRight()
            
        case .left:
            configPositionTypeLeft()
        case .right:
            configPositionTypeRight()
            
        case .center:
            configPositionTypeCenter()
        case .top:
            configPositionTypeTop()
        case .bottom:
            configPositionTypeBottom()
        
         
    }
 
     
    }
    
    func setPositionType(positionType1:YFPositionType)   {
        positionType=positionType1
    }
    
    override func sizeToFit() {
        super.sizeToFit()
        layoutIfNeeded()//先让其获取尺寸再调整内容，不调用此方法，下面调整会有问题
        if positionType == .top || positionType == .bottom {
            let titleSize = self.titleLabel?.bounds.size
            let imageSize =  self.imageView?.bounds.size
            
            let height = titleSize!.height + imageSize!.height
            let width = max(titleSize!.width,imageSize!.width)
            let padding = fabs(self.bounds.width-width)
            
            self.titleEdgeInsets =  UIEdgeInsetsMake(0, 0, 0, -padding)
            var frame = self.frame
            frame.size.height = height
            frame.size.width = width + 5
            self.frame=frame
        }
        
    }
    
   

}
