//
//  YFNavigationViewController.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/10/31.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFNavigationViewController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
 

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.setBackgroundImage(UIImage.init(named: "导航条"), for: .default)
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes=[NSAttributedStringKey.foregroundColor: UIColor.white]
    }

    

}
