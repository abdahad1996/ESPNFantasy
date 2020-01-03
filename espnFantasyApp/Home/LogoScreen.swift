//
//  LogoScreen.swift
//  espnFantasyApp
//
//  Created by prog on 12/30/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit
class logoScreen : LBTAFormController {
    
    lazy var teamLabel: UILabel = {
        let l = UILabel(text: "Team Alex", font: AppFont.Medium().sixteen, textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment: .center, numberOfLines: 1)

              return l
          }()
    
    lazy var nameLabel: UILabel = {
        let l = UILabel(text: "Bella Alex", font: AppFont.Medium().twelve, textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment: .center, numberOfLines: 1)

          return l
      }()
    
   let tradeCollectionVC = tradeController()
   
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavBar()
setUpView()
    }
//    override func viewWillLayoutSubviews() {
//        setUpView()
//    }
    func setUpView(){
        formContainerStackView.padTop(30)
        
           let v1 = UIStackView(arrangedSubviews: [AspectFitImageView(image: #imageLiteral(resourceName: "shirt 1"), cornerRadius: 0),teamLabel,nameLabel])
        v1.axis = .vertical
        v1.distribution = .fill
        v1.padLeft(10)
        v1.padTop(20)
        v1.padRight(10)
        v1.padBottom(20)
        v1.spacing = 10

        
        
       
        tradeCollectionVC.view.withBorder(width: 1, color: .init(white: 0.9, alpha: 1))
        let v2 = UIStackView(arrangedSubviews: [tradeCollectionVC.view])
        v2.padLeft(5).padRight(5)
//        v2.withHeight(tradeCollectionVC.view.frame.height)
        v2.withHeight(6.2*40)
        
            
        

         
    
        formContainerStackView.padRight(10).padLeft(10)
        
        formContainerStackView.addArrangedSubview(v1)
         
        formContainerStackView.addArrangedSubview(v2)
         

        
        

    }
    func setUpNavBar(){
        let titleView = UIView(backgroundColor: .clear)
                      let lessWidth: CGFloat = 30 + 20 + 60 + 95
                      let width = (view.frame.width - lessWidth)
        
        titleView.hstack(UIButton(image: #imageLiteral(resourceName: "go-back-left-arrow 1"), tintColor: .white, target: self, action: #selector(tapOnBack)).withWidth(20), AspectFitImageView(image: #imageLiteral(resourceName: "Group 43"), cornerRadius: 0), UIView().withWidth(width).withHeight(60), UIButton(image: #imageLiteral(resourceName: "pencil-edit-button 1"), tintColor: .white, target: nil, action: nil).withWidth(30), spacing: 25).padBottom(8)
        
            navigationItem.titleView = titleView
//            navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "go-back-left-arrow 1"), style: .plain, target: self, action: #selector(tapOnBack))
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
}
import SwiftUI
struct logo: PreviewProvider {
    
    static var previews: some View {
                 ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
         
        
         
        
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<logo.ContainerView>) -> UIViewController {
            return UINavigationController(rootViewController: logoScreen())
        }
        
        func updateUIViewController(_ uiViewController: logo.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<logo.ContainerView>) {
            
        }
    }
    
}
