//
//  RugbyVideoCell.swift
//  espnFantasyApp
//
//  Created by prog on 12/22/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit
class RugbyVideoCell: BaseCell {
 
 lazy var image: AspectFillImageView = {
    let imageView = AspectFillImageView(image: #imageLiteral(resourceName: "quino-al-_FQ95yUfIHw-unsplash 1"), contentMode: .scaleAspectFill)
 
              return  imageView
          }()
    
 lazy var play: UIButton = {
     let button = UIButton(image: #imageLiteral(resourceName: "play-button-arrowhead 1"), tintColor:.black, target: self, action: nil)
 
     return button
 }()
    override func setupViews() {
        stack(image)
//        backgroundColor = .red
//        addSubview(image)
//        image.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        play.layer.cornerRadius = 30
                   play.clipsToBounds = true
                   play.backgroundColor = .init(white: 0.9, alpha: 1)
                   play.withSize(.init(width: 60, height: 60))
        image.addSubview(play)
        play.centerInSuperview()
        
         setupShadow(opacity: 1, radius: 14, offset: CGSize(width: 0, height: 1), color:  UIColor(red: 0, green: 0, blue: 0, alpha: 0.17))
    }
}
