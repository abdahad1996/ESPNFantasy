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
 
    lazy var logo: AspectFitImageView = {
        let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "ball"), cornerRadius: 20)
       
        return  imageView
    }()
    lazy var logoFantasy: AspectFitImageView = {
           let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "Fantasy"), cornerRadius: 0)
          
           return  imageView
       }()
    lazy var logoBasketBall: AspectFitImageView = {
           let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "Basketballlogo"), cornerRadius: 0)
          
           return  imageView
       }()
   
    lazy var signUpTodayLabel: UILabel = {
        let l = UILabel(text: nil, font: AppFont.Bold().thirtyfour, textColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1), textAlignment: .left, numberOfLines: 0)
        l.attributedText = NSMutableAttributedString(string: "SIGNUP \nTODAY", attributes: [NSAttributedString.Key.kern: 0.51])
        return l
    }()
    lazy var inviteLabel: UILabel = {
        let l = UILabel(text: "Create or join a free Fantasy Basketball League\nwith Standard or custom rules.", font: AppFont.Regular().fourteen, textColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1), textAlignment: .left, numberOfLines: 0)
        
        return l
    }()
    lazy var getATeambtn : UIButton = {
        let b = UIButton(title: "Get a Team", titleColor: UIColor(red: 0.906, green: 0.216, blue: 0.196, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
        b.withWidth(60)
              b.withHeight(40)
              b.buttonBorder(withRadius:20 , width: 2,color: .white)
        return b
    }()
    lazy var createLeague : UIButton = {
           let b = UIButton(title: "Create League", titleColor: UIColor(red: 0.906, green: 0.216, blue: 0.196, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
        b.withWidth(60)
              b.withHeight(40)
              b.buttonBorder(withRadius:20 , width: 2,color: .white)
           return b
       }()
    lazy var mockDraft : UIButton = {
           let b = UIButton(title: "Mock Draft", titleColor: UIColor(red: 0.906, green: 0.216, blue: 0.196, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
        b.withWidth(60)
        b.withHeight(40)
        b.buttonBorder(withRadius:20 , width: 2,color: .white)
           return b
       }()
    override func setupViews() {
        setGradientBackground(colorOne: MyColors.BasketBall().backgroundGradient1, colorTwo: MyColors.BasketBall().backgroundGradient2)
        let vSubStack = stack(logoFantasy.withHeight(20),logoBasketBall.withHeight(20))
        vSubStack.spacing = -5
        
        let v1 = stack(logo.withWidth(50).withHeight(50),vSubStack)
        v1.distribution = .fillEqually
        let h1 = hstack(UIView(backgroundColor: .yellow),v1).padRight(-20)
        h1.distribution = .fillEqually
        h1.alignment = .center
//        let h2 = hstack(UIView(backgroundColor: .green),logoFantasy.withWidth(40).withHeight(40)).padRight(20)
//        let h1 = hstack(UIView(backgroundColor: .green),logoBasketBall.withWidth(40).withHeight(40)).padRight(20)
        let h2 = hstack(getATeambtn,createLeague,mockDraft)
        h2.spacing = 10
        h2.distribution = .fillEqually
        let v2 = stack(signUpTodayLabel,inviteLabel,UIView())
         v2.spacing = 10
        v2.distribution = .fill
        let v3 = stack(v2,h2)
        
        let mainContainer = stack(h1.withHeight(100),v3).padLeft(10).padRight(10).padTop(10).padBottom(10)
        mainContainer.spacing = -10
        
       
    }
}
