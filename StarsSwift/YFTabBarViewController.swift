//
//  YFTabBarViewController.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/10/31.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let vcNameArray=["YFMessage","YFFriends"]
        var vcArray=[UIViewController]()
        for vcStr in vcNameArray {
            let clsName = "StarsSwift." + vcStr + "ViewController"
            let cls = NSClassFromString(clsName) as? UIViewController.Type
            let vc = cls?.init()
 
            let navVc=YFNavigationViewController(rootViewController:vc!)
            
            navVc.tabBarItem.selectedImage=UIImage.init(named: vcStr + "Selected")?.withRenderingMode(.alwaysOriginal)
            navVc.tabBarItem.image=UIImage.init(named: vcStr)?.withRenderingMode(.alwaysOriginal)
            switch(vcStr){
               case "YFMessage":
                  navVc.tabBarItem.title="消息"
               case "YFFriends":
                  navVc.tabBarItem.title="好友"
               default:
                  break
            }

            navVc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.YF_RGB(r: 11, g: 160, b: 98)], for: .selected)
            vcArray.append(navVc)
        
        }
        
        viewControllers=vcArray
    }
    
    

}


