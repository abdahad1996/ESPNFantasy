//
//  PlayCell.swift
//  espnFantasyApp
//
//  Created by prog on 12/24/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit
class PlayCells: BaseCell {
    
 lazy var textlabel: UILabel = {
    let l = UILabel(text: "Fantasy Soccer", font: AppFont.Medium().sixteen, textColor:UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 1), textAlignment:.left , numberOfLines: 1)
 l.lineBreakMode = .byWordWrapping
 l.backgroundColor = .white
      return l
     
 }()
    lazy var textlabel2: UILabel = {
       let l = UILabel(text: "Pick the top Champions league players\neach week. Play the season against \nfamily and friends.", font: AppFont.Medium().fourteen, textColor:UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), textAlignment:.left, numberOfLines: 0)
        l.lineBreakMode = .byWordWrapping
     l.backgroundColor = .white
         return l
        
    }()
   lazy var image: AspectFitImageView = {
             let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "football 1"), cornerRadius: 0)
//    imageView.constrainHeight(100)
//    imageView.constrainWidth(100)
             return  imageView
         }()
    
    lazy var letsPlay: UIButton = {
         let letsPlay = UIButton(title: "Tap to Play", titleColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1), font: AppFont.Bold().twelve, backgroundColor:UIColor(red: 0.945, green: 0.71, blue: 0.118, alpha: 1), target: self, action: nil)
        return letsPlay
    }()
     
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        backgroundColor = .white
        letsPlay.withHeight(20)
        let v1 = stack(UIView().withHeight(10),textlabel,textlabel2,UIView()).padTop(20)
        let v2 = stack(letsPlay,UIView()).padTop(10)

        let mainStack = hstack(image,v1,v2).padLeft(10)
        mainStack.spacing = 10
       
        
        setupShadow(opacity: 1, radius: 14, offset: CGSize(width: 0, height: 1), color:  UIColor(red: 0, green: 0, blue: 0, alpha: 0.17))
    }
}

 
