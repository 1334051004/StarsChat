//
//  YFInputView.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/11/1.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFInputView: UIView ,UITextViewDelegate{

    let voiceBtn=UIButton()
    lazy var recordBtn:YFVoiceBtn={
        let btn=YFVoiceBtn()
         btn.frame=CGRect.init(x: voiceBtn.frame.maxX+5, y: 6, width: UIScreen.YF_Width-115, height: 38)
     
        return btn
    }()
    private let inputTextView=UITextView()
    private let emojiBtn=UIButton()
    private let moreBtn=UIButton()
    var inputTextViewMaxHeight:CGFloat = 0
    private var keyBoardHeight:CGFloat = 0
    
    var changeChatTableViewFrame:((_ height:CGFloat)->())? = nil
    
    var sendTextClick:((_ text:String)->())?
      
    let moreBtnView = YFMoreBtnView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.YF_Width, height: 200),titleArray:["照片","拍摄","AR"])
    
 
    let emojiView = YFEmojiView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.YF_Width, height: 240))
   
    
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow , object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHidden), name:NSNotification.Name.UIKeyboardWillHide , object: nil)
        
        //语音按钮
        voiceBtn.frame=CGRect.init(x: 5, y: 10, width: 30, height: 30)
        voiceBtn.setImage(UIImage.init(named: "liaotian_ic_yuyin_nor"), for: .normal)
        voiceBtn.setImage(UIImage.init(named: "liaotian_ic_press"), for: .highlighted)
        voiceBtn.addTarget(self, action: #selector(clickVoiceBtn), for: .touchUpInside)
        self.addSubview(voiceBtn)
        
        //文本输入框
        inputTextView.frame=CGRect.init(x: voiceBtn.frame.maxX+5, y: 6, width: UIScreen.YF_Width-115, height: 38)
        inputTextView.font=UIFont.systemFont(ofSize: 18)
        inputTextView.layer.cornerRadius=3
        inputTextView.layer.masksToBounds=true
        inputTextView.returnKeyType = .send
        inputTextView.enablesReturnKeyAutomatically=true
        inputTextView.delegate=self
        inputTextView.isScrollEnabled=false
        inputTextView.backgroundColor = .white
        self.addSubview(inputTextView)
        
        //表情按钮
        emojiBtn.frame=CGRect.init(x: inputTextView.frame.maxX+5, y: 10, width: 30, height: 30)
        emojiBtn.setImage(UIImage.init(named: "liaotian_ic_biaoqing_nor"), for: .normal)
        emojiBtn.setImage(UIImage.init(named: "liaotian_ic_biaoqing_press"), for: .highlighted)
        emojiBtn.addTarget(self, action: #selector(clickEmojiBtn), for: .touchUpInside)
        self.addSubview(emojiBtn)
        //表情输入
        emojiView.inputEmoji = {[weak self] (text:String)->() in
            self?.inputTextView.text = self?.inputTextView.text.appending(text)
            self?.textViewDidChange((self?.inputTextView)!)
        }
        emojiView.sendEmoji={ [weak self] in
            
            guard let text=self?.inputTextView.text else{
                return
            }
            
            if !text.isEmpty{
                if self?.sendTextClick != nil{
                    self?.sendTextClick!(text)
                }
            }
 
        }
        //兼容iPhone X
        if #available(iOS 11.0, *) {
            if __CGSizeEqualToSize(UIScreen.main.bounds.size, CGSize.init(width: 375.0, height: 812.0))||__CGSizeEqualToSize(UIScreen.main.bounds.size, CGSize.init(width: 812.0, height: 375.0)){
                emojiView.frame=CGRect.init(x: 0, y: 0, width: UIScreen.YF_Width, height: 274)
            }
        }
        
        
 
        //更多操作按钮
        moreBtn.frame=CGRect.init(x: emojiBtn.frame.maxX+5, y: 10, width: 30, height: 30)
        moreBtn.setImage(UIImage.init(named: "liaotian_ic_gengduo_nor"), for: .normal)
        moreBtn.setImage(UIImage.init(named: "liaotian_ic_gengduo_press"), for: .highlighted)
        moreBtn.addTarget(self, action: #selector(clickMoreBtn), for: .touchUpInside)
        self.addSubview(moreBtn)
    
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //切换录音
    @objc func clickVoiceBtn(){
        emojiBtn.isSelected = false
        moreBtn.isSelected=false
        
        voiceBtn.isSelected = !voiceBtn.isSelected
        if voiceBtn.isSelected {
            self.inputTextView.resignFirstResponder()
            var frame=self.frame;
            frame.origin.y=UIScreen.YF_Height-64-50
            frame.size.height=50
            self.frame=frame
            inputTextView.frame=CGRect.init(x: voiceBtn.frame.maxX+5, y: 6, width: UIScreen.YF_Width-115, height: 38)
            self.inputTextViewFrameChange(y: UIScreen.YF_Height-self.bounds.height-64 )
            //兼容iPhone X
            if #available(iOS 11.0, *) {
                if __CGSizeEqualToSize(UIScreen.main.bounds.size, CGSize.init(width: 375.0, height: 812.0))||__CGSizeEqualToSize(UIScreen.main.bounds.size, CGSize.init(width: 812.0, height: 375.0)){
                    self.inputTextViewFrameChange(y: UIScreen.YF_Height-self.bounds.height-122 )
                }
            }
            
            self.addSubview(recordBtn)
        }else{
            self.inputTextView.becomeFirstResponder()
            textViewDidChange(inputTextView)
            recordBtn.removeFromSuperview()
        }
    }
    //切换更多功能
    @objc func clickMoreBtn(){
        
        emojiBtn.isSelected = false
        recordBtn.isSelected=false
        recordBtn.removeFromSuperview()
  
        moreBtn.isSelected = !moreBtn.isSelected
        if moreBtn.isSelected {
             inputTextView.inputView=moreBtnView
        }else{
           inputTextView.inputView=nil
        }
         self.inputTextView.resignFirstResponder()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1, execute: {
            self.inputTextView.becomeFirstResponder()
        })
        
        
    }
    //切换表情键盘
    @objc func clickEmojiBtn(){
        
        moreBtn.isSelected = false
        recordBtn.isSelected=false
        recordBtn.removeFromSuperview()
        
        emojiBtn.isSelected = !emojiBtn.isSelected
        if emojiBtn.isSelected {
            inputTextView.inputView=emojiView
        }else{
            inputTextView.inputView=nil
        }
        self.inputTextView.resignFirstResponder()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1, execute: {
            self.inputTextView.becomeFirstResponder()
        })
    }
    
    @objc func keyboardWillShow(notification:Notification){
        let keyBoardFrame=notification.userInfo![UIKeyboardFrameEndUserInfoKey]
        as! CGRect
        keyBoardHeight=keyBoardFrame.size.height
        
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey]
 
        UIView.animate(withDuration: duration as! TimeInterval) {
            self.inputTextViewFrameChange(y: UIScreen.YF_Height-self.keyBoardHeight-self.bounds.height-64 )
            //兼容iPhone X
            if #available(iOS 11.0, *) {
                if __CGSizeEqualToSize(UIScreen.main.bounds.size, CGSize.init(width: 375.0, height: 812.0))||__CGSizeEqualToSize(UIScreen.main.bounds.size, CGSize.init(width: 812.0, height: 375.0)){
                   self.inputTextViewFrameChange(y: UIScreen.YF_Height-self.keyBoardHeight-self.bounds.height-88 )
                }
            }
        }
 
    }
    
    @objc func keyboardWillHidden(notification:Notification){
 
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey]
        
        UIView.animate(withDuration: duration as! TimeInterval) {
            self.inputTextViewFrameChange(y: UIScreen.YF_Height-64-self.bounds.height)
            //兼容iPhone X
            if #available(iOS 11.0, *) {
                if __CGSizeEqualToSize(UIScreen.main.bounds.size, CGSize.init(width: 375.0, height: 812.0))||__CGSizeEqualToSize(UIScreen.main.bounds.size, CGSize.init(width: 812.0, height: 375.0)){
                    self.inputTextViewFrameChange(y: UIScreen.YF_Height-122-self.bounds.height)
                }
            }
        }
    }
    
    //改变InputView 的frame
    func  inputTextViewFrameChange(y:CGFloat){
        var frame=self.frame
        frame.origin.y = y
        self.frame=frame
        
        changeChatTableViewFrame(height: y)
    }
    
    //当键盘弹出的时候 隐藏的时候  改变聊天界面的Frame
     private func changeChatTableViewFrame(height:CGFloat) {
        if let change = changeChatTableViewFrame {
            change(height)
        }
    }
    func setInputTextViewMaxHeight(height:CGFloat=4){
        inputTextViewMaxHeight = ceil((inputTextView.font?.lineHeight)! * (height - 1) + inputTextView.textContainerInset.top + inputTextView.textContainerInset.bottom);
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let height:CGFloat = CGFloat(ceilf(Float(inputTextView.sizeThatFits(CGSize.init(width: inputTextView.bounds.width, height: CGFloat(MAXFLOAT))).height)))
        
        inputTextView.isScrollEnabled =  height > inputTextViewMaxHeight && inputTextViewMaxHeight > 0;
        
        var inputHeight:CGFloat = 0
        if (inputTextView.isScrollEnabled) {
            
            inputHeight = inputTextViewMaxHeight + 12
            var frame = inputTextView.frame
            frame.size.height=inputTextViewMaxHeight
            inputTextView.frame=frame
            
        } else {
            
            inputHeight = height + 12
            var frame = inputTextView.frame
            frame.size.height=height
            inputTextView.frame=frame
            
        }
        
       
        var selfFrame=self.frame
        selfFrame.size.height=inputHeight
        self.frame=selfFrame
        
        self.inputTextViewFrameChange(y: UIScreen.YF_Height - CGFloat(64) - keyBoardHeight - CGFloat(inputHeight))
        
        //兼容iPhone X
        if #available(iOS 11.0, *) {
            if __CGSizeEqualToSize(UIScreen.main.bounds.size, CGSize.init(width: 375.0, height: 812.0))||__CGSizeEqualToSize(UIScreen.main.bounds.size, CGSize.init(width: 812.0, height: 375.0)){
                 self.inputTextViewFrameChange(y: UIScreen.YF_Height - CGFloat(122) - keyBoardHeight - CGFloat(inputHeight))
            }
        }
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

         if (text == "\n") {
            //发送文本消息
            if !text.isEmpty{
              if sendTextClick != nil{
                sendTextClick!(inputTextView.text)
               }
                
               inputTextView.text = ""
               textViewDidChange(inputTextView)
            }
            return false
         }
         return true
    }
    
 
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        inputTextView.inputView=nil
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
   
        self.inputTextViewFrameChange(y: UIScreen.YF_Height-64-self.bounds.height)
        //兼容iPhone X
        if #available(iOS 11.0, *) {
            if __CGSizeEqualToSize(UIScreen.main.bounds.size, CGSize.init(width: 375.0, height: 812.0))||__CGSizeEqualToSize(UIScreen.main.bounds.size, CGSize.init(width: 812.0, height: 375.0)){
                 self.inputTextViewFrameChange(y: UIScreen.YF_Height-122-self.bounds.height)
            }
        }
        
        
        
    }
    

    
}
