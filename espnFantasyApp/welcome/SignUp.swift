//
//  SignUp.swift
//  espnFantasyApp
//
//  Created by prog on 12/13/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit
class SignUp:LBTAFormController{
    lazy var firstnameTF: IndentedTextField = {
        let username = IndentedTextField(placeholder: "Enter Your FirstName", padding: 26, cornerRadius: 30, backgroundColor: .white)
        username.font = UIFont(name: "Roboto-Regular", size: 13)
        username.constrainHeight(60)
        username.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        username.layer.borderWidth = 1
        username.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        return username
    }()
    lazy var lastnameTF: IndentedTextField = {
        let username = IndentedTextField(placeholder: "Enter Your Lastname", padding: 26, cornerRadius: 30, backgroundColor: .white)
        username.font = UIFont(name: "Roboto-Regular", size: 13)
        username.constrainHeight(60)
        username.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        username.layer.borderWidth = 1
        username.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        return username
    }()
    lazy var emailTF: IndentedTextField = {
        let username = IndentedTextField(placeholder: "Enter Your Email Address", padding: 26, cornerRadius: 30, backgroundColor: .white)
        username.font = UIFont(name: "Roboto-Regular", size: 13)
        username.constrainHeight(60)
        username.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        username.layer.borderWidth = 1
        username.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        return username
    }()
    lazy var passwordnameTF: IndentedTextField = {
        let username = IndentedTextField(placeholder: "Enter Your Password", padding: 26, cornerRadius: 30, backgroundColor: .white)
        username.font = UIFont(name: "Roboto-Regular", size: 13)
        username.constrainHeight(60)
        username.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        username.layer.borderWidth = 1
        username.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
         username.isSecureTextEntry = true
        return username
    }()
    lazy var Signup:UIButton = {
           let login = UIButton(title: "Signup", titleColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1), font: UIFont(name: "Roboto-Bold", size: 15) ?? .boldSystemFont(ofSize: 15), backgroundColor: .white, target: self, action: #selector(handleSignup))
           
        
           return login
       }()
    @objc func handleSignup(){
        self.navigationController?.popViewController(animated: true)
    }
    lazy var goToLogin: UIButton = {
        let btnlabel = UIButton(title: "Login Now", titleColor: UIColor(red: 0.125, green: 0.812, blue: 0.38, alpha: 1), font: UIFont(name: "Roboto-Bold", size: 15) ?? .boldSystemFont(ofSize: 15), backgroundColor: .clear, target: self, action: #selector(goToLoginTapped))
        btnlabel.layer.borderWidth = 0
        return btnlabel
    }()
    @objc func goToLoginTapped(){
        print("hellll")
//       let vc = login()
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi()
    }
     override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        
        ;Signup.setGradientBackground(colorOne: MyColors.greenGradient1, colorTwo: MyColors.greenGradient2)
        Signup.withHeight(40)
        Signup.buttonBorder(withRadius: 20, width: 0)
    //        login.buttonBorder(withRadius: 15, width: 30, color: .black)
            
            
        }
    func setUpUi(){
        scrollView.alwaysBounceVertical = true
        formContainerStackView.axis = .vertical
               formContainerStackView.spacing = 30
               formContainerStackView.layoutMargins = .init(top: 50, left: 24, bottom: 16, right: 24)
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "splash"), contentMode: .scaleAspectFit)
        imageView.constrainHeight(120)
        
        formContainerStackView.addArrangedSubview(imageView)
        formContainerStackView.addArrangedSubview(firstnameTF)
        formContainerStackView.addArrangedSubview(lastnameTF)
        formContainerStackView.addArrangedSubview(emailTF)
        formContainerStackView.addArrangedSubview(passwordnameTF)

         
        let horizontalStack = UIStackView(arrangedSubviews: [UIView(),Signup,UIView()])
            horizontalStack.alignment = .fill
            horizontalStack.axis = .horizontal
            horizontalStack.distribution = .fillEqually
        formContainerStackView.addArrangedSubview(horizontalStack)

        let lastlabel = UILabel(text: "Already have an account?", font: UIFont(name: "Roboto-Regular", size: 14), textColor: UIColor(red: 0.471, green: 0.459, blue: 0.459, alpha: 1), textAlignment: .left, numberOfLines: 1)
               let lasthorizontalStack = UIStackView(arrangedSubviews: [lastlabel,goToLogin,UIView()])
                     lasthorizontalStack.alignment = .fill
               

                     lasthorizontalStack.axis = .horizontal
               lasthorizontalStack.spacing = 5
               lasthorizontalStack.padLeft(30)
               lasthorizontalStack.padRight(30)

               lasthorizontalStack.distribution = .fill
        formContainerStackView.addArrangedSubview(lasthorizontalStack)

    }
}

import SwiftUI
struct signUp:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<signUp.ContainerView>) -> UIViewController {
            SignUp()
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<signUp.ContainerView>) {
             
        }
        
        
       
    }
}
