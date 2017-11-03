//
//  YFEmojiCollectionViewCell.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/11/3.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFEmojiCollectionViewCell: UICollectionViewCell {
    
    var emojiBtn=UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        emojiBtn.contentMode = .scaleAspectFit
        emojiBtn.imageView?.contentMode = .scaleAspectFit
        emojiBtn.isUserInteractionEnabled = false;
        emojiBtn.frame=self.bounds
        self.contentView.addSubview(emojiBtn)
        
    }
    
  
 
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
