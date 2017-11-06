//
//  YFFriendsViewController.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/10/31.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFFriendsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    private var friendTableView:UITableView!
    private let friendCell="YFFriendsTableViewCell"
    private var friendArray=[YFMessageModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title="好友"
        initData()
        initUI()
        
        
    }
    private func initData(){
        let  array=[["userImage":"0","userName":"iOS","date":"2017.8.9","introduction":"iOS是由苹果公司开发的移动操作系统。","messageCount":"0"],
                    ["userImage":"1","userName":"Android","date":"2017.8.9","introduction":"Android是一种基于Linux的自由及开放源代码的操作系统，主要使用于移动设备，如智能手机和平板电脑，由Google公司和开放手机联盟领导及开发。","messageCount":"1"],
                    ["userImage":"2","userName":"PHP","date":"2017.8.9","introduction":"PHP诞生于1994年，是Web服务器脚本语言。","messageCount":"100"],
                    ["userImage":"3","userName":"Java","date":"2017.8.9","introduction":"诞生于1995年的Java 1.0，来自于Sun公司，是第一个在虚拟机上运行的语言。","messageCount":"99"],
                    ["userImage":"4","userName":"Asp.Net","date":"2017.8.9","introduction":"Quick BASIC由美国微软公司开发，1987年推出，它是BASIC的继承者。","messageCount":"2"],
                    ["userImage":"5","userName":"Python","date":"2017.8.9","introduction":" Python诞生于1989年，作者为了打发圣诞节的无趣，决心开发一个新的脚本解释程序，做为 ABC语言的一种继承。","messageCount":"10"],
                    
                    ["userImage":"6","userName":"JavaScript","date":"2017.8.9","introduction":"1995 年，网景公司发行的 Netscape Navigator 2.0，它的脚步语言就是JavaScript。","messageCount":"1"],
                    ["userImage":"7","userName":"C++","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"100"],
                    ["userImage":"8","userName":"Ruby","date":"2017.8.9","introduction":" Ruby诞生于1996年，作者基于对Perl和Python的不满而设计，的纯面向对象脚本语言。","messageCount":"99"],
                    ["userImage":"9","userName":"Objective-C","date":"2017.8.9","introduction":"Objective-C诞生于1983年，后来被苹果公司选中，和C++相似，也是对C的面向对象扩展。","messageCount":"2"],
                    ["userImage":"10","userName":"呵呵","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"10"],
                    
                    ["userImage":"11","userName":"大号","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"1"],
                    ["userImage":"12","userName":"胜利","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"100"],
                    ["userImage":"13","userName":"结束","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"99"],
                    ["userImage":"14","userName":"时间都去哪了","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"2"],
                    ["userImage":"15","userName":"呵呵","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"10"],
                    
                    ["userImage":"16","userName":"大号","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"1"],
                    ["userImage":"17","userName":"胜利","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"100"],
                    ["userImage":"18","userName":"结束","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"99"],
                    ["userImage":"19","userName":"时间都去哪了","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"2"],
                    ["userImage":"20","userName":"呵呵","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"10"],
                    ["userImage":"21","userName":"呵呵","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"10"] ,  ["userImage":"22","userName":"呵呵","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"10"]  ,  ["userImage":"23","userName":"呵呵","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"10"]
            
        ]
        
        for dict in array {
            let model=YFMessageModel.init(dict: dict)
            friendArray.append(model)
        }
        
    }
    
    private  func initUI(){
        friendTableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.YF_Width, height: UIScreen.YF_Height-64), style: .plain)
        friendTableView.separatorStyle = .none
        friendTableView.delegate=self
        friendTableView.dataSource=self
        friendTableView.rowHeight = 60.0
        
        friendTableView.register(YFFriendsTableViewCell.classForCoder(), forCellReuseIdentifier: friendCell)
        view.addSubview(friendTableView)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: friendCell, for: indexPath) as!  YFFriendsTableViewCell
        cell.setModel(model: friendArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sVC=YFSessionViewController()
        sVC.userName = friendArray[indexPath.row].userName!
        sVC.userImage=friendArray[indexPath.row].userImage!
        sVC.hidesBottomBarWhenPushed=true
        navigationController?.pushViewController(sVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction=UITableViewRowAction.init(style: .default, title: "删除", handler: { (rowAction, rowIndexPath) in
            
            self.friendArray.remove(at: indexPath.row)
            tableView.reloadData()
            
        })
        
        return [deleteAction]
    }
    

}
