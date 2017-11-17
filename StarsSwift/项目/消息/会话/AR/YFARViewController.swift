//
//  YFARViewController.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/11/8.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit
import ARKit

@available(iOS 11.0, *)
class YFARViewController: UIViewController {

//    let arSCNView = ARSCNView()
//    let arSession = ARSession()
//    let arConfiguration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        arConfiguration.isLightEstimationEnabled = true//自适应灯光（室內到室外的話 畫面會比較柔和）
//
//        arSession.run(arConfiguration)
//        arSCNView.frame = self.view.frame
//
//        arSCNView.session = arSession
//        arSCNView.automaticallyUpdatesLighting = true//自动调节亮度
//
//
//        self.view.addSubview(arSCNView)
        
        let startBtn=UIButton.init(frame: CGRect.init(x: 20, y: 20, width: 40, height: 40))
        startBtn.setTitle("开始录音", for: .normal)
        startBtn.addTarget(self, action: #selector(start), for: .touchUpInside)
        startBtn.backgroundColor=UIColor.red
        self.view.addSubview(startBtn)
        
        let stopBtn=UIButton.init(frame: CGRect.init(x: 20, y: 80, width: 40, height: 40))
        stopBtn.setTitle("停止录音", for: .normal)
        stopBtn.backgroundColor=UIColor.yellow
        stopBtn.addTarget(self, action: #selector(stop), for: .touchUpInside)
        self.view.addSubview(stopBtn)
        
        let playBtn=UIButton.init(frame: CGRect.init(x: 20, y: 150, width: 40, height: 40))
        playBtn.setTitle("播放录音", for: .normal)
        playBtn.backgroundColor = UIColor.blue
        playBtn.addTarget(self, action: #selector(play), for: .touchUpInside)
        self.view.addSubview(playBtn)
 
    }

    @objc func start(){
        
        YFAudioTool.share().startRecord()
    }
    
    @objc func stop(){
        
        YFAudioTool.share().stopRecord()
    }
    
    @objc func play(){
        
        YFAudioTool.share().playRecord()
    }

}
