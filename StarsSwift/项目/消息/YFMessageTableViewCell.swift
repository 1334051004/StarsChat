//
//  YFMessageTableViewCell.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/10/31.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFMessageTableViewCell: UITableViewCell {
    
    var userImageView:UIImageView!
    var userNameLabel:UILabel!
    var dateLabel:UILabel!
    var introductionLabel:UILabel!
    var messageCountLabel:UILabel!
    
    private let margin:CGFloat = 10
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        userImageView=UIImageView.init(frame: CGRect.init(x: margin, y: margin, width: 50, height: 50))
        userImageView.layer.masksToBounds=true
        userImageView.layer.cornerRadius=5
        contentView.addSubview(userImageView)
        
        messageCountLabel=UILabel.init(frame: CGRect.init(x: 50, y: 5, width: 18, height: 18))
        messageCountLabel.backgroundColor=UIColor.YF_RGB(r: 255, g: 71, b: 91)
        messageCountLabel.textColor = .white
        messageCountLabel.textAlignment = .center
        messageCountLabel.layer.masksToBounds=true
        messageCountLabel.layer.cornerRadius=9
        messageCountLabel.font=UIFont.systemFont(ofSize: 12)
        contentView.addSubview(messageCountLabel)
        
        userNameLabel=UILabel.init(frame: CGRect.init(x: 70, y: 15, width: UIScreen.YF_Width-170, height: 20))
        userNameLabel.textColor=UIColor.YF_RGB(r: 20, g: 20, b: 20)
        contentView.addSubview(userNameLabel)
        
        
        dateLabel=UILabel.init(frame: CGRect.init(x: UIScreen.YF_Width-100-margin, y: margin, width: 100, height: 20))
        dateLabel.font=UIFont.systemFont(ofSize: 14)
        dateLabel.textAlignment = .right
        dateLabel.textColor=UIColor.YF_RGB(r: 120, g: 120, b: 120)
        contentView.addSubview(dateLabel)
        
        
        introductionLabel=UILabel.init(frame: CGRect.init(x: 70, y: 39, width: UIScreen.YF_Width-70-margin, height: 20))
        introductionLabel.font=UIFont.systemFont(ofSize: 14)
        introductionLabel.textColor=UIColor.YF_RGB(r: 120, g: 120, b: 120)
        contentView.addSubview(introductionLabel)
    
        let lineView=UIView.init(frame: CGRect.init(x: 0, y: 69, width: UIScreen.YF_Width, height: 1))
        lineView.backgroundColor=UIColor.YF_RGB(r: 249, g: 249, b: 249)
        contentView.addSubview(lineView)
    }
    
    func setModel(model:YFMessageModel) {
        userImageView.image=UIImage.init(named: model.userImage!)
        
        let messageCount=model.messageCount!
        if messageCount == "0" {
            messageCountLabel.isHidden=true
        }else{
            let center=messageCountLabel.center
            messageCountLabel.text=messageCount
            let width = messageCount.YF_Width( font: messageCountLabel.font, height: 20)
            var frame = messageCountLabel.frame
            frame.size.width = (width<18 ? 18 : width+5)
            messageCountLabel.frame = frame
            messageCountLabel.center=center
        }
        
        userNameLabel.text=model.userName!
        dateLabel.text=model.date!
        introductionLabel.text=model.introduction!

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
