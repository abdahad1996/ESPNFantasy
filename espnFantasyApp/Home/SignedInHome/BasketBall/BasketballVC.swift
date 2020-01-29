//
//  BasketballVC.swift
//  espnFantasyApp
//
//  Created by prog on 1/27/20.
//  Copyright © 2020 prog. All rights reserved.
//

 



import Foundation
import UIKit
 class BasketballHeader: UICollectionReusableView {
  lazy var getATeambtn : UIButton = {
      let b = UIButton(title: "Get a Team", titleColor: UIColor(red: 0.906, green: 0.216, blue: 0.196, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: self, action:  #selector(handleGetTeam))
      b.withWidth(60)
            b.withHeight(40)
            b.buttonBorder(withRadius:20 , width: 2,color: .white)
      return b
  }()
  @objc func handleGetTeam(){
     }
  lazy var createLeague : UIButton = {
         let b = UIButton(title: "Create League", titleColor: UIColor(red: 0.906, green: 0.216, blue: 0.196, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: self, action: #selector(handlecreateLeague))
      b.withWidth(60)
            b.withHeight(40)
            b.buttonBorder(withRadius:20 , width: 2,color: .white)
         return b
     }()
    
  @objc func handlecreateLeague(){
       
  }
  
  lazy var mockDraft : UIButton = {
         let b = UIButton(title: "Mock Draft", titleColor: UIColor(red: 0.906, green: 0.216, blue: 0.196, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: self, action: #selector(handlemockDraft))
      b.withWidth(60)
      b.withHeight(40)
      b.buttonBorder(withRadius:20 , width: 2,color: .white)
         return b
     }()
    
  @objc func handlemockDraft(){
      
  }
    
    lazy var pageControl: UIPageControl = {
           let pc = UIPageControl()
           pc.currentPage = 0
           pc.numberOfPages = 2
           pc.currentPageIndicatorTintColor = UIColor(red: 0.91, green: 0.392, blue: 0.251, alpha: 1)
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
         
//        pc.layer.borderColor = UIColor(red: 0.91, green: 0.392, blue: 0.251, alpha: 1).cgColor
//        pc.layer.borderWidth = 1
           return pc
       }()
    
//    lazy var myTeam : UIButton = {
//        let b = UIButton(title: "My Team", titleColor: UIColor(red: 0.906, green: 0.271, blue: 0.216, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: self, action: #selector(handlemockDraft))
////     b.withWidth(60)
////     b.withHeight(40)
////     b.buttonBorder(withRadius:20 , width: 2,color: .white)
//        return b
//    }()
//     lazy var inviteOwners : UIButton = {
//            let b = UIButton(title: "Invite Owners", titleColor: UIColor(red: 0.906, green: 0.271, blue: 0.216, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: self, action: #selector(handlemockDraft))
//    //     b.withWidth(60)
//    //     b.withHeight(40)
//    //     b.buttonBorder(withRadius:20 , width: 2,color: .white)
//            return b
//        }()
//    lazy var arizona: UIButton = {
//        let b = UIButton(title: "Arizona League", titleColor: .white, font: AppFont.Bold().twelve, backgroundColor: UIColor(red: 0.906, green: 0.271, blue: 0.216, alpha: 1), target: nil, action: nil)
//           return b
//       }()
//       lazy var scheduleDraft: UIButton = {
//           let b = UIButton(title: "Schedule Draft >", titleColor: UIColor(red: 0.906, green: 0.271, blue: 0.216, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
//           return b
//     }()
//    lazy var teamLabel: UILabel = {
//           let l = UILabel(text: "Team Alex", font: AppFont.Medium().sixteen, textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment: .center, numberOfLines: 1)
//
//                 return l
//             }()
//
//       lazy var nameLabel: UILabel = {
//           let l = UILabel(text: "Bella Alex", font: AppFont.Medium().twelve, textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment: .center, numberOfLines: 1)
//
//             return l
//         }()
//
    lazy var customCard: customCardView = {
        let c = customCardView()
        return c
    }()
    var selectedColor:UIColor? {
           didSet{
//            self.customCard.arizona.backgroundColor = selectedColor
//            self.customCard.scheduleDraft.setTitleColor(selectedColor, for: .normal)
//            self.customCard.myTeam.setTitleColor(selectedColor, for: .normal)
//            self.customCard.inviteOwners.backgroundColor = selectedColor
            bgView.backgroundColor = selectedColor
           }
    }
     let bgView = UIView(backgroundColor: MyColors.BasketBall().backgroundGradient1)
    override init(frame: CGRect) {
        super.init(frame: frame)
         
        bgView.setGradientBackground(colorOne: MyColors.BasketBall().backgroundGradient1, colorTwo: MyColors.BasketBall().backgroundGradient2)
               addSubview(bgView)
        bgView.anchor(top: nil, leading: leadingAnchor, bottom: self.bottomAnchor, trailing: trailingAnchor, padding: .zero, size: .init(width: 0, height: 60))
        
        let view = customCard
        view.setCorner(withRadius: 17)
        view.setupShadow(opacity: 1, radius: 14, offset: CGSize(width: 0, height: 1), color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.17))
        
        




        let h2 = hstack(getATeambtn,createLeague,mockDraft)
               h2.spacing = 10
               h2.distribution = .fillEqually


        let main = stack(view,pageControl,h2).padLeft(10).padRight(10).padBottom(10).padTop(10)
        main.spacing = 10
        
          setupShadow(opacity: 1, radius: 12, offset: .init(width: 0, height: 4), color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.17) )
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
class customCardView:UIView{
    @objc func handlemockDraft(){
         
     }
     lazy var myTeam : UIButton = {
            let b = UIButton(title: "My Team", titleColor: UIColor(red: 0.906, green: 0.271, blue: 0.216, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: self, action: #selector(handlemockDraft))
    //     b.withWidth(60)
    //     b.withHeight(40)
    //     b.buttonBorder(withRadius:20 , width: 2,color: .white)
            return b
        }()
         lazy var inviteOwners : UIButton = {
            let b = UIButton(title: "Invite Owners", titleColor: .white, font: AppFont.Bold().twelve, backgroundColor: UIColor(red: 0.906, green: 0.271, blue: 0.216, alpha: 1), target: self, action: #selector(handlemockDraft))
        //     b.withWidth(60)
        //     b.withHeight(40)
        //     b.buttonBorder(withRadius:20 , width: 2,color: .white)
                return b
            }()
        lazy var arizona: UIButton = {
            let b = UIButton(title: "Arizona League", titleColor: .white, font: AppFont.Bold().twelve, backgroundColor: UIColor(red: 0.906, green: 0.271, blue: 0.216, alpha: 1), target: nil, action: nil)
               return b
           }()
           lazy var scheduleDraft: UIButton = {
               let b = UIButton(title: "Schedule Draft >", titleColor: UIColor(red: 0.906, green: 0.271, blue: 0.216, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
               return b
         }()
        lazy var teamLabel: UILabel = {
               let l = UILabel(text: "Team Alex", font: AppFont.Medium().sixteen, textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment: .center, numberOfLines: 1)

                     return l
                 }()
           
           lazy var nameLabel: UILabel = {
               let l = UILabel(text: "Bella Alex", font: AppFont.Medium().twelve, textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment: .center, numberOfLines: 1)

                 return l
             }()
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        
        
    }
    convenience init(color:UIColor? = nil ) {
        self.init()
        //modifying with respect to color passed
        self.arizona.backgroundColor = color
        self.scheduleDraft.setTitleColor(color, for: .normal)
        self.myTeam.setTitleColor(color, for: .normal)    
        self.inviteOwners.backgroundColor = color
        
        let hstack1 = hstack(arizona,UIView(),scheduleDraft).padRight(10)
        hstack1.distribution = .fillEqually
        
        let stack1 =  stack(AspectFitImageView(image: #imageLiteral(resourceName: "shirt 1")).withHeight(30),teamLabel,nameLabel,UIView())
        let hstack2 = hstack(myTeam,inviteOwners)
        hstack2.distribution = .fillEqually
        hstack2.withHeight(40)
        let mainStack = stack(hstack1,stack1,hstack2).padTop(20)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
class BasketballVC: BaseListController, UICollectionViewDelegateFlowLayout {
    
//    lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//         cv.dataSource = self
//        cv.delegate = self
//        return cv
//    }()
    var color:UIColor?
    var selectedColor:UIColor? {
        didSet{

            self.color = selectedColor 
        }
    }
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
    fileprivate let  cellId = "basketBallId"
    fileprivate let supplementaryViewId = "supplementaryViewId"

//    func fetchVideos() {
//        ApiService.shared.fetchVideos { (videos: [Video]) in
//
//            self.videos = videos
//            self.collectionView.reloadData()
//
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(BasketballHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: supplementaryViewId)
        collectionView.register(RugbyCells.self, forCellWithReuseIdentifier: cellId)
    }
//    override func setupViews() {
//        super.setupViews()
//        addSubview(AllMatchUps)
////        addSubview(topMatch)
////        topMatch.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 50 + 50 , left: 20, bottom: 0, right: 0), size: .init(width: 0, height: 40))
////        _ = topMatch.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
////        AllMatchUps.anchor(top: safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 50 + 50 , left: 0, bottom: 0, right: 20), size: .init(width: 100, height: 40))
////
////
//////        hstack(topMatch,UIView(),AllMatchUps)
////
////// 50 menu bar height
////        addSubview(collectionView)
////        collectionView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 50 + 50 + 40, left: 0, bottom: 0, right: 0), size: .zero)
////        collectionView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 0))
//        collectionView.backgroundColor = .white
//        collectionView.register(BasketballHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: supplementaryViewId)
//        collectionView.register(DashboardCells.self, forCellWithReuseIdentifier: cellId)
//    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryViewId, for: indexPath) as! BasketballHeader
        supplementaryView.selectedColor = self.color
        return supplementaryView
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? RugbyCells else{return UICollectionViewCell()}

 
//        cell.video = videos?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let videoLauncher = VideoLauncher()
//        videoLauncher.showVideoPlayer()
//    }
    
    
}

 
import SwiftUI
struct basketBallVCContainer:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<basketBallVCContainer.ContainerView>) -> UIViewController {
            BasketballVC()
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<basketBallVCContainer.ContainerView>) {
             
        }
        
        
       
    }
}
