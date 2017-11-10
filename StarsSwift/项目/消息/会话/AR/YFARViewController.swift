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

    let arSCNView = ARSCNView()
    let arSession = ARSession()
    let arConfiguration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arConfiguration.isLightEstimationEnabled = true//自适应灯光（室內到室外的話 畫面會比較柔和）
        
        arSession.run(arConfiguration)
        arSCNView.frame = self.view.frame
        
        arSCNView.session = arSession
        arSCNView.automaticallyUpdatesLighting = true//自动调节亮度
        
     
        self.view.addSubview(arSCNView)
 
    }

    

}
