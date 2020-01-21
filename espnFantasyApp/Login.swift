//
//  Login.swift
//  espnFantasyApp
//
//  Created by prog on 12/12/19.
//  Copyright © 2019 prog. All rights reserved.
//

import UIKit
import Foundation
import UIKit

import UIKit


class Login: LBTAFormController {
    let fbButton = UIButton(title: "Login with Facebook", titleColor: .white, font: UIFont(name: "Roboto-Bold", size: 15) ?? .boldSystemFont(ofSize: 15), backgroundColor: UIColor(red: 0.22, green: 0.325, blue: 0.608, alpha: 1), target: self, action: #selector(handleCancel))
    let googleButton = UIButton(title: "Login with Google", titleColor: .white, font: UIFont(name: "Roboto-Bold", size: 15) ?? .boldSystemFont(ofSize: 15), backgroundColor:UIColor(red: 0.843, green: 0.286, blue: 0.216, alpha: 1), target: self, action: #selector(handleCancel))
    
    @objc fileprivate func handleCancel() {
        dismiss(animated: true)
    }
    
//    let fbButton = UIButton(image: #imageLiteral(resourceName: "splash").withRenderingMode(.alwaysOriginal))
//    let twitterButton = UIButton(image: #imageLiteral(resourceName: "splash").withRenderingMode(.alwaysOriginal))
//    let githubButton = UIButton(image: #imageLiteral(resourceName: "splash").withRenderingMode(.alwaysOriginal))
    lazy var usernameTF: IndentedTextField = {
        let username = IndentedTextField(placeholder: "Enter Your Username", padding: 26, cornerRadius: 30, backgroundColor: .white)
        username.font = UIFont(name: "Roboto-Regular", size: 13)
        username.constrainHeight(60)
        username.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        username.layer.borderWidth = 1
        username.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        return username
    }()
    lazy var passwordTF: IndentedTextField = {
        let passwordTF = IndentedTextField(placeholder:  "Enter Your Password", padding: 26, cornerRadius: 30, backgroundColor: .white)
        passwordTF.font = UIFont(name: "Roboto-Regular", size: 13)
        passwordTF.constrainHeight(60)
        passwordTF.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        passwordTF.layer.borderWidth = 1
        passwordTF.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        return passwordTF
    }()
    lazy var login:UIButton = {
        let login = UIButton(title: "Login", titleColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1), font: UIFont(name: "Roboto-Bold", size: 15) ?? .boldSystemFont(ofSize: 15), backgroundColor: .white, target: self, action: #selector(handleCancel))
        
       
        return login
    }()
    lazy var goToSignUp: UIButton = {
        let btnlabel = UIButton(title: "Signup Now", titleColor: UIColor(red: 0.125, green: 0.812, blue: 0.38, alpha: 1), font: UIFont(name: "Roboto-Bold", size: 15) ?? .boldSystemFont(ofSize: 15), backgroundColor: .clear, target: self, action: #selector(goToSignUpTapped))
        btnlabel.layer.borderWidth = 0
        return btnlabel
    }()
    @objc func goToSignUpTapped(){
        print("hellll")
       let vc = SignUp()
        self.navigationController?.pushViewController(vc, animated: true )
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    // Hide the Navigation Bar
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }

//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(true)
//    // Show the Navigation Bar
//            self.navigationController?.setNavigationBarHidden(false, animated: false)
//        }
    override func viewDidLayoutSubviews() {
       login.setGradientBackground(colorOne: MyColors.greenGradient1, colorTwo: MyColors.greenGradient2)
        login.withHeight(40)
        login.buttonBorder(withRadius: 20, width: 0)
//        login.buttonBorder(withRadius: 15, width: 30, color: .black)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        login.app
        scrollView.alwaysBounceVertical = true
        login.setGradientBackground(colorOne: MyColors.greenGradient1, colorTwo: MyColors.greenGradient2)
        formContainerStackView.axis = .vertical
        formContainerStackView.spacing = 40
        formContainerStackView.layoutMargins = .init(top: 50, left: 24, bottom: 16, right: 24)
        
        self.view.backgroundColor = .white
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "splash"), contentMode: .scaleAspectFit)
        imageView.constrainHeight(120)
        
        formContainerStackView.addArrangedSubview(imageView)
        //setup gradient
//        let layer0 = CAGradientLayer()
//        layer0.colors = [
//          UIColor(red: 0.227, green: 0.914, blue: 0.176, alpha: 1).cgColor,
//          UIColor(red: 0.075, green: 0.765, blue: 0.478, alpha: 1).cgColor
//        ]
//        layer0.locations = [0, 1]
//        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
//        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
//        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1.03, b: 0.25, c: -0.25, d: 17.01, tx: 0.19, ty: -8.01))
//        let button = GradientButton.init(gradientColors:[UIColor(red: 0.227, green: 0.914, blue: 0.176, alpha: 1), UIColor(red: 0.075, green: 0.765, blue: 0.478, alpha: 1)], startPoint: CGPoint(x: 0.25, y: 0.5), endPoint: CGPoint(x: 0.75, y: 0.5)).withWidth(50)
//
//        button.layer.cornerRadius = 25
        let horizontalStack = UIStackView(arrangedSubviews: [UIView(),login,UIView()])
        horizontalStack.alignment = .fill
  

        horizontalStack.axis = .horizontal
               
               horizontalStack.distribution = .fillEqually
       
        let label = UILabel(text: "Or", font: UIFont(name: "Roboto-Regular", size: 12), textColor:  UIColor(red: 0.471, green: 0.457, blue: 0.457, alpha: 1), textAlignment: .center, numberOfLines: 1)
        label.withHeight(20)
        let line1 = UIView(backgroundColor: UIColor(red: 0.667, green: 0.667, blue: 0.667, alpha: 1)).withHeight(1)
        let line2 = UIView(backgroundColor: UIColor(red: 0.667, green: 0.667, blue: 0.667, alpha: 1)).withHeight(1)
        let horizontalStack2 = UIStackView(arrangedSubviews: [line1,label,line2])
        
        horizontalStack2.alignment = .center
         

               horizontalStack2.axis = .horizontal
                      
        horizontalStack2.distribution = .fillEqually
        horizontalStack2.withHeight(20)
        horizontalStack2.layoutMargins = .init(top: 20, left: 0, bottom: 0, right: 0)
        
        let textfieldStackView = UIStackView(arrangedSubviews: [usernameTF, passwordTF,horizontalStack,horizontalStack2])
         textfieldStackView.layoutMargins = .init(top: 20, left: 0, bottom: 0, right: 0)
        textfieldStackView.axis = .vertical
               
               textfieldStackView.distribution = .fill
        textfieldStackView.spacing = 20
        formContainerStackView.addArrangedSubview(textfieldStackView)
//        formContainerStackView.addArrangedSubview(usernameTF)
//
//        formContainerStackView.addArrangedSubview(passwordTF)
        
        
        let verticalStack = UIStackView(arrangedSubviews: [fbButton, googleButton])
        
        verticalStack.axis = .vertical
        verticalStack.spacing = 5
        verticalStack.withWidth(50)
        verticalStack.padLeft(30)
        verticalStack.padRight(60)

        
//        let horizontalStacklogin = UIStackView(arrangedSubviews: [UIView(),verticalStack,UIView()])
//        horizontalStacklogin.alignment = .center
//        horizontalStacklogin.distribution = .fillProportionally
        formContainerStackView.addArrangedSubview(verticalStack)
//        formContainerStackView.addArrangedSubview(googleButton)
        fbButton.constrainHeight(50)
        let image = #imageLiteral(resourceName: "facebook")
        
        fbButton.setImage(image.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
        fbButton.tintColor = .white

        fbButton.layer.cornerRadius = 25
         fbButton.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 40)
        let imageG = #imageLiteral(resourceName: "google")
        googleButton.setImage(imageG.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
        googleButton.constrainHeight(50)
        googleButton.layer.cornerRadius = 25
        googleButton.tintColor = .white
        googleButton.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 45)


        let lastlabel = UILabel(text: "Don’t have an account?", font: UIFont(name: "Roboto-Regular", size: 14), textColor: UIColor(red: 0.471, green: 0.459, blue: 0.459, alpha: 1), textAlignment: .left, numberOfLines: 1)
        let lasthorizontalStack = UIStackView(arrangedSubviews: [lastlabel,goToSignUp,UIView()])
              lasthorizontalStack.alignment = .fill
        

              lasthorizontalStack.axis = .horizontal
        lasthorizontalStack.spacing = 5
        lasthorizontalStack.padLeft(30)
        lasthorizontalStack.padRight(30)

        lasthorizontalStack.distribution = .fill
//        let buttonsStackView = UIStackView(arrangedSubviews: [githubButton, fbButton, twitterButton])
//        [githubButton, fbButton, twitterButton].forEach({$0.imageView?.contentMode = .scaleAspectFit})
//        buttonsStackView.constrainHeight(50)
//        buttonsStackView.distribution = .fillEqually
        formContainerStackView.addArrangedSubview(lasthorizontalStack)
    }
}
import SwiftUI
struct login:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<login.ContainerView>) -> UIViewController {
            Login()
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<login.ContainerView>) {
             
        }
        
        
       
    }
}
