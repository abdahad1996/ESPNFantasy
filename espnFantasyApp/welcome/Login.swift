//
//  Login.swift
//  espnFantasyApp
//
//  Created by prog on 12/12/19.
//  Copyright © 2019 prog. All rights reserved.
//



import UIKit


class Login: LBTAFormController {
    
    
    @objc fileprivate func handleCancel() {
        dismiss(animated: true)
    }
    
  //  MARK:views
    lazy var usernameTF: IndentedTextField = {
        let username = IndentedTextField(placeholder: "Enter Your Username", padding: 26, cornerRadius: 30, backgroundColor: .white)
        username.font = AppFont.Regular().twelve
        username.constrainHeight(60)
        username.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        username.layer.borderWidth = 1
        username.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        return username
    }()
    lazy var passwordTF: IndentedTextField = {
        let passwordTF = IndentedTextField(placeholder:  "Enter Your Password", padding: 26, cornerRadius: 30, backgroundColor: .white)
        passwordTF.font = AppFont.Regular().twelve
        passwordTF.constrainHeight(60)
        passwordTF.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        passwordTF.layer.borderWidth = 1
        passwordTF.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        return passwordTF
    }()
    lazy var login:UIButton = {
        let login = UIButton(title: "Login", titleColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1), font:AppFont.Bold().sixteen, backgroundColor: .white, target: self, action: #selector(handleLogin))
        
       
        return login
    }()
    lazy var goToSignUp: UIButton = {
        let btnlabel = UIButton(title: "Signup Now", titleColor: UIColor(red: 0.125, green: 0.812, blue: 0.38, alpha: 1), font: AppFont.Bold().sixteen, backgroundColor: .clear, target: self, action: #selector(goToSignUpTapped))
        btnlabel.layer.borderWidth = 0
        return btnlabel
    }()
    let fbButton = UIButton(title: "Login with Facebook", titleColor: .white, font:AppFont.Bold().sixteen, backgroundColor: UIColor(red: 0.22, green: 0.325, blue: 0.608, alpha: 1), target: self, action: #selector(handleCancel))
    let googleButton = UIButton(title: "Login with Google", titleColor: .white, font: AppFont.Bold().sixteen, backgroundColor:UIColor(red: 0.843, green: 0.286, blue: 0.216, alpha: 1), target: self, action: #selector(handleCancel))
    
    //Mark:Selectors
    @objc func handleLogin(){
           print("hellll")
           let window = self.view.window
         
         window?.rootViewController = CustomNavigationController(rootViewController: Home())
        }
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
 
        
        
    }
    fileprivate func setUpUi() {
        //        login.app
        scrollView.alwaysBounceVertical = true
        formContainerStackView.axis = .vertical
        formContainerStackView.spacing = 30
        formContainerStackView.layoutMargins = .init(top: 50, left: 24, bottom: 16, right: 24)
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "splash"), contentMode: .scaleAspectFit)
        imageView.constrainHeight(120)
        
        formContainerStackView.addArrangedSubview(imageView)
        
        formContainerStackView.addArrangedSubview(usernameTF)
        formContainerStackView.addArrangedSubview(passwordTF)
//
        let horizontalStack = UIStackView(arrangedSubviews: [UIView(),login,UIView()])
        horizontalStack.alignment = .fill
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fillEqually

        formContainerStackView.addArrangedSubview(horizontalStack)
//
        let label = UILabel(text: "Or", font: AppFont.Regular().twelve, textColor:  UIColor(red: 0.471, green: 0.457, blue: 0.457, alpha: 1), textAlignment: .center, numberOfLines: 1)
        label.withHeight(20)
        let line1 = UIView(backgroundColor: UIColor(red: 0.667, green: 0.667, blue: 0.667, alpha: 1)).withHeight(1)
        let line2 = UIView(backgroundColor: UIColor(red: 0.667, green: 0.667, blue: 0.667, alpha: 1)).withHeight(1)
        let horizontalStack2 = UIStackView(arrangedSubviews: [line1,label,line2])
//
        horizontalStack2.alignment = .center
//
//
        horizontalStack2.axis = .horizontal
//
        horizontalStack2.distribution = .fillEqually
        horizontalStack2.withHeight(20)
//
        formContainerStackView.addArrangedSubview(horizontalStack2)
//
//
//
//
//
        let verticalStack = UIStackView(arrangedSubviews: [fbButton, googleButton])

        verticalStack.axis = .vertical
        verticalStack.spacing = 10
        verticalStack.withWidth(50)
        verticalStack.padLeft(40)
        verticalStack.padRight(40)


        formContainerStackView.addArrangedSubview(verticalStack)
//////
//
//
        let fbimageView = UIImageView(image: #imageLiteral(resourceName: "facebook"), contentMode: .scaleAspectFill)


        fbButton.tintColor = .white
        fbButton.constrainHeight(50)

        fbButton.layer.cornerRadius = 25
        fbButton.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 50)
                fbButton.setImage(fbimageView.image, for: .normal)

        let imageG = #imageLiteral(resourceName: "google")
        googleButton.setImage(imageG.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
        googleButton.constrainHeight(50)
        googleButton.layer.cornerRadius = 25
        googleButton.tintColor = .white
        googleButton.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 60)
        googleButton.titleEdgeInsets = .init(top: 0, left: -20, bottom: 0, right: 0)


        let lastlabel = UILabel(text: "Don’t have an account?", font: AppFont.Regular().fourteen, textColor: UIColor(red: 0.471, green: 0.459, blue: 0.459, alpha: 1), textAlignment: .left, numberOfLines: 1)
        let lasthorizontalStack = UIStackView(arrangedSubviews: [lastlabel,goToSignUp,UIView()])
        lasthorizontalStack.alignment = .fill


        lasthorizontalStack.axis = .horizontal
        lasthorizontalStack.spacing = 5
        lasthorizontalStack.padLeft(30)
        lasthorizontalStack.padRight(30)

        lasthorizontalStack.distribution = .fill

        formContainerStackView.addArrangedSubview(lasthorizontalStack)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi()
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
