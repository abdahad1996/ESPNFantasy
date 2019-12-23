//
//  Rugby.swift
//  espnFantasyApp
//
//  Created by prog on 12/19/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit
 class RugbyHeader: UICollectionReusableView {
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        let label = UILabel(text: "Fantasy News & Analysis", font: AppFont.Bold().sixteen, textColor:  UIColor(red: 0.902, green: 0.404, blue: 0.184, alpha: 1), textAlignment: .left, numberOfLines: 1)
        addSubview(label)
//        label.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .zero, size: .init(width: 0, height: 30))
        hstack(label).padTop(10).padLeft(10)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
class Rugby: BaseCell
  ,
UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
//
////    var videos: [Video]?
////
    fileprivate let  cellId1 = "rugbycellId1"
    fileprivate let  cellId = "rugbycellId"
    fileprivate let supplementaryViewId = "rugbysupplementaryViewId"

////    func fetchVideos() {
////        ApiService.shared.fetchVideos { (videos: [Video]) in
////
////            self.videos = videos
////            self.collectionView.reloadData()
////
////        }
////    }
//
    override func setupViews() {
        super.setupViews()
    
        backgroundColor = .white
//// 50 menu bar height
        addSubview(collectionView)
        collectionView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 50 + 50, left: 0, bottom: 0, right: 0), size: .zero)
         collectionView.backgroundColor = .white
        collectionView.register(RugbyHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: supplementaryViewId)
        collectionView.register(RugbyCells.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(RugbyVideoCell.self, forCellWithReuseIdentifier: cellId1)

    }
       func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard  let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryViewId, for: indexPath) as? RugbyHeader else{return UICollectionReusableView() }

        return supplementaryView
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: frame.width, height: 30)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item % 2 == 0 && indexPath.item != 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId1, for: indexPath) as! RugbyVideoCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RugbyCells

//        cell.video = videos?[indexPath.item]

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         if indexPath.item % 2 == 0 && indexPath.item != 0{
            
            return .init(width: frame.width, height: 200)

        }
        return .init(width: frame.width, height: 100)
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

////    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        let videoLauncher = VideoLauncher()
////        videoLauncher.showVideoPlayer()
////    }
//
//
}

 

