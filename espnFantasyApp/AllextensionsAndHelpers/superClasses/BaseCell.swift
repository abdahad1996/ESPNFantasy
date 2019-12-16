//
//  BaseCell.swift
//  espnFantasyApp
//
//  Created by prog on 12/16/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
