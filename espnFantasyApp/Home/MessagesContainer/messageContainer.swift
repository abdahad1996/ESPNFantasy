//
//  messageContainer.swift
//  espnFantasyApp
//
//  Created by prog on 12/30/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
//
//  editOwners.swift
//  espnFantasyApp
//
//  Created by prog on 12/30/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
//
//  Home.swift
//  espnFantasyApp
//
//  Created by prog on 12/15/19.
//  Copyright © 2019 prog. All rights reserved.
//
 
 
import Foundation
import UIKit
class messageContainer:BaseListController,UICollectionViewDelegateFlowLayout{
    //Mark:Views
    let cellId = "cellId"
    private let notificationCenter = NotificationCenter.default

    let appLogoImageView = UIImageView(image: #imageLiteral(resourceName: "antasy"), contentMode: .scaleAspectFit)
    lazy var iconButton: UIButton = {
        let button = UIButton(image: #imageLiteral(resourceName: "drop-down-arrow 1"), tintColor:.white, target: self, action: #selector(handleIconTapped))
        return button
    }()
    lazy var settingButton: UIButton = {
        let button = UIButton(image: #imageLiteral(resourceName: "Group"), tintColor:.white, target: self, action: #selector(handleSettingTapped))
    
        return button
    }()
    lazy var menuBar: segmentedMenuText = {
        let mb = segmentedMenuText()
        
//        mb.homeController = self
        mb.delegate = self
        return mb
    }()
    
    //Mark:Selectors
    @objc func handleIconTapped(){
        print("tapped")
    }
    @objc func handleSettingTapped(){
        let vc = SettingVC()
       let nav = UINavigationController(rootViewController: vc)
       
//        self.navigationController?.pushViewController(vc, animated: true)
        nav.modalPresentationStyle = .fullScreen
        self.navigationController?.present(nav, animated: true, completion: nil)
        
       }
    var imageNames = ["Message Area", "LM Poll"]
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.isTranslucent = true
        collectionView.backgroundColor = .white
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 1).isActive = true
        setupMenuBar()
        menuBar.imageNames = self.imageNames
        menuBar.collectionView.reloadData()
        menuBar.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        setUpNavBar()
setupCollectionView()
        
        
    }
   //MARK : - add Notification
    func addObserver(){
        notificationCenter
                         .addObserver(self,
                          selector:#selector(createLeague(_:)),
                          name: .createLeague,
                          object: nil)
        notificationCenter
        .addObserver(self,
         selector:#selector(mockDraft(_:)),
         name: .mockDraft,
         object: nil)
    }
    @objc func mockDraft(_ notification: Notification) {
 print(notification.object as? [String: Any] ?? [:])
        
        
        let vc = Mock_Draft()
           
        let nav =
UINavigationController(rootViewController: vc)
           nav.modalPresentationStyle = .fullScreen
           nav.modalTransitionStyle = .crossDissolve
           self.navigationController?.present(nav, animated: true, completion: nil)
       }
     @objc func createLeague(_ notification: Notification) {
           print(notification.object as? [String: Any] ?? [:])
        let vc = create_league()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .crossDissolve
        self.navigationController?.present(nav, animated: true, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        addObserver()

    }
     //MARK : - Remove Notification
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        removeNotification()

    }

    
       
    
func removeNotification(){
               notificationCenter.removeObserver(self,
                            name: .createLeague ,
                            object: nil)
}
     func setupCollectionView() {
        //collectionview is horizontal so when we swipe we get correct index for menubars horizontal bar to go to
         if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
             flowLayout.scrollDirection = .horizontal
             flowLayout.minimumLineSpacing = 0
         }
         
         collectionView?.backgroundColor = UIColor.white
         
        collectionView?.register(messageCell.self, forCellWithReuseIdentifier: MessageEnum.first.rawValue)
        
         collectionView?.register(inviteCell.self, forCellWithReuseIdentifier: MessageEnum.second.rawValue)
        

        
         //content getting underneath
         collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
         collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)

