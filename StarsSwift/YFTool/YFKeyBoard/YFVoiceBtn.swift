//
//  YFVoiceBtn.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/11/16.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFVoiceBtn: UIButton {
    let voiceView=YFRecordingView.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 200))
     let outsideView=YFOutsideView.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 200))
    override init(frame: CGRect) {
 
        super.init(frame:frame)
    
        self.backgroundColor = .white
        self.setTitle("按住 说话", for: .normal)
        self.setTitle("正在 录音", for: .highlighted)
        self.addTarget(self, action: #selector(downVoice), for: .touchDown)
        self.addTarget(self, action: #selector(upVoice), for: .touchUpInside)
        self.addTarget(self, action: #selector(cancelVoice), for: .touchUpOutside)
        self.addTarget(self, action: #selector(outVoice), for: .touchDragOutside)
        self.setTitleColor(UIColor.YF_RGB(r: 20, g: 20, b: 20), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //开始录音
    @objc func downVoice() {
        voiceView.start()
        print("开始录音")
    }
    
    //结束录音
    @objc func upVoice() {
        voiceView.end()
        print("结束录音")
    }
    
    //取消录音
    @objc func outVoice() {
        outsideView.outInside()
        print("取消录音")
        
    }
    @objc func cancelVoice() {
         voiceView.end()
        outsideView.cancel()
        print("取消录音")
        
    }
    
    
}
