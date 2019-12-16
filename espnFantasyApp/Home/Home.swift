//
//  Home.swift
//  espnFantasyApp
//
//  Created by prog on 12/15/19.
//  Copyright © 2019 prog. All rights reserved.
//

 
import Foundation
import UIKit
class Home:BaseListController{
    //Mark:Views
    
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
        collectionView.backgroundColor = .clear
        setUpNavBar()
    }
    override func viewDidLayoutSubviews() {
        
    }
    func setUpNavBar(){
        let titleView = UIView(backgroundColor: .clear)
               let lessWidth: CGFloat = 30 + 20 + 120 + 35
               let width = (view.frame.width - lessWidth)
        titleView.hstack(appLogoImageView.withWidth(120), iconButton.withWidth(30).withHeight(30), UIView().withWidth(width), settingButton.withWidth(20), spacing: 5).padBottom(8)
        if let navigationBar = self.navigationController?.navigationBar  {
             determineGradientByIndexPath(navigationBar: navigationBar, index: 0)

        }
 
               navigationItem.titleView = titleView
    }
    
    func determineGradientByIndexPath(navigationBar:UINavigationBar,index:Int){
        switch index {
        case 0:
            navigationBar.setGradientBackground(colors: [MyColors.Dashboard().backgroundGradient1, MyColors.Dashboard().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
        case 1:
           navigationBar.setGradientBackground(colors: [MyColors.Rugby().backgroundGradient1, MyColors.Rugby().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
           case 2:  navigationBar.setGradientBackground(colors: [MyColors.BasketBall().backgroundGradient1, MyColors.BasketBall().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
             case 3:  navigationBar.setGradientBackground(colors: [MyColors.Hockey().backgroundGradient1, MyColors.Hockey().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
            case 4:  navigationBar.setGradientBackground(colors: [MyColors.Baseball().backgroundGradient1, MyColors.Baseball().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
            
        
        default:
              navigationBar.setGradientBackground(colors: [MyColors.Play().backgroundGradient1, MyColors.Play().backgroundGradient2], startPoint: .topLeft, endPoint: .topRight)
        }
    }
    private func setupMenuBar() {
           navigationController?.hidesBarsOnSwipe = true
        view.addSubview(menuBar)

        menuBar.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 50, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: 50))
//           let redView = UIView()
//           redView.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
//           view.addSubview(redView)
//           view.addConstraintsWithFormat("H:|[v0]|", views: redView)
//           view.addConstraintsWithFormat("V:[v0(50)]", views: redView)
           
////           view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
//           view.addConstraintsWithFormat("V:[v0(50)]", views: menuBar)
           
           menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
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