         collectionView?.isPagingEnabled = true
     }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func setUpNavBar(){
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Save"), style: .plain, target: self, action: #selector(tapOnBack))

                navigationItem.title = "Messages"
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "go-back-left-arrow 1"), style: .plain, target: self, action: #selector(tapOnBack))
                self.navigationController?.setAllTitleColor(.white)
    //            self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.tintColor = .white
        
        
    //                  self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.setGradientBackground(colors: [MyColors.BasketBall().backgroundGradient1,MyColors.BasketBall().backgroundGradient2])
        
            }
    @objc func tapOnBack(){
    //            self.navigationController?.dismiss(animated: true, completion: nil)
            dismiss(animated: true, completion: nil)
        //        self.navigationController?.popViewController(animated: true)
            }
    //for calculating indexpath from homescreen eg when dragging. when we click on icon that is done by collectionview
    //changenavbar color here
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//          for moving horizontal bar
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / CGFloat(imageNames.count)
        
        print(scrollView.contentOffset.x/2)
       }
       //indexpath is calcialted when we swipe and when n drag is finishd we divide by frame width to get index and den we move menybar accodingly
       override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
           print(Int(targetContentOffset.pointee.x))
           let index = Int(targetContentOffset.pointee.x / view.frame.width)
           let indexPath = IndexPath(item: index, section: 0)
           menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        //setupnavbar colors and menubar horizontalbar color
        if let navigationBar = self.navigationController?.navigationBar  {
             determineGradientByIndexPath(navigationBar: navigationBar, index: index)
            menuBar.determineGradientByIndexPath(index: index)

        }
//           setTitleForIndex(index: index)
       }
     override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return imageNames.count
       }
       
       override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let identifier: String
        switch indexPath.item    {

        case 0:
            identifier = MessageEnum.first.rawValue
              guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? messageCell else{return UICollectionViewCell() }
                            

            return cell
            case 1:
                identifier = MessageEnum.second.rawValue

                        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? inviteCell else{return UICollectionViewCell() }
            return cell

          

        default:
             
                      identifier = "Dashboard"
                                            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Dashboard", for: indexPath) as? Dashboard else{return UICollectionViewCell() }
                                return cell


        }
  
           
        }
    func determineGradientByIndexPath(navigationBar:UINavigationBar? = nil ,index:Int,view:UIView? = nil ){
        navigationBar?.setGradientBackground(colors: [MyColors.BasketBall().backgroundGradient1, MyColors.BasketBall().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
        
        //            view?.backgroundColor = MyColors.BasketBall().backgroundGradient1
//        switch index {
//        case 0:
//            navigationBar?.setGradientBackground(colors: [MyColors.Dashboard().backgroundGradient1, MyColors.Dashboard().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
//            view?.backgroundColor = MyColors.Dashboard().backgroundGradient1
//
//        case 1:
//            navigationBar?.setGradientBackground(colors: [MyColors.Rugby().backgroundGradient1, MyColors.Rugby().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
//            view?.backgroundColor = MyColors.Rugby().backgroundGradient1
//
//        case 2:  navigationBar?.setGradientBackground(colors: [MyColors.BasketBall().backgroundGradient1, MyColors.BasketBall().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
//            view?.backgroundColor = MyColors.BasketBall().backgroundGradient1
//
//        case 3:  navigationBar?.setGradientBackground(colors: [MyColors.Hockey().backgroundGradient1, MyColors.Hockey().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
//            view?.backgroundColor = MyColors.Hockey().backgroundGradient1
//
//        case 4:  navigationBar?.setGradientBackground(colors: [MyColors.Baseball().backgroundGradient1, MyColors.Baseball().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
//            view?.backgroundColor = MyColors.Baseball().backgroundGradient1
//
//
//        default:
//            navigationBar?.setGradientBackground(colors: [MyColors.Play().backgroundGradient1, MyColors.Play().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
//            view?.backgroundColor = MyColors.Play().backgroundGradient1
//
//        }
    }
    private func setupMenuBar() {
            
         let whiteView = UIView()
        whiteView.backgroundColor = .white
        view.addSubview(whiteView)
        //for dragging when no view we add default whiteview for navbar
         whiteView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: 50))

        view.addSubview(menuBar)
        menuBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: 50))
        menuBar.setupShadow(opacity: 1, radius: 14, offset: CGSize(width: 0, height: 1), color:  UIColor(red: 0, green: 0, blue: 0, alpha: 0.17))
      
        //we dont use
        globalTotalHeigt = Int(topbarHeight)
