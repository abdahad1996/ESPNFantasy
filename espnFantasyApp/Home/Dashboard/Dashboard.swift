//
//  Dashboard.swift
//  espnFantasyApp
//
//  Created by prog on 12/19/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit
var  globalTotalHeigt = 0
class DashboardHeader: UICollectionReusableView {
    
    lazy var progress: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.trackTintColor = MyColors.progresstrackTintColor
        progress.progressTintColor = MyColors.progressTintColor
        progress.progress = 0.1
        return progress
    }()
    lazy var imageView: AspectFitImageView = {
        let l = AspectFitImageView(image: #imageLiteral(resourceName: "basketball 1"), cornerRadius: 0)
        return l
    }()
    
    lazy var textlabel: UILabel = {
        let l = UILabel(text: "NCW - ESPN+ 9:02 PM", font: AppFont.Medium().twelve, textColor: UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), textAlignment: .center, numberOfLines: 1)
        return l
        
    }()
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        progress.setCorner(withRadius: 2)
        
        let h1 = hstack(progress.withHeight(4))
        let h2 = hstack(imageView.withHeight(30).withWidth(30),textlabel)
        stack(h1,h2).withMargins(.init(top: 10, left: 20, bottom: 10, right: 20))
        backgroundColor = .white
          setupShadow(opacity: 1, radius: 12, offset: .init(width: 0, height: 4), color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.17) )
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
class Dashboard: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
         cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    lazy var topMatch: UILabel = {
        let t = UILabel(text: "Top Matchups", font: AppFont.Bold().sixteen, textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment: .left, numberOfLines: 1)
        return t
    }()
    lazy var AllMatchUps: UILabel = {
        let t = UILabel(text: "All Matchups >", font: AppFont.Medium().twelve, textColor: UIColor(red: 0.125, green: 0.812, blue: 0.38, alpha: 1), textAlignment: .right, numberOfLines: 1)
           return t
       }()
    
//    var videos: [Video]?
//
    fileprivate let  cellId = "DashboardcellId"
    fileprivate let supplementaryViewId = "supplementaryViewId"

//    func fetchVideos() {
//        ApiService.shared.fetchVideos { (videos: [Video]) in
//
//            self.videos = videos
//            self.collectionView.reloadData()
//
//        }
//    }
    
    override func setupViews() {
        super.setupViews()
        addSubview(AllMatchUps)
        addSubview(topMatch)
        topMatch.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 50 + 50 , left: 20, bottom: 0, right: 0), size: .init(width: 0, height: 40))
        _ = topMatch.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        AllMatchUps.anchor(top: safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 50 + 50 , left: 0, bottom: 0, right: 20), size: .init(width: 100, height: 40))
 
        
//        hstack(topMatch,UIView(),AllMatchUps)
        
// 50 menu bar height 
        addSubview(collectionView)
        collectionView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 50 + 50 + 40, left: 0, bottom: 0, right: 0), size: .zero)
//        collectionView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        collectionView.backgroundColor = .white
        collectionView.register(DashboardHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: supplementaryViewId)
        collectionView.register(DashboardCells.self, forCellWithReuseIdentifier: cellId)
    }
       func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryViewId, for: indexPath)
        
        return supplementaryView
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: frame.width, height: 80)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DashboardCells
 
//        cell.video = videos?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: frame.width, height: 320)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let videoLauncher = VideoLauncher()
//        videoLauncher.showVideoPlayer()
//    }
    
    
}

 
