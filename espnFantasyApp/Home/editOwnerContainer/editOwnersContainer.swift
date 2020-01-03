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
class editOwners:BaseListController,UICollectionViewDelegateFlowLayout{
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
    var imageNames = ["Remove Owners", "Invite Owners"]
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
         
        collectionView?.register(editOwnercell.self, forCellWithReuseIdentifier: Ownersenum.first.rawValue)
        
         collectionView?.register(inviteCell.self, forCellWithReuseIdentifier: Ownersenum.second.rawValue)
        

        
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

                navigationItem.title = "Edit Owners"
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
            identifier = Ownersenum.first.rawValue
              guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? editOwnercell else{return UICollectionViewCell() }
                            

            return cell
            case 1:
                identifier = Ownersenum.second.rawValue

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
extension editOwners:scroll {
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
struct edit:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<edit.ContainerView>) -> UIViewController {
           UINavigationController(rootViewController: editOwners())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<edit.ContainerView>) {
             
        }
        
        
       
    }
}
extension editOwners:tappable{
    func tapGetTeam() {
        
    }
    
    func createLeague() {
        
        
    }
    
    func makeMock() {
        
    }
    
    
}
 



 

