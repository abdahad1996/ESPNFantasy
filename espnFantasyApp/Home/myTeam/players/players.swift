////
////  players.swift
////  espnFantasyApp
////
//
//
// 
////  LeagueOptions.swift
////  espnFantasyApp
////
////  Created by prog on 12/30/19.
////  Copyright © 2019 prog. All rights reserved.
////
import UIKit
import Foundation

class Players:BaseCell{
     lazy var image: AspectFitImageView = {
                 let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "Screen Shot 2020-01-07 at 1.16.32 AM"), cornerRadius: 0)
    //    imageView.constrainHeight(100)
    //    imageView.constrainWidth(100)
                 return  imageView
             }()
    let vc = playersCollectionVC()
    override func setupViews() {
        stack(vc.view).padTop(100)
//        image.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 50 + 50 , left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 100))
    }
}
//
//
//import Foundation
//import UIKit
// class PlayerHeader: UICollectionReusableView {
//   
// 
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .white
//         setupShadow(opacity: 1, radius: 14, offset: CGSize(width: 0, height: 1), color:  UIColor(red: 0, green: 0, blue: 0, alpha: 0.17))
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//    
//}
//class PlayerCells: BaseCell {
//    
// lazy var textlabel: UILabel = {
//    let l = UILabel(text: "Biggest Week 12 Injury \nquestions for all 32 NFL teams", font: AppFont.Medium().sixteen, textColor:UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 1), textAlignment:.left , numberOfLines: 0)
// l.lineBreakMode = .byWordWrapping
// l.backgroundColor = .white
//      return l
//     
// }()
//    lazy var textlabel2: UILabel = {
//       let l = UILabel(text: "9/02/2019 - NFL Nation", font: AppFont.Medium().fourteen, textColor:UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), textAlignment:.left, numberOfLines: 1)
//     l.backgroundColor = .white
//         return l
//        
//    }()
//   lazy var image: AspectFitImageView = {
//             let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "katrina-berban-k24k1INxuxk-unsplash 1"), cornerRadius: 0)
////    imageView.constrainHeight(100)
////    imageView.constrainWidth(100)
//             return  imageView
//         }()
// 
//    
//    var titleLabelHeightConstraint: NSLayoutConstraint?
//    
//    override func setupViews() {
//        backgroundColor = .white
//        let v1 = stack(textlabel,UIView(),textlabel2,UIView().withHeight(10)).padTop(10)
//       let mainStack = hstack(image,v1,UIView())
//        mainStack.spacing = 10
//       
//        
//        setupShadow(opacity: 1, radius: 14, offset: CGSize(width: 0, height: 1), color:  UIColor(red: 0, green: 0, blue: 0, alpha: 0.17))
//    }
//}
//
//class Players: BaseCell
//  ,
//UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
//{
//    
//    lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//         cv.dataSource = self
//        cv.delegate = self
//        return cv
//    }()
//    lazy var topMatch: UILabel = {
//        let t = UILabel(text: "Top Matchups", font: AppFont.Bold().sixteen, textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment: .left, numberOfLines: 1)
//        return t
//    }()
//    lazy var AllMatchUps: UILabel = {
//        let t = UILabel(text: "All Matchups >", font: AppFont.Medium().twelve, textColor: UIColor(red: 0.125, green: 0.812, blue: 0.38, alpha: 1), textAlignment: .right, numberOfLines: 1)
//           return t
//       }()
//    
////    var videos: [Video]?
////
//    fileprivate let  cellId = "playercellId"
//    fileprivate let supplementaryViewId = "playerViewId"
//
////    func fetchVideos() {
////        ApiService.shared.fetchVideos { (videos: [Video]) in
////
////            self.videos = videos
////            self.collectionView.reloadData()
////
////        }
////    }
//    lazy var icon : UIButton = {
//        let b = UIButton(image: #imageLiteral(resourceName: "drop-down-arrow 1"), tintColor: .white, target: self, action: nil)
//              return b
//          }()
//          lazy var stateViewLabel : UIButton = {
//                 let b = UIButton(title: "State View", titleColor:   UIColor(red: 0.071, green: 0.631, blue: 0.792, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
//            
//                 return b
//             }()
//          lazy var stats : UIButton = {
//                 let b = UIButton(title: "2020 Stats", titleColor:   UIColor(red: 0.906, green: 0.271, blue: 0.216, alpha: 1), font: AppFont.Medium().twelve, backgroundColor: .white, target: nil, action: nil)
// 
//                 return b
//             }()
//       
//    let searchBar: UISearchBar = {
//        let sb = UISearchBar()
//        sb.searchBarStyle = .minimal
//        sb.placeholder = "Enter some filer"
//        return sb
//    }()
//    
//    override func setupViews() {
//        super.setupViews()
//        
//        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = .red
////       let t =  UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
//       
//        let horizontal = hstack(stats,icon)
//        let vertical = stack(stateViewLabel,horizontal)
//        vertical.withWidth(50)
//        let h2 = UIStackView(arrangedSubviews: [searchBar,UIView(),vertical,UIView()])
////               h2.addBackground(color: MyColors.Hockey().backgroundGradient1)
//               h2.padRight(10).padLeft(10).padTop(20)
////                h2.spacing = 10
//                h2.distribution = .fillEqually
////               h2.alignment = .center
//        addSubview(h2)
//               h2.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 50 + 50 , left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 100))
// 
//        
////        hstack(topMatch,UIView(),AllMatchUps)
//        
//// 50 menu bar height
//        addSubview(collectionView)
//        collectionView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 50 + 50 + 100, left: 0, bottom: 0, right: 0), size: .zero)
////        collectionView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 0))
//        collectionView.backgroundColor = .white
//        collectionView.register(PlayerHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: supplementaryViewId)
//        collectionView.register(PlayerCells.self, forCellWithReuseIdentifier: cellId)
//    }
//       func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryViewId, for: indexPath)
//        
//        return supplementaryView
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return .init(width: frame.width, height: 30)
//    }
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PlayerCells
// 
////        cell.video = videos?[indexPath.item]
//        
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return .init(width: frame.width, height: 120)
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    
// 
//    
//    
//}
//
//
//
//
import SwiftUI
 struct playersCollection:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<playersCollection.ContainerView>) -> UIViewController {
           UINavigationController(rootViewController: playersCollectionVC())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<playersCollection.ContainerView>) {
             
        }
        
        
       
    }
}

