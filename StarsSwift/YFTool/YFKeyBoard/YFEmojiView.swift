//
//  YFEmojiView.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/11/3.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFEmojiView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {

    private var emojiIconArray=[String]()
    private var emojiTextArray=[String]()
    private let collectionCell="YFEmojiCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let path=Bundle.main.path(forResource: "emotion_icons.plist", ofType: nil)
        
        let tempArray  =  NSArray.init(contentsOfFile: path!)!
        for temp in tempArray{
            let i = tempArray.index(of: temp) + 1
            if ( i%28==0) {
                emojiIconArray.append("deleteButtonId")
                emojiTextArray.append("deleteButtonId")
               
            }else{
                
              let dict=temp as! Dictionary<String, String>
              emojiIconArray.append(dict["image"]!)
              emojiTextArray.append(dict["text"]!)
                
            }
        }
  
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: UIScreen.YF_Width/7, height: 40)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing=0
        layout.minimumInteritemSpacing=0
        
        let collectionView=UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height-35), collectionViewLayout: layout)
        collectionView.isDirectionalLockEnabled=true
        collectionView.isPagingEnabled=true
        collectionView.delegate=self
        collectionView.dataSource=self
        collectionView.backgroundColor=UIColor.YF_RGB(r: 243, g: 243, b: 243)
        collectionView.showsHorizontalScrollIndicator=false
 
        collectionView.register(YFEmojiCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: collectionCell)
        self.addSubview(collectionView)
        
        
        let sendBtn=UIButton.init(frame: CGRect.init(x: self.bounds.width-80, y: collectionView.frame.maxY, width: 80, height: 35))
        sendBtn.setTitle("发送", for: .normal)
        sendBtn.setTitleColor(.white, for: .normal)
        sendBtn.titleLabel?.font=UIFont.systemFont(ofSize: 15)
        sendBtn.backgroundColor=UIColor.YF_RGB(r: 11, g: 160, b: 98)
        self.addSubview(sendBtn)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojiIconArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: collectionCell, for: indexPath) as! YFEmojiCollectionViewCell
        let imageName=emojiIconArray[indexPath.row]
        cell.emojiBtn.setImage(UIImage.init(named: imageName), for: .normal)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
