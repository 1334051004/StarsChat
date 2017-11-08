//
//  YFTextSessionCell.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/10/31.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFTextSessionCell: UITableViewCell {

    var userImageView:UIImageView!
    var bgImageView:UIImageView!
    var userTextLabel:UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.YF_RGB(r: 223, g: 255, b: 223)
        userImageView = UIImageView()
        userImageView.layer.masksToBounds=true
        userImageView.layer.cornerRadius=5
        contentView.addSubview(userImageView)
 
        bgImageView=UIImageView()
        contentView.addSubview(bgImageView)
        
        userTextLabel=UILabel()
        userTextLabel.numberOfLines = 0
        userTextLabel.font=UIFont.systemFont(ofSize: 18)
        userTextLabel.textColor=UIColor.YF_RGB(r: 20, g: 20, b: 20)
        bgImageView.addSubview(userTextLabel)
 
    }
    
    func setCellModel(model:YFSessionCellModel) {
        let source=model.cellModel?.contentSource
        if source==0 {
            userImageView.frame = CGRect.init(x: 10, y: 10, width: 50, height: 50)
            userImageView.image=UIImage.init(named: (model.cellModel?.userImage)!)
            
            bgImageView.frame = CGRect.init(x: 65, y: 10, width: model.contentWidth!+30, height: model.contentHeight!)
            bgImageView.image = UIImage.init(named: "接收气泡")?.stretchableImage(withLeftCapWidth:50, topCapHeight: 50)
            
            
            userTextLabel.frame=CGRect.init(x: 15, y: 0, width: model.contentWidth!+10, height: model.contentHeight!)
            userTextLabel.text=model.cellModel?.content as? String
            userTextLabel.textColor = .white
            
            
        }else{
            userImageView.frame = CGRect.init(x:UIScreen.YF_Width - 60, y: 10, width: 50, height: 50)
            userImageView.image=UIImage.init(named: (model.cellModel?.userImage)!)
            
            bgImageView.frame = CGRect.init(x: UIScreen.YF_Width - model.contentWidth!-35-70, y: 10, width: model.contentWidth!+35, height: model.contentHeight!)
            bgImageView.image = UIImage.init(named: "发送气泡")?.stretchableImage(withLeftCapWidth:50, topCapHeight: 50)
            
            userTextLabel.frame=CGRect.init(x: 15, y: 0, width: model.contentWidth!+10, height: model.contentHeight!)
            userTextLabel.text=model.cellModel?.content as? String
            userTextLabel.textColor=UIColor.YF_RGB(r: 20, g: 20, b: 20)
          
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
