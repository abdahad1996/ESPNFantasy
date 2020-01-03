//
//  inviteSubCell.swift
//  espnFantasyApp
//
//  Created by prog on 12/30/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit
class invitesubCell: BaseCell   {
    
//    override var item: obj! {
//        didSet {
//            Label.text = item.name
//            Labelint.text = "\(item.val)"
//        }
//    }
    
    lazy var Label: UILabel = {
           let l = UILabel(text: "League Name", font: AppFont.Regular().fourteen, textColor: UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), textAlignment: .left, numberOfLines: 1)
                 
                 return l
             }()
//    lazy var Labelint: UILabel = {
//    let l = UILabel(text: "0", font: AppFont.Regular().fourteen, textColor: UIColor(red: 0.003, green: 0.57, blue: 0.783, alpha: 1), textAlignment: .left, numberOfLines: 1)
//          
//          return l
//      }()
    
    override func setupViews() {
        backgroundColor = .white
        let separatorStack4 = UIStackView(arrangedSubviews: [UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
            separatorStack4.padTop(5).padBottom(0)

        let h = hstack(Label)
        h.distribution = .fill
        h.spacing = 15
        stack(h,separatorStack4).padLeft(30).padRight(30)
        
        
    }
}
