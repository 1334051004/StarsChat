//
//  YFAudioTool.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/11/17.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit
import AVFoundation
class YFAudioTool: NSObject {

    var audioRecorder:AVAudioRecorder?
    let file_path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first?.appending("/record.caf")
    let recordSettings = [AVSampleRateKey : NSNumber(value: Float(44100.0)),//声音采样率
        AVFormatIDKey : NSNumber(value: Int32(kAudioFormatAppleIMA4)),//编码格式
        AVNumberOfChannelsKey : NSNumber(value: 1),//采集音轨
        AVEncoderAudioQualityKey : NSNumber(value:Int8(AVAudioQuality.high.rawValue)),
        AVLinearPCMIsFloatKey:NSNumber.init(value: 8)]
    
    let audioSession = AVAudioSession.sharedInstance()
    var audioPlayer:AVAudioPlayer? = nil
    var voliceTimer:Timer? = nil
    
    static var audioTool:YFAudioTool?
    
    static func share()->(YFAudioTool){
    
      if audioTool == nil {
          audioTool=YFAudioTool()
        
          //设置session类型
          audioTool?.setUp()
        
      }
        return audioTool!
    
 
    }
    
    func setUp() {
       
        
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
        } catch let err{
            print("设置类型失败:\(err.localizedDescription)")
        }
        //设置session动作
        do {
            try audioSession.setActive(true)
        } catch let err {
            print("初始化动作失败:\(err.localizedDescription)")
        }
    }
    
    func startRecord(){
        
        audioSession.requestRecordPermission { (allowed) in
             if !allowed{
                print("无法访问您的麦克风")
            }
        }
        
//            if !allowed{
//                let alertView = UIAlertView(title: "无法访问您的麦克风" , message: "请到设置 -> 隐私 -> 麦克风 ，打开访问权限", delegate: nil, cancelButtonTitle: "取消", otherButtonTitles: "好的")
//                alertView.show()
//                self.isAllowed = false
//            }else{
//                self.isAllowed = true
//            }
       
       
        do {
            let url = URL(fileURLWithPath: file_path!)
            audioRecorder = try AVAudioRecorder(url: url, settings: recordSettings)
            audioRecorder?.isMeteringEnabled=true
            audioRecorder!.prepareToRecord()
        
            audioRecorder!.record()
            voliceTimer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateVolice), userInfo: nil, repeats: true)
            print("开始录音")
        } catch let err {
            print("录音失败:\(err.localizedDescription)")
        }
       
      
    }
    
    func stopRecord(){
        
        audioRecorder!.stop()
        voliceTimer?.fireDate = NSDate.distantFuture
    }
    
    func playRecord(){
      
            do {
              
               audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: file_path!))
                
                audioPlayer?.delegate=self
                audioPlayer?.volume=1
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch let err {
                print("播放失败:\(err.localizedDescription)")
            }
  
    }
    
    @objc func updateVolice(){
        
        audioRecorder?.updateMeters()
 
        //let averagePower = audioRecorder!.averagePower(forChannel: 0) //获取音量的平均值
        let peakPower = audioRecorder!.peakPower(forChannel: 0) //获取音量最大值
        //转换最高分贝值，范围是0到1。0最小，1最大。
        let peakPowerForChannel = pow(10, (0.05 * peakPower));
  
        print("\(peakPower,peakPowerForChannel)")
        
    }
    
    
}


extension YFAudioTool:AVAudioPlayerDelegate{
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag{ print("播放完成!") }
    }
}
