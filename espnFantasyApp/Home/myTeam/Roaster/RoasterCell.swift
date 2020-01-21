//
//  RoasterCell.swift
//  espnFantasyApp
//
//  Created by prog on 1/6/20.
//  Copyright © 2020 prog. All rights reserved.
//

import Foundation

class roaster:BaseCell{
     lazy var image: AspectFitImageView = {
                 let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "Screen Shot 2020-01-07 at 1.26.52 AM"), cornerRadius: 0)
    //    imageView.constrainHeight(100)
    //    imageView.constrainWidth(100)
                 return  imageView
             }()
    let vc = LeagueOptions()
    override func setupViews() {
        stack(image).padTop(0)
//        image.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 50 + 50 , left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 100))
    }
}