//        menuBar.setupShadow(opacity: 1, radius: 12, offset: .init(width: 0, height:4), color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.17) )
//           let redView = UIView()
//           redView.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
//           view.addSubview(redView)
//           view.addConstraintsWithFormat("H:|[v0]|", views: redView)
//           view.addConstraintsWithFormat("V:[v0(50)]", views: redView)
           
////           view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
//           view.addConstraintsWithFormat("V:[v0(50)]", views: menuBar)
           
//           menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
       }
}
//when we scroll from menubar den collectionview should also scroll and vice versa too
extension messageContainer:scroll {
    func scrollToMenuIndex(menuIndex: Int){
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        //setupnavbar colors
        if let navigationBar = self.navigationController?.navigationBar  {
             determineGradientByIndexPath(navigationBar: navigationBar, index: menuIndex)
            menuBar.determineGradientByIndexPath(index: menuIndex)

        }
//        setTitleForIndex(index: menuIndex)
        
    }
}

import SwiftUI
struct message:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<message.ContainerView>) -> UIViewController {
           UINavigationController(rootViewController: messageContainer())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<message.ContainerView>) {
             
        }
        
        
       
    }
}
extension messageContainer:tappable{
    func tapGetTeam() {
        
    }
    
    func createLeague() {
        
        
    }
    
    func makeMock() {
        
    }
    
    
}
 



 

//
//  editOwnersCell.swift
//  espnFantasyApp
//
//  Created by prog on 12/30/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
 import UIKit
 
class messageCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
         cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    lazy var topMatch: UILabel = {
        let t = UILabel(text: "All Topics", font: AppFont.Bold().sixteen, textColor: UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), textAlignment: .left, numberOfLines: 1)
        return t
    }()
    lazy var AllMatchUps: UILabel = {
        let t = UILabel(text: "New Topic", font: AppFont.Medium().sixteen, textColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1), textAlignment: .right, numberOfLines: 1)
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
//    lazy var getATeambtn : UIButton = {
//              let b = UIButton(title: "Get a Team", titleColor:   UIColor(red: 0.071, green: 0.631, blue: 0.792, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
//           b.withHeight(40)
//                     b.buttonBorder(withRadius:20 , width: 2,color: .white)
//              return b
//          }()
//          lazy var createLeague : UIButton = {
//                 let b = UIButton(title: "Create League", titleColor:   UIColor(red: 0.071, green: 0.631, blue: 0.792, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
//              b.withHeight(40)
//               b.buttonBorder(withRadius:20 , width: 2,color: .white)
//                 return b
//             }()
//          lazy var mockDraft : UIButton = {
//                 let b = UIButton(title: "Mock Draft", titleColor:   UIColor(red: 0.071, green: 0.631, blue: 0.792, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
//              b.withHeight(40)
//              b.buttonBorder(withRadius:20 , width: 2,color: .white)
//                 return b
//             }()
       
    
    override func setupViews() {
        super.setupViews()
       
 addSubview(topMatch)
        addSubview(AllMatchUps)

        topMatch.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 50 + 50 , left: 20, bottom: 0, right: 0), size: .init(width: 0, height: 40))
        _ = topMatch.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        AllMatchUps.anchor(top: safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 50 + 50 , left: 0, bottom: 0, right: 20), size: .init(width: 100, height: 40))
        
//        hstack(topMatch,UIView(),AllMatchUps)
        
