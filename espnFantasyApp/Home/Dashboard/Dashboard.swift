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
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
class Dashboard: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
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
        
//        fetchVideos()
        
 
        collectionView.contentInset = .init(top: CGFloat(globalTotalHeigt+50), left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = .init(top: CGFloat(globalTotalHeigt+50), left: 0, bottom: 0, right: 0)
        addSubview(collectionView)
        collectionView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        collectionView.backgroundColor = .red
        collectionView.register(DashboardHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: supplementaryViewId)
        collectionView.register(DashboardCells.self, forCellWithReuseIdentifier: cellId)
    }
       func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryViewId, for: indexPath)
        
        return supplementaryView
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DashboardCells
        
//        cell.video = videos?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: frame.width, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let videoLauncher = VideoLauncher()
//        videoLauncher.showVideoPlayer()
//    }
    
    
}

 
