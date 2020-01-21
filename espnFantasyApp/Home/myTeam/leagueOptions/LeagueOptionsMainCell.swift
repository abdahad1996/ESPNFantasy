//
//  LeagueOptionsMainCell.swift
//  espnFantasyApp
//
//  Created by prog on 1/6/20.
//  Copyright © 2020 prog. All rights reserved.
//

import Foundation
import UIKit

class leagueOptionsMainCell:BaseCell{
//    lazy var vc: LeagueOptions = {
//        let vc = LeagueOptions()
//        return vc
//    }()
    let vc = LeagueOptions(scrollDirection: .vertical)
    lazy var imageView:AspectFitImageView = {
        let i = AspectFitImageView(image: #imageLiteral(resourceName: "Group 7"))
        return i
    }()
    override func setupViews() {
        addSubview(vc.view)
        vc.view.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 0), size: .zero)        
//        vc.view.frame = CGRect(x: 0, y: 40, width: , height: )
//        self.frame = vc.collectionView.bounds
          self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
          
          // Notify Child View Controller
//        stack(vc.view).padTop(40)
        
//        self.didAddSubview(vc.view)
    }
     
}
