//
//  segmentedMenuBar.swift
//  espnFantasyApp
//
//  Created by prog on 12/16/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit

protocol scroll {
    func scrollToMenuIndex(menuIndex: Int)
}
class segmentedMenuBar:UIView,UICollectionViewDelegateFlowLayout{
   
    
    let cellId = "cellId"
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    var delegate:scroll?

        func determineGradientByIndexPath(index:Int,view:UIView? = nil ){
            switch index {
            case 0:
                
                horizontalBarView.backgroundColor = MyColors.Dashboard().backgroundGradient1
                view?.tintColor = MyColors.Dashboard().backgroundGradient1
            case 1:
                 
                horizontalBarView.backgroundColor = MyColors.Rugby().backgroundGradient1
                view?.tintColor = MyColors.Rugby().backgroundGradient1


            case 2:
               horizontalBarView.backgroundColor = MyColors.BasketBall().backgroundGradient1
                view?.tintColor = MyColors.BasketBall().backgroundGradient1

            case 3:
                horizontalBarView.backgroundColor = MyColors.Hockey().backgroundGradient1
                view?.tintColor = MyColors.Hockey().backgroundGradient1

            case 4:
                horizontalBarView.backgroundColor = MyColors.Baseball().backgroundGradient1

            view?.tintColor = MyColors.Baseball().backgroundGradient1

            default:
                 
                horizontalBarView.backgroundColor = MyColors.Play().backgroundGradient1
                view?.tintColor = MyColors.Play().backgroundGradient1

            }
    }
    let horizontalBarView = UIView()
    func setUpHorizontalBar(){
               horizontalBarView.backgroundColor = .green
               horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
               addSubview(horizontalBarView)
               
               //old school frame way of doing things
               //        horizontalBarView.frame = CGRectMake(<#T##x: CGFloat##CGFloat#>, <#T##y: CGFloat##CGFloat#>, <#T##width: CGFloat##CGFloat#>, <#T##height: CGFloat##CGFloat#>)
               
               //new school way of laying out our views
               //in ios9
               //need x, y, width, height constraints
        
               //for changing leftanchor to whichever view we choose
               horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
               horizontalBarLeftAnchorConstraint?.isActive = true
               
               horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
               horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/6).isActive = true
               horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    lazy var collectionView: UICollectionView = {
 //        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        let horizontalSnappingLayout =  BetterSnappingLayout()
//        horizontalSnappingLayout.scrollDirection = .horizontal
////        layout.scrollDirection = .horizontal
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: horizontalSnappingLayout)
//        cv.decelerationRate = .fast
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let imageNames = ["Dashboard", "rugby1", "basketBall", "hockey","baseball","play"]

    override init(frame: CGRect) {
        super.init(frame: frame)
//        collectionView.register(segmentedMenuCell.self, forCellWithReuseIdentifier: cellId)
//        stack(collectionView)
        backgroundColor = .white
        collectionView.register(segmentedMenuCell.self, forCellWithReuseIdentifier: cellId)
        //initially selectedIndexpath = 0
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .bottom)
        determineGradientByIndexPath(index: selectedIndexPath.item)
//         stack(collectionView)
        addSubview(collectionView)
        collectionView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        collectionView.backgroundColor = .white
//        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
//        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        setUpHorizontalBar()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        print(indexPath.item)
    //        let x = CGFloat(indexPath.item) * frame.width / 4
    //        horizontalBarLeftAnchorConstraint?.constant = x
    //
    //        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
    //            self.layoutIfNeeded()
    //        }, completion: nil)
        determineGradientByIndexPath(index: indexPath.item)
             delegate?.scrollToMenuIndex(menuIndex: indexPath.item)
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
        cell.imageView.tintColor = UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1)
        cell.index = indexPath.item
        return cell
       }
}
class segmentedMenuCell: BaseCell {
    var index :Int?
    let imageView = UIImageView(image: #imageLiteral(resourceName: "splash"), contentMode: .scaleAspectFit)
    override func setupViews() {
        
       let stack =  hstack(UIView(),imageView.withWidth(20).withHeight(20),UIView())
        stack.alignment = .fill
        stack.distribution = .fillEqually
//        backgroundColor = .white

    }
    func determineGradientByIndexPath(index:Int,view:UIView? = nil ){
               switch index {
               case 0:
                   
//                   horizontalBarView.backgroundColor = MyColors.Dashboard().backgroundGradient1
                   imageView.tintColor = MyColors.Dashboard().backgroundGradient1
               case 1:
                    
//                   horizontalBarView.backgroundColor = MyColors.Rugby().backgroundGradient1
                   imageView.tintColor = MyColors.Rugby().backgroundGradient1


               case 2:
//                  horizontalBarView.backgroundColor = MyColors.BasketBall().backgroundGradient1
                   imageView.tintColor = MyColors.BasketBall().backgroundGradient1

               case 3:
//                   horizontalBarView.backgroundColor = MyColors.Hockey().backgroundGradient1
                   imageView.tintColor = MyColors.Hockey().backgroundGradient1

               case 4:
//                   horizontalBarView.backgroundColor = MyColors.Baseball().backgroundGradient1

               imageView.tintColor = MyColors.Baseball().backgroundGradient1

               default:
                    
//                   horizontalBarView.backgroundColor = MyColors.Play().backgroundGradient1
                   imageView.tintColor = MyColors.Play().backgroundGradient1
0
               }
       }
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted{
                determineGradientByIndexPath(index: index ?? 0)
            }else {
                 imageView.tintColor =   UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1)
            }
         
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected{
                determineGradientByIndexPath(index: index ?? 0)
            }else {
                 imageView.tintColor =   UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1)
            }
        }
    }
    

}
