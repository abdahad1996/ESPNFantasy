//
//  Play.swift
//  espnFantasyApp
//
//  Created by prog on 12/24/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import Foundation
import UIKit
class PlayHeader: UICollectionReusableView {
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        let label = UILabel(text: "Fantasy News & Analysis", font: AppFont.Bold().sixteen, textColor:  UIColor(red: 0.176, green: 0.761, blue: 0.894, alpha: 1), textAlignment: .left, numberOfLines: 1)
        addSubview(label)
//        label.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .zero, size: .init(width: 0, height: 30))
        hstack(label).padTop(10).padLeft(10)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
class Play: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
    lazy var getATeambtn : UIButton = {
              let b = UIButton(title: "Get a Team", titleColor:   UIColor(red: 0.071, green: 0.631, blue: 0.792, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
           b.withHeight(40)
                     b.buttonBorder(withRadius:20 , width: 2,color: .white)
              return b
          }()
          lazy var createLeague : UIButton = {
                 let b = UIButton(title: "Create League", titleColor:   UIColor(red: 0.071, green: 0.631, blue: 0.792, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
              b.withHeight(40)
               b.buttonBorder(withRadius:20 , width: 2,color: .white)
                 return b
             }()
          lazy var mockDraft : UIButton = {
                 let b = UIButton(title: "Mock Draft", titleColor:   UIColor(red: 0.071, green: 0.631, blue: 0.792, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
              b.withHeight(40)
              b.buttonBorder(withRadius:20 , width: 2,color: .white)
                 return b
             }()
       
    
    override func setupViews() {
        super.setupViews()
       let h2 = UIStackView(arrangedSubviews: [getATeambtn,createLeague,mockDraft])
               h2.addBackground(color: MyColors.Hockey().backgroundGradient1)
               h2.padRight(10).padLeft(10).padTop(20)
                h2.spacing = 10
                h2.distribution = .fillEqually
               h2.alignment = .center
        addSubview(h2)
               h2.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 50 + 50 , left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 100))
 
        
//        hstack(topMatch,UIView(),AllMatchUps)
        
// 50 menu bar height
        addSubview(collectionView)
        collectionView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 50 + 50 + 100, left: 0, bottom: 0, right: 0), size: .zero)
//        collectionView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        collectionView.backgroundColor = .white
        collectionView.register(HockeyHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: supplementaryViewId)
        collectionView.register(HockeyCells.self, forCellWithReuseIdentifier: cellId)
    }
       func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryViewId, for: indexPath)
        
        return supplementaryView
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: frame.width, height: 30)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HockeyCells
 
//        cell.video = videos?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: frame.width, height: 120)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
 
    
    
}

 
