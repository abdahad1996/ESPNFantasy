//
//  checkBox_label.swift
//  espnFantasyApp
//
//  Created by prog on 12/28/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
 import UIKit
class CheckBoxButton: UIView {

//    convenience init() {
//        self.init()
//
//    }
    lazy var checkboxImage:UIImageView = {
        var m = UIImageView()
        m.image = #imageLiteral(resourceName: "Ellipse 10")
        return m
    }()
    lazy var checkboxImagebg:UIImageView = {
        var m = UIImageView()
        m.image = #imageLiteral(resourceName: "Ellipse 5")
        return m
    }()
    
    lazy var checkboxLabel:UILabel = {
        var a = UILabel()
        a.textColor = UIColor(red: 0.321, green: 0.299, blue: 0.299, alpha: 1)
        a.numberOfLines = 0
        a.font = AppFont.Medium().fourteen
        return a
    }()
    
    lazy var checkboxButton:UIButton = {
        var u = UIButton()
        u.addTarget(self, action: #selector(checkboxButtonAction), for: .touchUpInside)
        
        
        return u
    }()
    
    var isChecked:Bool = false{
        didSet{
            if isChecked{
                UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                    self.checkboxImage.image = #imageLiteral(resourceName: "Ellipse 10")
                }, completion: nil)
                
            }else{
                UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                    self.checkboxImage.image = #imageLiteral(resourceName: "Ellipse 5")
                               }, completion: nil)
            }
        }
    }
    
    override func didMoveToWindow() {
        self.addSubview(checkboxImagebg)
        checkboxImagebg.addSubview(checkboxImage)
        self.addSubview(checkboxLabel)
        self.addSubview(checkboxButton)
//        hstack(<#T##views: UIView...##UIView#>, spacing: <#T##CGFloat#>, alignment: <#T##UIStackView.Alignment#>, distribution: <#T##UIStackView.Distribution#>)
        checkboxImagebg.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 8), size: .init(width: 40, height: 40))
         checkboxImage.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 30, height: 30))
        checkboxImagebg.centerYTo(self.centerYAnchor)
        checkboxImage.centerYTo(checkboxImagebg.centerYAnchor)
        checkboxImage.centerXTo(checkboxImagebg.centerXAnchor)


        
//        checkboxImage.snp.makeConstraints { (make) in
//            make.left.equalTo(8)
//            make.centerY.equalTo(self)
//            make.width.height.equalTo(15)
//        }
        checkboxLabel.anchor(top: nil, leading: checkboxImage.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 15, bottom: 0, right: -12), size: .zero)
        checkboxLabel.centerYTo(self.centerYAnchor)

//        checkboxLabel.snp.makeConstraints { (make) in
//            make.left.equalTo(checkboxImage.snp.right).offset(10)
//            make.centerY.equalTo(checkboxImage)
//            make.right.equalTo(-12)
//        }
        checkboxButton.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
//        checkboxButton.snp.makeConstraints { (make) in
//            make.left.right.top.bottom.equalTo(0)
//        }
    }
 
    @objc private func checkboxButtonAction(){
        isChecked = !isChecked
    }

}