// 50 menu bar height
        addSubview(collectionView)
        collectionView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 50 + 50 + 40 , left: 0, bottom: 0, right: 0), size: .zero)
//        collectionView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        collectionView.backgroundColor = .white
        
        collectionView.register(messageSubCell.self, forCellWithReuseIdentifier: cellId)
    }
      
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! messageSubCell
 
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

class messageSubCell: BaseCell {
    //make component subclass
 lazy var textlabel1: UILabel = {
    let l = UILabel(text: "HhH...........", font: AppFont.Bold().sixteen, textColor:UIColor(red: 0.004, green: 0.569, blue: 0.784, alpha: 1), textAlignment:.left , numberOfLines: 1)
  l.backgroundColor = .white
      return l
     
 }()
    lazy var textlabel2: UILabel = {
       let l = UILabel(text: "Bella Alex", font: AppFont.Medium().sixteen, textColor:UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment:.left, numberOfLines: 1)
     l.backgroundColor = .white
         return l
        
    }()
    lazy var textlabel3: UILabel = {
       let l = UILabel(text: "Team Alex", font: AppFont.Medium().fourteen, textColor:UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), textAlignment:.left, numberOfLines: 1)
     l.backgroundColor = .white
         return l
        
    }()
    lazy var textlabel4: UILabel = {
    let l = UILabel()
                        let primaryStr =  "Nov 27  "
                                let secondaryString = "7:52 PM"
                        let attributedString = NSMutableAttributedString(string: "\(primaryStr)\(secondaryString)", attributes: [
                        .font: AppFont.Regular().twelve,
                        .foregroundColor: UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1)
                           ])
          
                        attributedString.addAttributes([
                        .font: AppFont.Regular().twelve,
                        .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                        ], range: NSRange(location: 0, length:  primaryStr.count))
          
                                l.attributedText = attributedString
        l.numberOfLines = 1
          return l
      }()

    
    
    lazy var replylabel: UILabel = {
        let l = UILabel(text: "0 Replies", font: AppFont.Regular().sixteen, textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment:.left, numberOfLines: 1)
        l.backgroundColor = .white
            return l
           
       }()
    

//   lazy var image: AspectFitImageView = {
//             let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "katrina-berban-k24k1INxuxk-unsplash 1"), cornerRadius: 0)
////    imageView.constrainHeight(100)
////    imageView.constrainWidth(100)
//             return  imageView
//         }()
// lazy var logoButton: UIButton = {
//    let b = UIButton(title: "Remove", titleColor: .white, font: AppFont.Medium().twelve, backgroundColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1), target: self, action: nil)
//
//
//     let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "upload 1"), cornerRadius: 0)
//     let img = imageView.image
//
//
//
//            b.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 50)
//      let imageG = #imageLiteral(resourceName: "upload 1")
//            b.setImage(imageG.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
//    b.tintColor = .white
//
//     return b
// }()
//
//    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        backgroundColor = .white
        let separator = UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withWidth(1)
        
        let v1 = stack(textlabel1,textlabel2,textlabel3,textlabel4,UIView().withHeight(5)) .padLeft(10)
        v1.spacing = 5
//         let separatorStack1 = stack(UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1))
//         separatorStack1.padTop(10).padBottom(10)
        let v2 = stack(UIView().withHeight(20),replylabel.withHeight(40),UIView())
//        v2.distribution = .fill
//        let h1 = hstack(v1,UIView(),v2.withWidth(150))
//        logoButton.setCorner(withRadius: 20)
//        h1.spacing = 5
        let h1 = hstack(v1,UIView(),separator,v2.withWidth(90)).padLeft(10).padRight(10).padTop(10)
        h1.spacing = 15
        h1.setCorner(withRadius: 12)
       
       
        setupShadow(opacity: 1, radius: 12, offset: CGSize(width: 0, height: 0), color:   UIColor(red: 0, green: 0, blue: 0, alpha: 0.14))
    }
}
