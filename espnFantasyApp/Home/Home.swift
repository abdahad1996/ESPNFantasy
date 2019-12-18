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

    let appLogoImageView = UIImageView(image: #imageLiteral(resourceName: "antasy"), contentMode: .scaleAspectFit)
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
           print("setting")
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
    
     
     
     func setupCollectionView() {
        //collectionview is horizontal so when we swipe we get correct index for menubars horizontal bar to go to
         if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
             flowLayout.scrollDirection = .horizontal
             flowLayout.minimumLineSpacing = 0
         }
         
         collectionView?.backgroundColor = UIColor.white
         
         collectionView?.register(Dashboard.self, forCellWithReuseIdentifier: cellId)
//         collectionView?.register(TrendingCell.self, forCellWithReuseIdentifier: trendingCellId)
//         collectionView?.register(SubscriptionCell.self, forCellWithReuseIdentifier: subscriptionCellId)
        
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
        let titleView = UIView(backgroundColor: .clear)
               let lessWidth: CGFloat = 30 + 20 + 120 + 35
               let width = (view.frame.width - lessWidth)
         titleView.hstack(appLogoImageView.withWidth(120), iconButton.withWidth(30).withHeight(30), UIView().withWidth(width), settingButton.withWidth(20), spacing: 5).padBottom(8)
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? Dashboard else{return UICollectionViewCell() }
        
//        switch indexPath.item    {
//        case 0:
//            cell.backgroundColor = .red
//            case 1:
//                       cell.backgroundColor = .yellow
//            case 2:
//                       cell.backgroundColor = .blue
//            case 3:
//                       cell.backgroundColor = .green
//            case 4:
//                       cell.backgroundColor = .yellow
//            case 5:
//                       cell.backgroundColor = .red
//        default:
//                   cell.backgroundColor = .green
//
//        }
 //           let identifier: String
//        switch
//           if indexPath.item == 1 {
//               identifier = trendingCellId
//           } else if indexPath.item == 2 {
//               identifier = subscriptionCellId
//           } else {
//               identifier = cellId
//           }
//
//           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FeedCell
           
           return cell
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
      

        globalTotalHeigt = topbarHeight
        menuBar.setupShadow(opacity: 1, radius: 12, offset: .init(width: 0, height: 4), color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.17) )
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
