//
//  ViewController.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/10/31.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFMessageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    private var messageTableView:UITableView!
    private let messageCell="YFMessageTableViewCell"
    private var messageArray=[YFMessageModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.title="消息"
 
         initData()
         initUI()
        
    }
    private func initData(){
        let  array=[["userImage":"0","userName":"iOS","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"0"],
                    ["userImage":"1","userName":"Android","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"1"],
                    ["userImage":"2","userName":"PHP","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"100"],
                    ["userImage":"3","userName":"Java","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"99"],
                    ["userImage":"4","userName":"Asp.Net","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"2"],
                    ["userImage":"5","userName":"Python","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"10"],
                 
        ["userImage":"6","userName":"JavaScript","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"1"],
        ["userImage":"7","userName":"胜利","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"100"],
        ["userImage":"8","userName":"结束","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"99"],
        ["userImage":"9","userName":"时间都去哪了","date":"2017.8.9","introduction":"完美案例，等你查看","messageCount":"2"],
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
            messageArray.append(model)
        }
        
    }
    
    private  func initUI(){
        messageTableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.YF_Width, height: UIScreen.YF_Height-64), style: .plain)
        messageTableView.separatorStyle = .none
        messageTableView.delegate=self
        messageTableView.dataSource=self
        messageTableView.rowHeight = 70.0
        messageTableView.register(YFMessageTableViewCell.classForCoder(), forCellReuseIdentifier: messageCell)
        view.addSubview(messageTableView)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: messageCell, for: indexPath) as! YFMessageTableViewCell
        cell.setModel(model: messageArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let sVC=YFSessionViewController()
        sVC.userName = messageArray[indexPath.row].userName!
        sVC.userImage=messageArray[indexPath.row].userImage!
        sVC.hidesBottomBarWhenPushed=true
        navigationController?.pushViewController(sVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction=UITableViewRowAction.init(style: .default, title: "删除", handler: { (rowAction, rowIndexPath) in
            
            self.messageArray.remove(at: indexPath.row)
            tableView.reloadData()
            
        })
        let messageCount=messageArray[indexPath.row].messageCount!
        if messageCount == "0" {
            
            return [deleteAction]
            
        }else{
            let markAction=UITableViewRowAction.init(style: .default, title: "标记已读", handler: { (rowAction, rowIndexPath) in
                
                let model=self.messageArray[rowIndexPath.row]
                model.messageCount="0"
                tableView.reloadData()
                
            })
            markAction.backgroundColor=UIColor.YF_RGB(r: 199, g: 199, b: 204)
          
            return [deleteAction,markAction]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

