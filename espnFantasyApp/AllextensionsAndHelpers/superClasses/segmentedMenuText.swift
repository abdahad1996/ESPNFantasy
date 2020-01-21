//
//  segmentedMenuText.swift
//  espnFantasyApp
//
//  Created by prog on 12/30/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
 import UIKit


class segmentedMenuText:UIView,UICollectionViewDelegateFlowLayout{
   
    
    let cellId = "cellId_"
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    var delegate:scroll?

        func determineGradientByIndexPath(index:Int,view:UIView? = nil ){
            switch index {
            case 0:
                
                horizontalBarView.backgroundColor = UIColor(red: 0.906, green: 0.298, blue: 0.22, alpha: 1)
                view?.tintColor = MyColors.Dashboard().backgroundGradient1
            case 1:
                 
                horizontalBarView.backgroundColor = UIColor(red: 0.906, green: 0.298, blue: 0.22, alpha: 1)
                view?.tintColor = MyColors.Rugby().backgroundGradient1


            case 2:
               horizontalBarView.backgroundColor = UIColor(red: 0.906, green: 0.298, blue: 0.22, alpha: 1)
                view?.tintColor = MyColors.BasketBall().backgroundGradient1

            case 3:
                horizontalBarView.backgroundColor = UIColor(red: 0.906, green: 0.298, blue: 0.22, alpha: 1)
                view?.tintColor = MyColors.Hockey().backgroundGradient1

            case 4:
                horizontalBarView.backgroundColor = UIColor(red: 0.906, green: 0.298, blue: 0.22, alpha: 1)

            view?.tintColor = MyColors.Baseball().backgroundGradient1

            default:
                 
                horizontalBarView.backgroundColor = UIColor(red: 0.906, green: 0.298, blue: 0.22, alpha: 1)
                view?.tintColor = MyColors.Play().backgroundGradient1

            }
    }
    let horizontalBarView = UIView()
    func setUpHorizontalBar(){
               horizontalBarView.backgroundColor = UIColor(red: 0.906, green: 0.298, blue: 0.22, alpha: 1)
               horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
               addSubview(horizontalBarView)
               
               
               //for changing leftanchor to whichever view we choose
               horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
               horizontalBarLeftAnchorConstraint?.isActive = true
               
               horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
               horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
               horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    lazy var collectionView: UICollectionView = {
 //        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
 
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
     var imageNames = [String]()
//    let imageNames = ["Remove Owners", "Invite Owners"]

    override init(frame: CGRect) {
        super.init(frame: frame)
//        collectionView.register(segmentedMenuCell.self, forCellWithReuseIdentifier: cellId)
//        stack(collectionView)
        backgroundColor = .white
        collectionView.register(segmentedMenutextCell.self, forCellWithReuseIdentifier: cellId)
        //initially selectedIndexpath = 0
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .bottom)
        //all horizontal bars of same color
        determineGradientByIndexPath(index: selectedIndexPath.item)
        addSubview(collectionView)
        collectionView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        collectionView.backgroundColor = .white

        setUpHorizontalBar()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //sameColor
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
extension segmentedMenuText :UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
//        return 4
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! segmentedMenutextCell
        cell.label.text  = imageNames[indexPath.item]
//         cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
//        cell.imageView.tintColor = UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1)
        cell.index = indexPath.item
        return cell
       }
}
class segmentedMenutextCell: BaseCell {
    var index :Int?
    lazy var label: UILabel = {
        let l = UILabel(text: "Remove Owners", font: AppFont.Medium().fourteen, textColor:  UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), textAlignment: .center, numberOfLines: 1)
        return l
    }()
    override func setupViews() {
        backgroundColor = .white
       let stack =  hstack(label)
        stack.alignment = .center
        stack.distribution = .fill
//        backgroundColor = .white

    }
    func determineGradientByIndexPath(index:Int,view:UIView? = nil ){
               switch index {
               case 0:
                   
//                   horizontalBarView.backgroundColor = MyColors.Dashboard().backgroundGradient1
                   label.textColor =  UIColor(red: 0.906, green: 0.298, blue: 0.22,alpha: 1)
               case 1:
                    
//                   horizontalBarView.backgroundColor = MyColors.Rugby().backgroundGradient1
                   label.textColor =  UIColor(red: 0.906, green: 0.298, blue: 0.22,alpha: 1)
         

//               case 2:
////                  horizontalBarView.backgroundColor = MyColors.BasketBall().backgroundGradient1
//                   imageView.tintColor = MyColors.BasketBall().backgroundGradient1
//
//               case 3:
////                   horizontalBarView.backgroundColor = MyColors.Hockey().backgroundGradient1
//                   imageView.tintColor = MyColors.Hockey().backgroundGradient1
//
//               case 4:
////                   horizontalBarView.backgroundColor = MyColors.Baseball().backgroundGradient1
//
//               imageView.tintColor = MyColors.Baseball().backgroundGradient1
//
//               default:
//
////                   horizontalBarView.backgroundColor = MyColors.Play().backgroundGradient1
//                   imageView.tintColor = MyColors.Play().backgroundGradient1
//0
//               }
        default:
                           label.textColor =  UIColor(red: 0.906, green: 0.298, blue: 0.22,alpha: 1)
        }

    }
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted{
                determineGradientByIndexPath(index: index ?? 0)
            }else {

                 label.textColor =   UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1)
            }
         
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected{
                determineGradientByIndexPath(index: index ?? 0)
            }else {
                label.textColor =   UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1)
            }
        }
    }
    

}



