//
//  YFSessionCellModel.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/11/1.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFSessionCellModel: NSObject {

    var contentHeight:CGFloat?
    var contentWidth:CGFloat?
    var cellHeight:CGFloat?
    var cellWidth:CGFloat?
    var cellModel:YFSessionModel?
    
    
   
    
    init(model:YFSessionModel) {
        super.init()
        
        cellModel=model
        
        if model.contentType == 0{
            let font=UIFont.systemFont(ofSize: 18)
            let content=model.content
            var width=(content?.YF_Width(font: font, height: 50))!
            if width>UIScreen.YF_Width-160{
                width=UIScreen.YF_Width-160
            }
            contentWidth=width
            var height:CGFloat=(content?.YF_Height(font: font, width: width))!
            if height < CGFloat(50.0) {
                height=50
            }else{
                height += 20
            }
            contentHeight=height
            
            cellWidth=UIScreen.YF_Width
            cellHeight=height+20
        }else if model.contentType == 1{
            cellWidth=UIScreen.YF_Width
            cellHeight = CGFloat((cellModel?.height)! + 20)
        }else{
            cellWidth=UIScreen.YF_Width
            cellHeight=50+20
        }
        
       
        
 
        
    }
    
    
}
