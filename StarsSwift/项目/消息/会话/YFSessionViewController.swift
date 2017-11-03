//
//  YFSessionViewController.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/10/31.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFSessionViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var userName:String = "会话"
    var userImage:String = ""
    
    private var sessionTableView:UITableView!
    private var sessionArray=[YFSessionCellModel]()
    private let textSessionCell="YFTextSessionCell"
    private let imageSessionCell="YFImageSessionCell"
    private let voiceSessionCell="YFVoiceSessionCell"
    private let inputTextView=YFInputView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = userName
        
        initData()
        initUI()
    }
    func initData() {
        let array=[
            ["userImage":userImage ,"content":"开发测试","contentType":0,"contentSource":0,"width":240,"height":160],
            ["userImage":userImage ,"content":"寻找bug,分分析错误，找到原因，采取正确的方案，修正bug","contentType":0,"contentSource":1,"width":240,"height":160],
            ["userImage":userImage ,"content":"123","contentType":1,"contentSource":0,"width":240,"height":160],
            ["userImage":userImage ,"content":"123","contentType":1,"contentSource":1,"width":240,"height":160],
            ["userImage":userImage ,"content":"123","contentType":2,"contentSource":0,"width":240,"height":160],
            ["userImage":userImage ,"content":"123","contentType":2,"contentSource":1,"width":240,"height":160]]
        for dict in array {
           let model =  YFSessionModel.init(dict:dict)
            let cellModel = YFSessionCellModel.init(model: model)
           sessionArray.append(cellModel)
        }
        
    }
    private  func initUI(){
        sessionTableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.YF_Width, height: UIScreen.YF_Height-64-50), style: .plain)
        sessionTableView.separatorStyle = .none
        sessionTableView.delegate=self
        sessionTableView.backgroundColor = .white
        sessionTableView.dataSource=self
        sessionTableView.register(YFTextSessionCell.classForCoder(), forCellReuseIdentifier: textSessionCell)
        sessionTableView.register(YFImageSessionCell.classForCoder(), forCellReuseIdentifier: imageSessionCell)
        sessionTableView.register(YFVoiceSessionCell.classForCoder(), forCellReuseIdentifier: voiceSessionCell)
        view.addSubview(sessionTableView)
  
      
        
        //添加消息输入框
        inputTextView.frame=CGRect.init(x: 0, y: UIScreen.YF_Height-64-50, width: UIScreen.YF_Width, height: 50)
        inputTextView.backgroundColor = UIColor.YF_RGB(r: 243, g: 243, b: 243)
        inputTextView.changeChatTableViewFrame = {[weak self] (height)->() in
            var frame = self?.sessionTableView.frame
            frame?.size.height = height
            self?.sessionTableView.frame = frame!
            
            self?.sessionTableView.scrollToRow(at: IndexPath.init(row: (self?.sessionArray.count)!-1, section: 0), at: UITableViewScrollPosition.bottom, animated: false)
        }
        inputTextView.setInputTextViewMaxHeight(height: 4)
        view.addSubview(inputTextView)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel=sessionArray[indexPath.row].cellModel
        let contentType=cellModel?.contentType
        if contentType==0 {
            //文字
                    let cell=tableView.dequeueReusableCell(withIdentifier: textSessionCell, for: indexPath) as! YFTextSessionCell
            
                   cell.setCellModel(model: sessionArray[indexPath.row])
            
                    return cell
        }else if contentType==1{
            //图片
            let cell=tableView.dequeueReusableCell(withIdentifier: imageSessionCell, for: indexPath) as! YFImageSessionCell
            
            cell.setCellModel(model: sessionArray[indexPath.row])
            
            
            return cell
        }else{
            //语音
                            let cell=tableView.dequeueReusableCell(withIdentifier: voiceSessionCell, for: indexPath) as! YFVoiceSessionCell
            
                            cell.setCellModel(model: sessionArray[indexPath.row])
            
            
                            return cell
        }

        

        
        
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let model=sessionArray[indexPath.row]
       
        return model.cellHeight!
 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        inputTextView.endEditing(true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
