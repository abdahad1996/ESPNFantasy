//
//  FantasySubscription.swift
//  espnFantasyApp
//
//  Created by engitech on 26/12/2019.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class FantasySubscription:LBTAFormController{
    lazy var Contact :UILabel = {
        let label = UILabel(text: "Contact Customer Support", font: AppFont.Bold().twenty, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)
        return label
    }()
//    lazy var accountTF: IndentedTextField = {
//         let passwordTF = IndentedTextField(placeholder:  "Bella Alex", padding: 0, cornerRadius: 0, backgroundColor: .white)
//        passwordTF.font = AppFont.Regular().twentytwo
//        passwordTF.backgroundColor = .clear
//
//         return passwordTF
//     }()
    lazy var phoneLabel:UILabel = {
           let label = UILabel(text: "Phone", font: AppFont.Bold().twenty, textColor: MyColors.settings().secondary, textAlignment: .left, numberOfLines: 1)
           return label
       }()
       lazy var phoneTF: IndentedTextField = {
            let passwordTF = IndentedTextField(placeholder:  "800-727-1800", padding: 0, cornerRadius: 0, backgroundColor: .white)
            passwordTF.font = AppFont.Regular().twentytwo
           passwordTF.backgroundColor = .clear
         passwordTF.text = "800-727-1800"
        
        passwordTF.textColor = UIColor(red: 0.003, green: 0.57, blue: 0.783, alpha: 1)
            return passwordTF
        }()
    lazy var EmailLabel:UILabel = {
               let label = UILabel(text: "Email", font: AppFont.Bold().twenty, textColor: MyColors.settings().secondary, textAlignment: .left, numberOfLines: 1)
               return label
           }()
    
           lazy var EmailAddressTF: IndentedTextField = {
                let passwordTF = IndentedTextField(placeholder:  "800-727-1800", padding: 0, cornerRadius: 0, backgroundColor: .white)
                passwordTF.font = AppFont.Regular().twentytwo
               passwordTF.text = "800-727-1800"
            
            passwordTF.backgroundColor = .clear
                passwordTF.textColor = UIColor(red: 0.003, green: 0.57, blue: 0.783, alpha: 1)
                return passwordTF
            }()
//    lazy var phoneLabel:UILabel = {
//                  let label = UILabel(text: "Fantasy Subscriber", font: AppFont.Bold().twenty, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)
//                  return label
//              }()
//
//              lazy var phoneTF: IndentedTextField = {
//                   let passwordTF = IndentedTextField(placeholder: "No", padding: 0, cornerRadius: 0, backgroundColor: .white)
//                   passwordTF.font = AppFont.Regular().twentytwo
//                  passwordTF.backgroundColor = .clear
//
//                   return passwordTF
//               }()
    lazy var webSupportLabel:UILabel = {
                  let label = UILabel(text: "Web Support", font: AppFont.Bold().twenty, textColor: MyColors.settings().secondary, textAlignment: .left, numberOfLines: 1)
                  return label
              }()
       
              lazy var webSupportTF: IndentedTextField = {
                   let passwordTF = IndentedTextField(placeholder:  "fantasy@suport.com", padding: 0, cornerRadius: 0, backgroundColor: .white)
                   passwordTF.font = AppFont.Regular().twentytwo
                  passwordTF.backgroundColor = .clear
                passwordTF.text = "fantasy@suport.com"
                
                passwordTF.textColor = UIColor(red: 0.003, green: 0.57, blue: 0.783, alpha: 1)
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
               let h1 = UIStackView(arrangedSubviews: [phoneLabel,phoneTF])
                h1.axis = .horizontal
                h1.distribution = .fill
                h1.spacing = 0
                h1.withHeight(70)
        let h2 = UIStackView(arrangedSubviews: [EmailLabel,UIView(),EmailAddressTF])
                       h2.axis = .horizontal
                       h2.distribution = .fill
                       h2.spacing = 0
                       h2.withHeight(70)
        let h3 = UIStackView(arrangedSubviews: [webSupportLabel,UIView(),webSupportTF])
                       h3.axis = .horizontal
                       h3.distribution = .fill
                       h3.spacing = 0
                       h3.withHeight(70)
        
        let v1 = UIStackView(arrangedSubviews: [Contact,h1,h2,h3])
        
        v1.axis = .vertical
        v1.distribution = .fill
        v1.spacing = 10
        
//         let v2 = UIStackView(arrangedSubviews: [userNameLabel,userNameTF,UIView(backgroundColor:  UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
//        v2.distribution = .fill
//        v2.axis = .vertical
//        v2.spacing = 10
//        v2.withHeight(70)
//
//let v3 = UIStackView(arrangedSubviews: [EmailAddressLabel,EmailAddressTF,UIView(backgroundColor:  UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
//       v3.distribution = .fill
//       v3.axis = .vertical
//       v3.spacing = 10
//       v3.withHeight(70)
//
//let v4 = UIStackView(arrangedSubviews: [FantasySubscriberLabel,FantasySubscriberTF,UIView(backgroundColor:  UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
//v4.distribution = .fill
//v4.axis = .vertical
//v4.spacing = 10
//v4.withHeight(70)
//
//        let v5 = UIStackView(arrangedSubviews: [FreeTeamsLabel,FreeTeamsTF,UIView(backgroundColor:  UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
//        v5.distribution = .fill
//        v5.axis = .vertical
//        v5.spacing = 10
//        v5.withHeight(70)
//
////
////         let v5 = UIStackView(arrangedSubviews: [accountLabel,accountTF,UIView(backgroundColor: .gray).withHeight(1)])
////        v5.distribution = .fillEqually
////        v5.axis = .vertical
////
////
//
        formContainerStackView.addArrangedSubview(v1)
//        formContainerStackView.addArrangedSubview(v2)
//        formContainerStackView.addArrangedSubview(v3)
//        formContainerStackView.addArrangedSubview(v4)
//        formContainerStackView.addArrangedSubview(v5)
        
        
    }
    func setUpNavBar(){
            navigationItem.title = "Fantasy Subscription"
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
struct fantasyvc:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<fantasyvc.ContainerView>) -> UIViewController {
            UINavigationController(rootViewController: FantasySubscription())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<fantasyvc.ContainerView>) {
            
        }
        
        
         
        
        
       
    }
}
