//
//  YFOutsideView.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/11/16.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFOutsideView: UIView {

    let outsideView:UIImageView = {
        let imageView=UIImageView()
        imageView.frame=CGRect.init(x: 50, y: 20, width: 80, height: 100)
        imageView.image=UIImage.init(named: "ic_release_to_cancel")
        return imageView
    }()
    
    let titleLabel:UILabel =  {
        let  label=UILabel.init(frame: CGRect.init(x: 0, y: 120, width: 200, height: 80))
        label.textColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.text = "松开手指，取消发送"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.gray
        self.center=(UIApplication.shared.keyWindow?.center)!
        
        self.layer.masksToBounds=true
        self.layer.cornerRadius=5
        self.addSubview(outsideView)
        self.addSubview(titleLabel)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func outInside(){
          UIApplication.shared.keyWindow?.addSubview(self)
    }
    
    func cancel(){
        self.removeFromSuperview()
    }

}
