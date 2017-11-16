//
//  YFRecordingView.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/11/16.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFRecordingView: UIView {

    let recordingImageView:UIImageView={
        let imageView=UIImageView()
        imageView.frame=CGRect.init(x: 120, y: 40, width: 20, height: 80)
        imageView.image=UIImage.init(named: "ic_record_ripple")!
        return imageView
    }()
    
    let wheatImageView:UIImageView = {
        let imageView=UIImageView()
        imageView.frame=CGRect.init(x: 50, y: 40, width: 50, height: 80)
        imageView.image=UIImage.init(named: "ic_record")
        return imageView
    }()
    
    let titleLabel:UILabel =  {
        let  label=UILabel.init(frame: CGRect.init(x: 0, y: 120, width: 200, height: 80))
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.text = "手指上滑，取消发送"
        return label
    }()
    
    var timer:Timer?=nil
    let  maskLayer=CAShapeLayer.init()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.gray
        self.center=(UIApplication.shared.keyWindow?.center)!
        
        self.layer.masksToBounds=true
        self.layer.cornerRadius=5
        self.addSubview(titleLabel)
        self.addSubview(wheatImageView)
        self.addSubview(recordingImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   @objc func updateImage( )   {
        let count: Int = Int(arc4random()%80)
        let path=UIBezierPath.init(rect: CGRect.init(x: 0.0, y:   CGFloat(count), width: recordingImageView.bounds.width, height: recordingImageView.bounds.height))
        maskLayer.path = path.cgPath
        recordingImageView.layer.mask = maskLayer
     
    }
    
    //开始
    func start() {
        UIApplication.shared.keyWindow?.addSubview(self)
 
        timer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateImage), userInfo: nil, repeats: true)
        timer?.fire()
        
    }
    
    //结束
    func end(){
        timer?.fireDate=Date.distantFuture
        self.removeFromSuperview()
       
    }
    
  
    
    
    
    deinit{
        timer?.invalidate()
        timer=nil
    }

}
