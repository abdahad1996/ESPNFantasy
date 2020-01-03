//
//  inviteCell.swift
//  espnFantasyApp
//
//  Created by prog on 12/30/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit

class inviteCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
    fileprivate let supplementaryViewId = "footer"

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
       
    var arr = ["Text Message","Email","Facebook Messenger","Twitter"]
    override func setupViews() {
        super.setupViews()
       
 
        
//        hstack(topMatch,UIView(),AllMatchUps)
        
// 50 menu bar height
        addSubview(collectionView)
        collectionView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 50 + 50 , left: 0, bottom: 0, right: 0), size: .zero)
//        collectionView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        collectionView.backgroundColor = .white
        
        collectionView.register(invitesubCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(inviteFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: supplementaryViewId)
    }
      func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
          let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryViewId, for: indexPath) as! inviteFooter
          
          return supplementaryView
      }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
                  return .init(width: frame.width, height: 80)

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! invitesubCell
        cell.Label.text = arr[indexPath.item]
//        cell.video = videos?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: frame.width, height: 60)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
 
    
    
}

class inviteFooter: UICollectionReusableView {
    
 lazy var logoButton: UIButton = {
    let b = UIButton(title:"Copy Invitation Link", titleColor:UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1), font: AppFont.Medium().twelve, backgroundColor:.white, target: self, action: nil)
//    b.withBorder(width: 1, color: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1))
    b.layer.backgroundColor = UIColor(red: 1, green: 0.882, blue: 0.879, alpha: 1).cgColor
    b.layer.borderColor = UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1).cgColor
    b.layer.borderWidth = 1
//     let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "upload 1"), cornerRadius: 0)
//     let img = imageView.image
//
//
//
//            b.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 50)
//      let imageG = #imageLiteral(resourceName: "upload 1")
//            b.setImage(imageG.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
//    b.tintColor = .white
     
     return b
 }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
       
 
        hstack(UIView().withWidth(50),logoButton.withHeight(50),UIView().withWidth(50)).padTop(10).padLeft(10).padRight(10)
        logoButton.setCorner(withRadius: 25)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
