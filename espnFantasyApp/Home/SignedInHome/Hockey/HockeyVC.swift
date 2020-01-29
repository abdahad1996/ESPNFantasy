//
//  HockeyVC.swift
//  espnFantasyApp
//
//  Created by prog on 1/28/20.
//  Copyright © 2020 prog. All rights reserved.
//

import Foundation
import UIKit
class HockeyVC:BasketballVC {
        
//    override var selectedColor: UIColor = .yellow
//    override func setupViews() {
//        super.image.image = #imageLiteral(resourceName: "ice-hockey-1734816_640 1")
//        super.setupViews()
//    }
    let cellId = "cell"
    override func viewDidLoad() {
//        collectionView.register(HockeyCells.self, forCellWithReuseIdentifier: cellId)
//        collectionView.register(BasketballHeader.self, forCellWithReuseIdentifier: cellId)

        super.viewDidLoad()
    }
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//             guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? HockeyCells else{return UICollectionViewCell()}
//      //        cell.video = videos?[indexPath.item]
//
//            return cell
//        }
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//           let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cellId, for: indexPath) as! BasketballHeader
//        supplementaryView.selectedColor = .yellow
//           return supplementaryView
//       }
}
