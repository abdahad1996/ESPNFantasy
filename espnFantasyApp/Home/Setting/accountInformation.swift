//
//  accountInformation.swift
//  espnFantasyApp
//
//  Created by engitech on 26/12/2019.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit

class accountInformation:LBTAFormController{
    lazy var accountLabel:UILabel = {
        let label = UILabel(text: "Full Name", font: AppFont.Bold().twenty, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)
        return label
    }()
    lazy var accountTF: IndentedTextField = {
         let passwordTF = IndentedTextField(placeholder:  "Bella Alex", padding: 0, cornerRadius: 0, backgroundColor: .white)
        passwordTF.font = AppFont.Regular().twentytwo
        passwordTF.backgroundColor = .clear
        
         return passwordTF
     }()
    lazy var userNameLabel:UILabel = {
           let label = UILabel(text: "User Name", font: AppFont.Bold().twenty, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)
           return label
       }()
       lazy var userNameTF: IndentedTextField = {
            let passwordTF = IndentedTextField(placeholder:  "BellaAlex123", padding: 0, cornerRadius: 0, backgroundColor: .white)
            passwordTF.font = AppFont.Regular().twentytwo
           passwordTF.backgroundColor = .clear
           
            return passwordTF
        }()
    lazy var EmailAddressLabel:UILabel = {
               let label = UILabel(text: "Email Address", font: AppFont.Bold().twenty, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)
               return label
           }()
    
           lazy var EmailAddressTF: IndentedTextField = {
                let passwordTF = IndentedTextField(placeholder:  "BellaAlex123", padding: 0, cornerRadius: 0, backgroundColor: .white)
                passwordTF.font = AppFont.Regular().twentytwo
               passwordTF.backgroundColor = .clear
               
                return passwordTF
            }()
    lazy var FantasySubscriberLabel:UILabel = {
                  let label = UILabel(text: "Fantasy Subscriber", font: AppFont.Bold().twenty, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)
                  return label
              }()
       
              lazy var FantasySubscriberTF: IndentedTextField = {
                   let passwordTF = IndentedTextField(placeholder: "No", padding: 0, cornerRadius: 0, backgroundColor: .white)
                   passwordTF.font = AppFont.Regular().twentytwo
                  passwordTF.backgroundColor = .clear
                  
                   return passwordTF
               }()
    lazy var FreeTeamsLabel:UILabel = {
                  let label = UILabel(text: "Free Teams", font: AppFont.Bold().twenty, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)
                  return label
              }()
       
              lazy var FreeTeamsTF: IndentedTextField = {
                   let passwordTF = IndentedTextField(placeholder:  "0 (max:25)", padding: 0, cornerRadius: 0, backgroundColor: .white)
                   passwordTF.font = AppFont.Regular().twentytwo
                  passwordTF.backgroundColor = .clear
                  
                   return passwordTF
               }()
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .red
       setUpNavBar()
        scrollView.alwaysBounceVertical = true
        formContainerStackView.axis = .vertical
        
               formContainerStackView.spacing = 20
               formContainerStackView.layoutMargins = .init(top: 50, left: 10, bottom: 10, right: 10)
        
        
        let v1 = UIStackView(arrangedSubviews: [accountLabel,accountTF,UIView(backgroundColor:  UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
        v1.axis = .vertical
        v1.distribution = .fill
        v1.spacing = 10
        v1.withHeight(70)
         let v2 = UIStackView(arrangedSubviews: [userNameLabel,userNameTF,UIView(backgroundColor:  UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
        v2.distribution = .fill
        v2.axis = .vertical
        v2.spacing = 10
        v2.withHeight(70)

let v3 = UIStackView(arrangedSubviews: [EmailAddressLabel,EmailAddressTF,UIView(backgroundColor:  UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
       v3.distribution = .fill
       v3.axis = .vertical
       v3.spacing = 10
       v3.withHeight(70)
        
let v4 = UIStackView(arrangedSubviews: [FantasySubscriberLabel,FantasySubscriberTF,UIView(backgroundColor:  UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
v4.distribution = .fill
v4.axis = .vertical
v4.spacing = 10
v4.withHeight(70)
        
        let v5 = UIStackView(arrangedSubviews: [FreeTeamsLabel,FreeTeamsTF,UIView(backgroundColor:  UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
        v5.distribution = .fill
        v5.axis = .vertical
        v5.spacing = 10
        v5.withHeight(70)
        
//
//         let v5 = UIStackView(arrangedSubviews: [accountLabel,accountTF,UIView(backgroundColor: .gray).withHeight(1)])
//        v5.distribution = .fillEqually
//        v5.axis = .vertical
//
//
        
        formContainerStackView.addArrangedSubview(v1)
        formContainerStackView.addArrangedSubview(v2)
        formContainerStackView.addArrangedSubview(v3)
        formContainerStackView.addArrangedSubview(v4)
        formContainerStackView.addArrangedSubview(v5)
        
        
    }
    func setUpNavBar(){
            navigationItem.title = "Account Information"
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "go-back-left-arrow 1"), style: .plain, target: self, action: #selector(tapOnBack))
            self.navigationController?.setAllTitleColor(.white)
            self.navigationController?.navigationBar.barTintColor = .black
                  self.navigationController?.navigationBar.tintColor = .white
                  self.navigationController?.navigationBar.isTranslucent = false
     
        }
    @objc func tapOnBack(){
//            self.navigationController?.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }
}

import SwiftUI
struct accoutnvc:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<accoutnvc.ContainerView>) -> UIViewController {
            UINavigationController(rootViewController: accountInformation())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<accoutnvc.ContainerView>) {
            
        }
        
        
         
        
        
       
    }
}
