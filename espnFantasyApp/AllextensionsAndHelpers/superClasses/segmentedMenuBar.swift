//
//  segmentedMenuBar.swift
//  espnFantasyApp
//
//  Created by prog on 12/16/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit
class segmentedMenuBar:UIView,UICollectionViewDelegateFlowLayout{
   
    
    let cellId = "cellId"

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let horizontalSnappingLayout =  BetterSnappingLayout()
        horizontalSnappingLayout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: horizontalSnappingLayout)
        cv.decelerationRate = .fast
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let imageNames = ["Dashboard", "Rugby", "BasketBall", "Hockey","Baseball","Play"]

    override init(frame: CGRect) {
        super.init(frame: frame)
//        collectionView.register(segmentedMenuCell.self, forCellWithReuseIdentifier: cellId)
//        stack(collectionView)
        collectionView.register(segmentedMenuCell.self, forCellWithReuseIdentifier: cellId)
         stack(collectionView)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.frame.width/4, height: frame.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension segmentedMenuBar :UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! segmentedMenuCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        
        return cell
       }
}
class segmentedMenuCell: BaseCell {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "splash"), contentMode: .scaleAspectFit)
    override func setupViews() {
        hstack(imageView.withWidth(30).withHeight(30))

    }
}
