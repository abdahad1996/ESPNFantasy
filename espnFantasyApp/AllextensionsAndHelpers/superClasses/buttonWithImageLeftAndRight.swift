//
//  buttonWithImageLeftAndRight.swift
//  espnFantasyApp
//
//  Created by prog on 12/28/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit

class buttonWithImageLeftRight:UIView{

    
    

        lazy var leftImage:AspectFitImageView = {
            var m = AspectFitImageView()
            m.image = #imageLiteral(resourceName: "time")
            return m
        }()
    lazy var RightImage:AspectFitImageView = {
               var m = AspectFitImageView()
               m.image = #imageLiteral(resourceName: "drop-down-arrow 1")
               return m
           }()
//        lazy var checkboxImagebg:UIImageView = {
//            var m = UIImageView()
//            m.image = #imageLiteral(resourceName: "Ellipse 5")
//            return m
//        }()
        
        lazy var checkboxLabel:UILabel = {
            var a = UILabel()
            a.textColor = UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1)
            a.numberOfLines = 1
            a.font = AppFont.Medium().twelve
            a.textAlignment = .center
            return a
        }()
        
        lazy var checkboxButton:UIButton = {
            var u = UIButton()
//            u.addTarget(self, action: #selector(checkboxButtonAction), for: .touchUpInside)
            
            
            return u
        }()
        
//        var isChecked:Bool = false{
//            didSet{
//                if isChecked{
//                    UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
//                        self.checkboxImage.image = #imageLiteral(resourceName: "Ellipse 10")
//                    }, completion: nil)
//
//                }else{
//                    UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
//                        self.checkboxImage.image = #imageLiteral(resourceName: "Ellipse 5")
//                                   }, completion: nil)
//                }
//            }
    //    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        let h = hstack(leftImage.withWidth(20).withHeight(20),checkboxLabel,RightImage.withHeight(8).withWidth(8))
        h.spacing = 2
        h.distribution = .fill
//        layer.cornerRadius = self.frame.height/2
        layoutIfNeeded()
        h.padLeft(10).padRight(10)
        
//           self.addSubview(leftImage)
        
//            self.addSubview(checkboxLabel)
//            self.addSubview(RightImage)
//            self.addSubview(checkboxButton)
//
//                leftImage.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 8), size: .init(width: 20, height: 20))
//                leftImage.centerYToSuperview()
//
////                 checkboxImage.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 30, height: 30))
////                checkboxImagebg.centerYTo(self.centerYAnchor)
////                checkboxImage.centerYTo(checkboxImagebg.centerYAnchor)
////                checkboxImage.centerXTo(checkboxImagebg.centerXAnchor)
//
//
//
//
//                checkboxLabel.anchor(top: nil, leading: leftImage.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 15, bottom: 0, right: -12), size: .zero)
//                checkboxLabel.centerYTo(self.centerYAnchor)
//
//
//                checkboxButton.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
//
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    convenience init(rimage:UIImage,mainText:String,limage:UIImage,backgroundColor: UIColor = UIColor(red: 1, green: 0.882, blue: 0.879, alpha: 1)) {
           self.init()
        RightImage.image = rimage
        checkboxLabel.text = mainText
        leftImage.image = limage
        self.backgroundColor = backgroundColor
       }
     
//        @objc private func checkboxButtonAction(){
//            isChecked = !isChecked
//        }

    }


