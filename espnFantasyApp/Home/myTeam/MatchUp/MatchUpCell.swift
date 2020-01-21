//
//  MatchUpCell.swift
//  espnFantasyApp
//
//  Created by prog on 1/6/20.
//  Copyright © 2020 prog. All rights reserved.
//

import Foundation
import UIKit

//class RoasterCell:LBTAListHeaderFooterController<leagueInfocell, leagueInfoModel, leagueInfoHeader,leagueInfoFooter>,UICollectionViewDelegateFlowLayout{
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.items = [
//            leagueInfoModel(img: #imageLiteral(resourceName: "Group 80"), name: "Scoreboard"),
//            leagueInfoModel(img: #imageLiteral(resourceName: "Group 81"), name: "Standings"),
//            leagueInfoModel(img: #imageLiteral(resourceName: "Group 85"), name: "Schedule & Playoff Bracket"),
//            leagueInfoModel(img: #imageLiteral(resourceName: "Group 76"), name: "Message Board & LM Poll"),
//            leagueInfoModel(img: #imageLiteral(resourceName: "Group 77"), name: "Recent Activity"),
//            leagueInfoModel(img: #imageLiteral(resourceName: "Group 78"), name: "Waiver Order"),
//            leagueInfoModel(img: #imageLiteral(resourceName: "Group 83"), name: "League Info"),
//            leagueInfoModel(img: #imageLiteral(resourceName: "Vector 13"), name: "League Manager Tools"),
//        ]
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return .init(width: collectionView.frame.width, height: 30)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return .init(width: collectionView.frame.width, height: 60)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//         return .init(width: collectionView.frame.width, height: 50)
//    }
//}
import Foundation

class matchUpCell:BaseCell{
     lazy var image: AspectFitImageView = {
                 let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "Screen Shot 2020-01-07 at 1.54.50 AM"), cornerRadius: 0)
    //    imageView.constrainHeight(100)
    //    imageView.constrainWidth(100)
                 return  imageView
             }()
    let vc = LeagueOptions()
    override func setupViews() {
        stack(image).padTop(30)
//        image.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 50 + 50 , left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 100))
    }
}
