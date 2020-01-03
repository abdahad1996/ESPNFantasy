//
//  EditTeamInfo.swift
//  espnFantasyApp
//
//  Created by prog on 12/29/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
//
//  editTeamMain.swift
//  espnFantasyApp
//
//  Created by prog on 12/29/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit

class editTeamInfo : LBTAFormController {
    
    lazy var location: UILabel = {
        let l = UILabel(text: "location", font: AppFont.Medium().fourteen, textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment: .center, numberOfLines: 1)

              return l
          }()
    lazy var locationTF: IndentedTextField = {
           let username = IndentedTextField()
        username.textColor = UIColor(red: 0.254, green: 0.248, blue: 0.248, alpha: 1)
        username.text = "Team"
        username.textAlignment = .left

           username.font = AppFont.Regular().fourteen
           username.constrainHeight(60)
           username.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0).cgColor
           username.layer.borderWidth = 1
           username.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 0).cgColor
           return username
       }()
    lazy var Nickname: UILabel = {
           let l = UILabel(text: "Nickname", font: AppFont.Medium().fourteen, textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment: .center, numberOfLines: 1)

                 return l
             }()
       lazy var nicknameTF: IndentedTextField = {
           let username = IndentedTextField()
        username.textColor = UIColor(red: 0.254, green: 0.248, blue: 0.248, alpha: 1)
        username.text = "alex"
           username.font = AppFont.Regular().fourteen
        username.textAlignment = .left

           username.constrainHeight(60)
           username.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0).cgColor
           username.layer.borderWidth = 1
           username.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 0).cgColor
           return username
       }()
    lazy var abbrev: UILabel = {
           let l = UILabel(text: "Abbrev", font: AppFont.Medium().fourteen, textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment: .center, numberOfLines: 1)

                 return l
             }()
       lazy var abbrevTF: IndentedTextField = {
           let username = IndentedTextField()
        username.textColor = UIColor(red: 0.254, green: 0.248, blue: 0.248, alpha: 1)
        username.text = "BELL"
        username.textAlignment = .left
           username.font = AppFont.Regular().fourteen
           username.constrainHeight(60)
           username.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0).cgColor
           username.layer.borderWidth = 1
           username.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 0).cgColor
           return username
       }()
    lazy var currentLogo: AspectFitImageView = {
        let i = AspectFitImageView(image: #imageLiteral(resourceName: "shirt 1"))
        return  i
    }()
    lazy var currentLogoLabel: UILabel = {
        let l  = UILabel(text: "Current Logo", font: AppFont.Medium().twelve, textColor: UIColor(red: 0.906, green: 0.271, blue: 0.216, alpha: 1), textAlignment: .center, numberOfLines: 1)
        return l
    }()
    
    lazy var currentLogoLsideabel: UILabel = {
        let l  = UILabel(text: "Change your team logo with one\nfrom our collection of logo packs\nbelow, or reference your own image\nfrom the web", font: AppFont.Regular().twelve, textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment: .left, numberOfLines: 0)
        l.lineBreakMode = .byWordWrapping
        return l
    }()
   
    lazy var logoButton: UIButton = {
        let b = UIButton(title: "Use an Image From Web", titleColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: UIColor(red: 1, green: 0.882, blue: 0.879, alpha: 1), target: self, action: nil)
        
         
        let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "upload 1"), cornerRadius: 0)
        let img = imageView.image

        
        
               b.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 100)
         let imageG = #imageLiteral(resourceName: "upload 1")
               b.setImage(imageG.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
        b.tintColor = UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1)
        
        return b
    }()
  
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
        formContainerStackView.padTop(30).padLeft(20).padRight(20)
        
        let h1 = UIStackView(arrangedSubviews: [location.withWidth(100),UIView().withWidth(50),locationTF,UIView()])
        h1.axis = .horizontal
        h1.distribution = .fill
        h1.spacing = 10
        
        
        let h2 = UIStackView(arrangedSubviews: [Nickname.withWidth(100),UIView().withWidth(50),nicknameTF,UIView()])
        h2.axis = .horizontal
        h2.distribution = .fill
        h2.spacing = 10
        
        let h3 = UIStackView(arrangedSubviews: [abbrev.withWidth(100),UIView().withWidth(50),abbrevTF,UIView()])
               h3.axis = .horizontal
               h3.distribution = .fill
               h3.spacing = 10

        let separatorStack1 = UIStackView(arrangedSubviews: [UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
               separatorStack1.padTop(0).padBottom(0)
        
        let separatorStack2 = UIStackView(arrangedSubviews: [UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
                      separatorStack2.padTop(0).padBottom(0)
        
        let separatorStack3 = UIStackView(arrangedSubviews: [UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
        separatorStack3.padTop(0).padBottom(0)
        
       
        let v1 =  UIStackView(arrangedSubviews: [currentLogo,currentLogoLabel])
         v1.axis = .vertical
         v1.distribution = .fill
         v1.spacing = 10
        
        let h4 = UIStackView(arrangedSubviews: [ v1,currentLogoLsideabel.withWidth(200),UIView()])
                      h4.axis = .horizontal
                      h4.distribution = .fill
                      h4.spacing = 20
        h4.padTop(20)
       
        let customLogo = UILabel(text: "Custom Logo", font: AppFont.Medium().fourteen, textColor: .black, textAlignment: .left, numberOfLines: 1)
        
        
        let v2 =  UIStackView(arrangedSubviews: [customLogo,self.logoButton.withHeight(50)])
        logoButton.setCorner(withRadius: 25)
                v2.axis = .vertical
                v2.distribution = .fill
                v2.spacing = 10
        v2.padTop(20)
        formContainerStackView.addArrangedSubview(h1)
         formContainerStackView.addArrangedSubview(separatorStack1)
        
        formContainerStackView.addArrangedSubview(h2)
        
        formContainerStackView.addArrangedSubview(separatorStack2)
            
        formContainerStackView.addArrangedSubview(h3)
        
        formContainerStackView.addArrangedSubview(separatorStack3)
        
        formContainerStackView.addArrangedSubview(h4)
        
        formContainerStackView.addArrangedSubview(v2)
        
            
        

         
    
         
         

        
        

    }
    func setUpNavBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Save"), style: .plain, target: self, action: #selector(tapOnBack))

                navigationItem.title = "Edit Team Info"
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
}
import SwiftUI
struct edInfo: PreviewProvider {
    
    static var previews: some View {
                 ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<edInfo.ContainerView>) -> UIViewController {
            return UINavigationController(rootViewController: editTeamInfo())
        }
        
        func updateUIViewController(_ uiViewController: edInfo.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<edInfo.ContainerView>) {
            
        }
    }
    
}
