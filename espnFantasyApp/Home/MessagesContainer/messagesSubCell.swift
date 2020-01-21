//
//  messagesSubCell.swift
//  espnFantasyApp
//
//  Created by prog on 12/30/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
//
//  editOwnerSubCell.swift
//  espnFantasyApp
//
//  Created by prog on 12/30/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit


 class messageSubCell: BaseCell {
     //make component subclass
  lazy var textlabel1: UILabel = {
     let l = UILabel(text: "HhH...........", font: AppFont.Bold().sixteen, textColor:UIColor(red: 0.004, green: 0.569, blue: 0.784, alpha: 1), textAlignment:.left , numberOfLines: 1)
   l.backgroundColor = .white
       return l
      
  }()
     lazy var textlabel2: UILabel = {
        let l = UILabel(text: "Bella Alex", font: AppFont.Medium().sixteen, textColor:UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment:.left, numberOfLines: 1)
      l.backgroundColor = .white
          return l
         
     }()
     lazy var textlabel3: UILabel = {
        let l = UILabel(text: "Team Alex", font: AppFont.Medium().fourteen, textColor:UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), textAlignment:.left, numberOfLines: 1)
      l.backgroundColor = .white
          return l
         
     }()
     lazy var textlabel4: UILabel = {
     let l = UILabel()
                         let primaryStr =  "Nov 27  "
                                 let secondaryString = "7:52 PM"
                         let attributedString = NSMutableAttributedString(string: "\(primaryStr)\(secondaryString)", attributes: [
                         .font: AppFont.Regular().twelve,
                         .foregroundColor: UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1)
                            ])
           
                         attributedString.addAttributes([
                         .font: AppFont.Regular().twelve,
                         .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                         ], range: NSRange(location: 0, length:  primaryStr.count))
           
                                 l.attributedText = attributedString
         l.numberOfLines = 1
           return l
       }()

     
     
     lazy var replylabel: UILabel = {
         let l = UILabel(text: "0 Replies", font: AppFont.Regular().sixteen, textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment:.left, numberOfLines: 1)
         l.backgroundColor = .white
             return l
            
        }()
     

 //   lazy var image: AspectFitImageView = {
 //             let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "katrina-berban-k24k1INxuxk-unsplash 1"), cornerRadius: 0)
 ////    imageView.constrainHeight(100)
 ////    imageView.constrainWidth(100)
 //             return  imageView
 //         }()
 // lazy var logoButton: UIButton = {
 //    let b = UIButton(title: "Remove", titleColor: .white, font: AppFont.Medium().twelve, backgroundColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1), target: self, action: nil)
 //
 //
 //     let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "upload 1"), cornerRadius: 0)
 //     let img = imageView.image
 //
 //
 //
 //            b.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 50)
 //      let imageG = #imageLiteral(resourceName: "upload 1")
 //            b.setImage(imageG.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
 //    b.tintColor = .white
 //
 //     return b
 // }()
 //
 //    var titleLabelHeightConstraint: NSLayoutConstraint?
     
     override func setupViews() {
         backgroundColor = .white
         let separator = UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withWidth(1)
         
         let v1 = stack(textlabel1,textlabel2,textlabel3,textlabel4,UIView().withHeight(5)) .padLeft(10)
         v1.spacing = 5
 //         let separatorStack1 = stack(UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1))
 //         separatorStack1.padTop(10).padBottom(10)
         let v2 = stack(UIView().withHeight(20),replylabel.withHeight(40),UIView())
 //        v2.distribution = .fill
 //        let h1 = hstack(v1,UIView(),v2.withWidth(150))
 //        logoButton.setCorner(withRadius: 20)
 //        h1.spacing = 5
         let h1 = hstack(v1,UIView(),separator,v2.withWidth(90)).padLeft(10).padRight(10).padTop(10)
         h1.spacing = 15
         h1.setCorner(withRadius: 12)
        
        
         setupShadow(opacity: 1, radius: 12, offset: CGSize(width: 0, height: 0), color:   UIColor(red: 0, green: 0, blue: 0, alpha: 0.14))
     }
 }

