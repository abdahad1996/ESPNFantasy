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
//        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: horizontalSnappingLayout)
        cv.decelerationRate = .fast
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let imageNames = ["Dashboard", "rugby", "basketBall", "hockey","baseball","play"]

    override init(frame: CGRect) {
        super.init(frame: frame)
//        collectionView.register(segmentedMenuCell.self, forCellWithReuseIdentifier: cellId)
//        stack(collectionView)
        backgroundColor = .white 
        collectionView.register(segmentedMenuCell.self, forCellWithReuseIdentifier: cellId)
         stack(collectionView)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: (self.frame.width)/CGFloat(imageNames.count), height: frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension segmentedMenuBar :UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
//        return 4
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! segmentedMenuCell
         cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = .systemRed
        
        return cell
       }
}
class segmentedMenuCell: BaseCell {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "splash"), contentMode: .scaleAspectFit)
    override func setupViews() {
       let stack =  hstack(UIView(),imageView.withWidth(30).withHeight(30),UIView())
        stack.alignment = .fill
        stack.distribution = .fillEqually
        backgroundColor = .green
        
    }
}
