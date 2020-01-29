//
//  HockeyCell.swift
//  espnFantasyApp
//
//  Created by prog on 1/28/20.
//  Copyright © 2020 prog. All rights reserved.
//

import Foundation
class HockeyCell:BaseCell{
   
    let VC = HockeyVC()
     override func setupViews() {
            stack(VC.view).padTop(50+50)
 
    }
     
}