class playersCollectionVC:UIViewController{
     let cellID = "cellid"
     lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
             cv.dataSource = self
            cv.delegate = self
            return cv
        }()
    lazy var tf: UITextField = {
        let tf = IndentedTextField(placeholder: "Search", padding: 45, cornerRadius: 35, keyboardType: .asciiCapable, backgroundColor: .clear, isSecureTextEntry: false)
        tf.setView(.left, image: #imageLiteral(resourceName: "search (1) 1"), width: 20, height: 20, space:15, target: nil, action: nil, tintColor: .red)
        tf.setCorner(withRadius: 20, borderWidth: 1, color: .red)
        tf.attributedPlaceholder =  NSAttributedString(string:"Search", attributes:[NSAttributedString.Key.foregroundColor: UIColor.init(red: 1, green: 0, blue: 0, alpha: 1)])
        return tf
    }()
        lazy var icon : UIButton = {
            let b = UIButton(image: #imageLiteral(resourceName: "drop-down-arrow 1"), tintColor: .red, target: self, action: nil)
                  return b
              }()
              lazy var stateViewLabel : UIButton = {
                let b = UIButton(title: "Stats View", titleColor:.black, font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
    
                     return b
                 }()
              lazy var stats : UIButton = {
                     let b = UIButton(title: "2020 Stats", titleColor:   UIColor(red: 0.906, green: 0.271, blue: 0.216, alpha: 1), font: AppFont.Medium().twelve, backgroundColor: .white, target: nil, action: nil)
    
                     return b
                 }()
           
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
 
        view.addSubview(tf)
        view.addSubview(stats)
        view.addSubview(stateViewLabel)
        view.addSubview(icon)
        view.addSubview(collectionView)
        
        stateViewLabel.anchor(top: tf.topAnchor, leading: tf.trailingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 20))
         stats.anchor(top: stateViewLabel.bottomAnchor, leading: stateViewLabel.leadingAnchor, bottom: nil, trailing: stateViewLabel.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 20))
        icon.anchor(top: stats.topAnchor, leading: stats.trailingAnchor, bottom: stats.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .zero)
        
        tf.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 50, left: 20, bottom: 0, right: 0), size: .init(width: 0, height: 40))
        collectionView.register(segmentedMenutextCell.self, forCellWithReuseIdentifier: cellID)

        collectionView.anchor(top: tf.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .zero)
        
    }
}
extension playersCollectionVC:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:cellID, for: indexPath) as! segmentedMenutextCell
        return cell
        
    }
    
    
}
