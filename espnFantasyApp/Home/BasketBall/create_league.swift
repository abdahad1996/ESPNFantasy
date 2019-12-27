//
//  create_league.swift
//  espnFantasyApp
//
//  Created by engitech on 27/12/2019.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit

class create_league : LBTAFormController {
    lazy var leagueNameLabel: UILabel = {
        let l = UILabel(text: "League Name", font: AppFont.Medium().twelve, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)
              
              return l
          }()
    lazy var leagueTF: IndentedTextField = {
        let leagueTF = IndentedTextField(placeholder: "Arizona League", padding: 26, cornerRadius: 30, backgroundColor: .white)
        leagueTF.font = AppFont.Regular().twelve
        leagueTF.constrainHeight(60)
        leagueTF.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        leagueTF.layer.borderWidth = 1
        leagueTF.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        return leagueTF
    }()
        lazy var NoTeamLabel: UILabel = {
        let l = UILabel(text: "No of Teams", font: AppFont.Medium().twelve, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)
              
              return l
          }()
    lazy var four: RoundedShadowButton = {
        let b = RoundedShadowButton(title: "4", titleColor: .white, font: AppFont.Medium().twelve, backgroundColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1)
            , target: self,action:#selector(handleSettingTapped) )
        b.tag = 0
        b.constrainHeight(40)
        b.constrainWidth(40)

        return b
    }()
    lazy var six: RoundedShadowButton = {
        let b = RoundedShadowButton(title: "4", titleColor: .white, font: AppFont.Medium().twelve, backgroundColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1)
            , target: self,action:#selector(handleSettingTapped) )
        b.tag = 1
        b.constrainHeight(40)
               b.constrainWidth(40)
        return b
    }()
    lazy var eight: RoundedShadowButton = {
        let b = RoundedShadowButton(title: "4", titleColor: .white, font: AppFont.Medium().twelve, backgroundColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1)
            , target: self,action:#selector(handleSettingTapped) )
        b.tag = 2
        b.constrainHeight(40)
        b.constrainWidth(40)
        return b
    }()
    lazy var ten: RoundedShadowButton = {
        let b = RoundedShadowButton(title: "4", titleColor: .white, font: AppFont.Medium().twelve, backgroundColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1)
            , target: self,action:#selector(handleSettingTapped) )
        b.tag = 3
        b.constrainHeight(40)
               b.constrainWidth(40)
        return b
    }()
    lazy var twelve: RoundedShadowButton = {
        let b = RoundedShadowButton(title: "4", titleColor: .white, font: AppFont.Medium().twelve, backgroundColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1)
            , target: self,action:#selector(handleSettingTapped) )
        b.tag = 4
        b.constrainHeight(40)
               b.constrainWidth(40)
        return b
    }()
    lazy var fourteen: RoundedShadowButton = {
        let b = RoundedShadowButton(title: "4", titleColor: .white, font: AppFont.Medium().twelve, backgroundColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1)
            , target: self,action:#selector(handleSettingTapped) )
        b.tag = 5
        b.constrainHeight(40)
        b.constrainWidth(40)
        return b
    }()
    lazy var sixteen: RoundedShadowButton = {
           let b = RoundedShadowButton(title: "4", titleColor: .white, font: AppFont.Medium().twelve, backgroundColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1)
               , target: self,action:#selector(handleSettingTapped) )
           b.tag = 6
        b.constrainHeight(40)
            b.constrainWidth(40)
           return b
       }()
    
    @objc func handleSettingTapped(_ sender: AnyObject){
        switch sender.tag{
                   
               case 0:
                  print("")
               case 1:
                   print("")
            case 2:
                    print("")
            case 3:
                              print("")
            case 4:
                              print("")
            case 5:
                              print("")
               default:
                    print("")
               }
            
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavBar()
        setUpView()
    }
    
    func setUpView(){
           let v1 = UIStackView(arrangedSubviews: [leagueNameLabel,leagueTF])
        v1.axis = .vertical
        v1.distribution = .fill
        v1.padLeft(10)
        v1.padTop(20)
        v1.padRight(10)
        v1.spacing = 10

//         let h1 = UIStackView(arrangedSubviews: [four,six,eight,ten,twelve,fourteen,sixteen])
//              v1.axis = .horizontal
//              v1.distribution = .fillEqually
////              v1.padLeft(10)
////              v1.padTop(20)
////              v1.padRight(10)
//              v1.spacing = 10
        
        let separatorStack = UIStackView(arrangedSubviews: [UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
        separatorStack.padTop(20).padBottom(20)
        
        formContainerStackView.addArrangedSubview(v1)
        formContainerStackView.addArrangedSubview(separatorStack)
        formContainerStackView.addArrangedSubview(NoTeamLabel)
       
//        formContainerStackView.addArrangedSubview(h1)

        

    }
    func setUpNavBar(){
            navigationItem.title = "Create League"
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
struct lea:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<lea.ContainerView>) -> UIViewController {
           UINavigationController(rootViewController: create_league())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<lea.ContainerView>) {
             
        }
        
        
       
    }
}
