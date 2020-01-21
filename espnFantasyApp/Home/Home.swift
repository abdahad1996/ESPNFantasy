//
//  Home.swift
//  espnFantasyApp
//
//  Created by prog on 12/15/19.
//  Copyright © 2019 prog. All rights reserved.
//
extension UIViewController {

    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */

    var topbarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
 
import Foundation
import UIKit
class Home:BaseListController,UICollectionViewDelegateFlowLayout{
    //Mark:Views
    let cellId = "cellId"
    private let notificationCenter = NotificationCenter.default

    let appLogoImageView = UIImageView(image: #imageLiteral(resourceName: "81442389_475317849847624_2217900444271771648_n").withRenderingMode(.alwaysTemplate), contentMode: .scaleAspectFit)
    lazy var iconButton: UIButton = {
        let button = UIButton(image: #imageLiteral(resourceName: "drop-down-arrow 1"), tintColor:.white, target: self, action: #selector(handleIconTapped))
        return button
    }()
    lazy var settingButton: UIButton = {
        let button = UIButton(image: #imageLiteral(resourceName: "Group"), tintColor:.white, target: self, action: #selector(handleSettingTapped))
    
        return button
    }()
    lazy var menuBar: segmentedMenuBar = {
        let mb = segmentedMenuBar()
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.isTranslucent = true
        collectionView.backgroundColor = .white
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 1).isActive = true
        setupMenuBar()
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
         
        collectionView?.register(Dashboard.self, forCellWithReuseIdentifier: HomeSettings.Dashboard.rawValue)
        
         collectionView?.register(Rugby.self, forCellWithReuseIdentifier: HomeSettings.Rugby.rawValue)
        
         collectionView?.register(BasketBall.self, forCellWithReuseIdentifier: HomeSettings.BasketBall.rawValue)
        collectionView?.register(Hockey.self, forCellWithReuseIdentifier: HomeSettings.Hockey.rawValue)
         collectionView?.register(Baseball.self, forCellWithReuseIdentifier: HomeSettings.Baseball.rawValue)
          collectionView?.register(Play.self, forCellWithReuseIdentifier:         HomeSettings.Play.rawValue)

        
         //content getting underneath
         collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
         collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)

         collectionView?.isPagingEnabled = true
     }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func setUpNavBar(){
//        navigationController?.hidesBarsOnSwipe = true
        appLogoImageView.tintColor = .white
        let titleView = UIView(backgroundColor: .clear)
               let lessWidth: CGFloat = 30 + 20 + 120
               let width = (view.frame.width - lessWidth)
        titleView.hstack(appLogoImageView.withHeight(50), iconButton.withWidth(30), UIView().withWidth(width), settingButton.withWidth(20), spacing: 5).padBottom(8)
        
        if let navigationBar = self.navigationController?.navigationBar  {
             determineGradientByIndexPath(navigationBar: navigationBar, index: 0)

        }
                navigationItem.titleView = titleView
    }
    //for calculating indexpath from homescreen eg when dragging. when we click on icon that is done by collectionview
    //changenavbar color here
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//          for moving horizontal bar
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 6
        
        print(scrollView.contentOffset.x/6)
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
           return 6
       }
       
       override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let identifier: String
        switch indexPath.item    {

        case 0:
            identifier = HomeSettings.Dashboard.rawValue
              guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Dashboard else{return UICollectionViewCell() }
                            

            return cell
            case 1:
                identifier = HomeSettings.Rugby.rawValue

                        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Rugby else{return UICollectionViewCell() }
            return cell

            case 2:
                identifier = HomeSettings.BasketBall.rawValue
                        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? BasketBall
                             else{return UICollectionViewCell() }
            return cell

            case 3:
                         identifier = HomeSettings.Hockey.rawValue
                                                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Hockey else{return UICollectionViewCell() }
                                    return cell

            case 4:
                          identifier = HomeSettings.Baseball.rawValue
                                                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Baseball else{return UICollectionViewCell() }
                                    return cell

            case 5:
                         identifier = HomeSettings.Play.rawValue
                                                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Play else{return UICollectionViewCell() }
                                    return cell

        default:
             
                      identifier = "Dashboard"
                                            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Dashboard", for: indexPath) as? Dashboard else{return UICollectionViewCell() }
                                return cell


        }
  
           
        }
    func determineGradientByIndexPath(navigationBar:UINavigationBar? = nil ,index:Int,view:UIView? = nil ){
        switch index {
        case 0:
            navigationBar?.setGradientBackground(colors: [MyColors.Dashboard().backgroundGradient1, MyColors.Dashboard().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
            view?.backgroundColor = MyColors.Dashboard().backgroundGradient1
            
        case 1:
            navigationBar?.setGradientBackground(colors: [MyColors.Rugby().backgroundGradient1, MyColors.Rugby().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
            view?.backgroundColor = MyColors.Rugby().backgroundGradient1

        case 2:  navigationBar?.setGradientBackground(colors: [MyColors.BasketBall().backgroundGradient1, MyColors.BasketBall().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
            view?.backgroundColor = MyColors.BasketBall().backgroundGradient1

        case 3:  navigationBar?.setGradientBackground(colors: [MyColors.Hockey().backgroundGradient1, MyColors.Hockey().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
            view?.backgroundColor = MyColors.Hockey().backgroundGradient1

        case 4:  navigationBar?.setGradientBackground(colors: [MyColors.Baseball().backgroundGradient1, MyColors.Baseball().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
            view?.backgroundColor = MyColors.Baseball().backgroundGradient1

        
        default:
            navigationBar?.setGradientBackground(colors: [MyColors.Play().backgroundGradient1, MyColors.Play().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
            view?.backgroundColor = MyColors.Play().backgroundGradient1

        }
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
extension Home:scroll {
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
struct home:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<home.ContainerView>) -> UIViewController {
           UINavigationController(rootViewController: Home())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<home.ContainerView>) {
             
        }
        
        
       
    }
}
extension Home:tappable{
    func tapGetTeam() {
        
    }
    
    func createLeague() {
        
        
    }
    
    func makeMock() {
        
    }
    
    
}
extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