class segmentedMenuText2:UIView,UICollectionViewDelegateFlowLayout{
   
    
    let cellId = "cellId_"
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    var delegate:scroll?

        func determineGradientByIndexPath(index:Int,view:UIView? = nil ){
            switch index {
            case 0:
                
                horizontalBarView.backgroundColor = UIColor(red: 0.906, green: 0.298, blue: 0.22, alpha: 1)
                view?.tintColor = MyColors.Dashboard().backgroundGradient1
            case 1:
                 
                horizontalBarView.backgroundColor = UIColor(red: 0.906, green: 0.298, blue: 0.22, alpha: 1)
                view?.tintColor = MyColors.Rugby().backgroundGradient1


            case 2:
               horizontalBarView.backgroundColor = UIColor(red: 0.906, green: 0.298, blue: 0.22, alpha: 1)
                view?.tintColor = MyColors.BasketBall().backgroundGradient1

            case 3:
                horizontalBarView.backgroundColor = UIColor(red: 0.906, green: 0.298, blue: 0.22, alpha: 1)
                view?.tintColor = MyColors.Hockey().backgroundGradient1

            case 4:
                horizontalBarView.backgroundColor = UIColor(red: 0.906, green: 0.298, blue: 0.22, alpha: 1)

            view?.tintColor = MyColors.Baseball().backgroundGradient1

            default:
                 
                horizontalBarView.backgroundColor = UIColor(red: 0.906, green: 0.298, blue: 0.22, alpha: 1)
                view?.tintColor = MyColors.Play().backgroundGradient1

            }
    }
    let horizontalBarView = UIView()
    func setUpHorizontalBar(){
               horizontalBarView.backgroundColor = UIColor(red: 0.906, green: 0.298, blue: 0.22, alpha: 1)
               horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
               addSubview(horizontalBarView)
               
               
               //for changing leftanchor to whichever view we choose
               horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
               horizontalBarLeftAnchorConstraint?.isActive = true
               
               horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
               horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
               horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    lazy var collectionView: UICollectionView = {
 //        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
 
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
     var imageNames = [String]()
//    let imageNames = ["Remove Owners", "Invite Owners"]

    override init(frame: CGRect) {
        super.init(frame: frame)
//        collectionView.register(segmentedMenuCell.self, forCellWithReuseIdentifier: cellId)
//        stack(collectionView)
        backgroundColor = .white
        collectionView.register(segmentedMenutextCell.self, forCellWithReuseIdentifier: cellId)
        //initially selectedIndexpath = 0
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .bottom)
        //all horizontal bars of same color
        determineGradientByIndexPath(index: selectedIndexPath.item)
        addSubview(collectionView)
        collectionView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        collectionView.backgroundColor = .white

        setUpHorizontalBar()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //sameColor
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
extension segmentedMenuText2 :UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
//        return 4
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! segmentedMenutextCell
        cell.label.text  = imageNames[indexPath.item]
//         cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
//        cell.imageView.tintColor = UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1)
        cell.index = indexPath.item
        return cell
       }
}
