//
//  YFVoiceSessionCell.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/11/1.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFVoiceSessionCell: UITableViewCell {

      private var userImageView:UIImageView!
      private var voiceImageView:UIImageView!
      private var bgImageView:UIImageView!
    var playVoice:(()->())?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
         self.backgroundColor = UIColor.YF_RGB(r: 223, g: 255, b: 223)
        userImageView=UIImageView()
        userImageView.layer.masksToBounds=true
        userImageView.layer.cornerRadius=5
        contentView.addSubview(userImageView)
        
        bgImageView=UIImageView()
        bgImageView.isUserInteractionEnabled=true
        contentView.addSubview(bgImageView)
        
        voiceImageView=UIImageView()
        voiceImageView.isUserInteractionEnabled=true
        bgImageView.addSubview(voiceImageView)
        
        
        let tap=UITapGestureRecognizer.init(target: self, action: #selector(palyVoiceGesture))
        voiceImageView.addGestureRecognizer(tap)
   
    }
    
    @objc func palyVoiceGesture(){
        if playVoice != nil {
            playVoice!()
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.voiceImageView.animationDuration = 1
            self.voiceImageView.startAnimating()
        }
   
    }
    
    func setCellModel(model:YFSessionCellModel) {
        let source=model.cellModel?.contentSource
        if source==0 {
            userImageView.frame = CGRect.init(x: 10, y: 10, width: 50, height: 50)
            userImageView.image=UIImage.init(named: (model.cellModel?.userImage)!)
            
            bgImageView.frame = CGRect.init(x: 65, y: 10, width: 80, height: 50)
            bgImageView.image = UIImage.init(named: "接收气泡")?.stretchableImage(withLeftCapWidth:30, topCapHeight: 30)
            
            voiceImageView.frame=CGRect.init(x: 5, y: 5, width: 80, height: 40)
            voiceImageView.image = UIImage.init(named: "icon_voice_left3")
            voiceImageView.animationImages = [
                UIImage.init(named: "icon_voice_left1")!,
                UIImage.init(named: "icon_voice_left2")!,
                UIImage.init(named: "icon_voice_left3")!]
        }else{
            userImageView.frame = CGRect.init(x:UIScreen.YF_Width - 60, y: 10, width: 50, height: 50)
            userImageView.image=UIImage.init(named: (model.cellModel?.userImage)!)
            
            bgImageView.frame = CGRect.init(x: UIScreen.YF_Width - 145, y: 10, width: 80, height: 50)
            bgImageView.image = UIImage.init(named: "发送气泡")?.stretchableImage(withLeftCapWidth:30, topCapHeight: 30)
            
            voiceImageView.frame=CGRect.init(x: 0, y: 5, width: 75, height: 40)
            voiceImageView.image = UIImage.init(named: "icon_voice_right3")
            voiceImageView.animationImages = [
                UIImage.init(named: "icon_voice_right1")!,
                UIImage.init(named: "icon_voice_right2")!,
                UIImage.init(named: "icon_voice_right3")!]
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

         self.selectionStyle = .none
        // Configure the view for the selected state
    }

}
