//
//  BasketBallSignedInCell.swift
//  espnFantasyApp
//
//  Created by prog on 1/28/20.
//  Copyright © 2020 prog. All rights reserved.
//

import Foundation
import UIKit

class BasketBallSignedInCell: BaseCell
{
    var selectedColor:UIColor?
    let VC = BasketballVC()
    override func setupViews() {
        VC.selectedColor = UIColor(red: 0.906, green: 0.271, blue: 0.216, alpha: 1)
        stack(VC.view).padTop(50+50)
    }
}
