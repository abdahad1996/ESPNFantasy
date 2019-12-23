//
//  RugbyCells.swift
//  espnFantasyApp
//
//  Created by prog on 12/19/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
//
//  DashboardCells.swift
//  espnFantasyApp
//
//  Created by prog on 12/19/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
 

import UIKit

 

class RugbyCells: BaseCell {
    
 lazy var textlabel: UILabel = {
    let l = UILabel(text: "Biggest Week 12 Injury \nquestions for all 32 NFL teams", font: AppFont.Medium().sixteen, textColor:UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 1), textAlignment:.left , numberOfLines: 0)
 l.lineBreakMode = .byWordWrapping
 l.backgroundColor = .white
      return l
     
 }()
    lazy var textlabel2: UILabel = {
       let l = UILabel(text: "9/02/2019 - NFL Nation", font: AppFont.Medium().fourteen, textColor:UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), textAlignment:.left, numberOfLines: 1)
     l.backgroundColor = .white
         return l
        
    }()
   lazy var image: AspectFitImageView = {
             let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "katrina-berban-k24k1INxuxk-unsplash 1"), cornerRadius: 0)
//    imageView.constrainHeight(100)
//    imageView.constrainWidth(100)
             return  imageView
         }()
 
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        backgroundColor = .white
        let v1 = stack(textlabel,UIView(),textlabel2).padTop(10)
       let mainStack = hstack(image,v1,UIView())
        mainStack.spacing = 10
       
        
        setupShadow(opacity: 1, radius: 14, offset: CGSize(width: 0, height: 1), color:  UIColor(red: 0, green: 0, blue: 0, alpha: 0.17))
    }
}
