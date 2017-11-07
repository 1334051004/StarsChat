//
//  YFImageSessionCell.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/11/1.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFImageSessionCell: UITableViewCell {
    
    private var userImageView:UIImageView!
    private var contentImageView:UIImageView!
    private var bgImageView:UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
 
        self.backgroundColor = UIColor.YF_RGB(r: 223, g: 255, b: 223)
       
        userImageView=UIImageView()
        userImageView.layer.masksToBounds=true
        userImageView.layer.cornerRadius=5
        contentView.addSubview(userImageView)
        
        bgImageView=UIImageView()
       
        
        contentImageView=UIImageView()
        contentView.addSubview(contentImageView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCellModel(model:YFSessionCellModel) {
        let source=model.cellModel?.contentSource
        if source==0 {
            userImageView.frame = CGRect.init(x: 10, y: 10, width: 50, height: 50)
            userImageView.image=UIImage.init(named: (model.cellModel?.userImage)!)
            
 
            contentImageView.frame = CGRect.init(x: 65, y: 10, width: CGFloat((model.cellModel?.width)!), height: CGFloat((model.cellModel?.height)!))
            if model.cellModel?.content is String{
                let image=model.cellModel?.content as! String
                contentImageView.image =  UIImage.init(named: image)
            }else{
                let image=model.cellModel?.content as! UIImage
                contentImageView.image = image  
            }
            
            bgImageView.frame =  contentImageView.bounds
            bgImageView.image = UIImage.init(named: "接收气泡")?.stretchableImage(withLeftCapWidth:50, topCapHeight: 50)
     
            contentImageView.layer.mask=bgImageView.layer
        }else{
            userImageView.frame = CGRect.init(x:UIScreen.YF_Width - 60, y: 10, width: 50, height: 50)
            userImageView.image=UIImage.init(named: (model.cellModel?.userImage)!)
            
 
            contentImageView.frame = CGRect.init(x: 65, y: 10, width: CGFloat((model.cellModel?.width)!), height: CGFloat((model.cellModel?.height)!))
 
            if model.cellModel?.content is String{
                let image=model.cellModel?.content as! String
                contentImageView.image =  UIImage.init(named: image)
            }else{
                let image=model.cellModel?.content as! UIImage
                contentImageView.image = image
            }
            
            bgImageView.frame =  contentImageView.bounds
            bgImageView.image = UIImage.init(named: "发送气泡")?.stretchableImage(withLeftCapWidth:50, topCapHeight: 50)
            
            contentImageView.layer.mask=bgImageView.layer
 
        }
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
