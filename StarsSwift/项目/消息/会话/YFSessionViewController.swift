//
//  YFSessionViewController.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/10/31.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFSessionViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

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
            ["userImage":userImage ,"content":"image2","contentType":1,"contentSource":0,"width":240,"height":160],
            ["userImage":userImage ,"content":"image","contentType":1,"contentSource":1,"width":240,"height":160],
            ["userImage":userImage ,"content":"123","contentType":2,"contentSource":0,"width":240,"height":160],
            ["userImage":userImage ,"content":"123","contentType":2,"contentSource":1,"width":240,"height":160]]
        for dict in array {
           let model =  YFSessionModel.init(dict:dict)
            let cellModel = YFSessionCellModel.init(model: model)
           sessionArray.append(cellModel)
        }
        
    }
    private  func initUI(){
        let tableH = UIScreen.YF_Height - UIScreen.YF_StatusBarHeight - (self.navigationController?.navigationBar.bounds.height)!-50
        sessionTableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.YF_Width, height: tableH), style: .plain)
        sessionTableView.separatorStyle = .none
        sessionTableView.delegate=self
        sessionTableView.backgroundColor = .white
        sessionTableView.dataSource=self
        sessionTableView.register(YFTextSessionCell.classForCoder(), forCellReuseIdentifier: textSessionCell)
        sessionTableView.register(YFImageSessionCell.classForCoder(), forCellReuseIdentifier: imageSessionCell)
        sessionTableView.register(YFVoiceSessionCell.classForCoder(), forCellReuseIdentifier: voiceSessionCell)
        view.addSubview(sessionTableView)
  
        if #available(iOS 11.0, *) {
            sessionTableView.contentInsetAdjustmentBehavior = .never
            
            if __CGSizeEqualToSize(UIScreen.main.bounds.size, CGSize.init(width: 375.0, height: 812.0))||__CGSizeEqualToSize(UIScreen.main.bounds.size, CGSize.init(width: 812.0, height: 375.0)){
                var frame=sessionTableView.frame
                frame.size.height = frame.size.height - 34.0
                sessionTableView.frame=frame
            }
           
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
       
        
       
        
        //添加消息输入框
        inputTextView.frame=CGRect.init(x: 0, y: sessionTableView.frame.maxY, width: UIScreen.YF_Width, height: 50)
        inputTextView.backgroundColor = UIColor.YF_RGB(r: 243, g: 243, b: 243)
        inputTextView.changeChatTableViewFrame = {[weak self] (height)->() in
            var frame = self?.sessionTableView.frame
            frame?.size.height = height
            self?.sessionTableView.frame = frame!
            
            self?.sessionTableView.scrollToRow(at: IndexPath.init(row: (self?.sessionArray.count)!-1, section: 0), at: UITableViewScrollPosition.bottom, animated: false)
        }
        inputTextView.setInputTextViewMaxHeight(height: 4)
        view.addSubview(inputTextView)
        
        //发送文本消息
        inputTextView.sendTextClick = {[weak self] (text:String)->()  in
            let dict = ["userImage":self?.userImage ?? "" ,"content":text,"contentType":0,"contentSource":1,"width":0,"height":0] as [String : Any]
            let model =  YFSessionModel.init(dict:dict)
            let cellModel = YFSessionCellModel.init(model: model)
            self?.sessionArray.append(cellModel)
            self?.sessionTableView.insertRows(at: [IndexPath.init(row: (self?.sessionArray.count)!-1, section: 0)], with: .none)
            self?.sessionTableView.scrollToRow(at: IndexPath.init(row: (self?.sessionArray.count)!-1, section: 0), at: UITableViewScrollPosition.bottom, animated: false)
        }
       
        //打开相册  相机  AR
        inputTextView.moreBtnView.moreBtnClick = {[weak self] (index:Int)->()  in
                        switch index {
                        case 0: //选择照片
                            let imagePickerController=UIImagePickerController()
                            imagePickerController.sourceType = .photoLibrary
                            imagePickerController.delegate = self
                
                            imagePickerController.navigationBar.setBackgroundImage(UIImage.init(named: "导航条"), for: .default)
                            imagePickerController.navigationBar.tintColor=UIColor.white
                            
                            imagePickerController.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white];
                            
                            self?.present(imagePickerController, animated: true, completion: nil)
                        case 1: //打开相机
                            let imagePickerController=UIImagePickerController()
                            imagePickerController.sourceType = .camera
                            imagePickerController.delegate = self
                            self?.present(imagePickerController, animated: true, completion: nil)
                        case 2: //AR场景
                            if #available(iOS 11.0, *) {
                                let arVC = YFARViewController()
                                self?.present(arVC, animated: true, completion: nil)
                            } else {
                                // Fallback on earlier versions
                                
                            }
                           
                        default:
                            break
                        }
                    }
 
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        let image=info[UIImagePickerControllerOriginalImage] as! UIImage
        let height = 240 / image.size.width * image.size.height
        let dict = ["userImage":userImage ,"content":image,"contentType":1,"contentSource":1,"width":240,"height":Int(height)] as [String : Any]
        let model =  YFSessionModel.init(dict:dict)
        let cellModel = YFSessionCellModel.init(model: model)
        sessionArray.append(cellModel)
        sessionTableView.insertRows(at: [IndexPath.init(row: sessionArray.count-1, section: 0)], with: .none)
        sessionTableView.scrollToRow(at: IndexPath.init(row: sessionArray.count-1, section: 0), at: UITableViewScrollPosition.bottom, animated: false)
        
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
    
   
    
 
}
