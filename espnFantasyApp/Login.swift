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

class GradientButton: UIButton {

    let gradientColors : [UIColor]
    let startPoint : CGPoint
    let endPoint : CGPoint

    required init(gradientColors: [UIColor] = [UIColor.red, UIColor.blue],
                  startPoint: CGPoint = CGPoint(x: 0, y: 0.5),
                  endPoint: CGPoint = CGPoint(x: 1, y: 0.5)) {
        self.gradientColors = gradientColors
        self.startPoint = startPoint
        self.endPoint = endPoint

        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let halfOfButtonHeight = layer.frame.height / 2
        contentEdgeInsets = UIEdgeInsets(top: 10, left: halfOfButtonHeight, bottom: 10, right: halfOfButtonHeight)

        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)

        backgroundColor = UIColor.clear

        // setup gradient

        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = gradientColors.map { $0.cgColor }
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.cornerRadius = 4

        // replace gradient as needed
        if let oldGradient = layer.sublayers?[0] as? CAGradientLayer {
            layer.replaceSublayer(oldGradient, with: gradient)
        } else {
            layer.insertSublayer(gradient, below: nil)
        }

        // setup shadow
//
//        layer.shadowColor = UIColor.darkGray.cgColor
//        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: halfOfButtonHeight).cgPath
//        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//        layer.shadowOpacity = 0.85
//        layer.shadowRadius = 4.0
    }

    override var isHighlighted: Bool {
        didSet {
            let newOpacity : Float = isHighlighted ? 0.6 : 0.85
            let newRadius : CGFloat = isHighlighted ? 6.0 : 4.0

            let shadowOpacityAnimation = CABasicAnimation()
            shadowOpacityAnimation.keyPath = "shadowOpacity"
            shadowOpacityAnimation.fromValue = layer.shadowOpacity
            shadowOpacityAnimation.toValue = newOpacity
            shadowOpacityAnimation.duration = 0.1

            let shadowRadiusAnimation = CABasicAnimation()
            shadowRadiusAnimation.keyPath = "shadowRadius"
            shadowRadiusAnimation.fromValue = layer.shadowRadius
            shadowRadiusAnimation.toValue = newRadius
            shadowRadiusAnimation.duration = 0.1

            layer.add(shadowOpacityAnimation, forKey: "shadowOpacity")
            layer.add(shadowRadiusAnimation, forKey: "shadowRadius")

            layer.shadowOpacity = newOpacity
            layer.shadowRadius = newRadius

            let xScale : CGFloat = isHighlighted ? 1.025 : 1.0
            let yScale : CGFloat = isHighlighted ? 1.05 : 1.0
            UIView.animate(withDuration: 0.1) {
                let transformation = CGAffineTransform(scaleX: xScale, y: yScale)
                self.transform = transformation
            }
        }
    }
}

class Login: LBTAFormController {
    let signUpButton = UIButton(title: "Sign Up", titleColor: .white, font: .boldSystemFont(ofSize: 16), backgroundColor: #colorLiteral(red: 0.2883880436, green: 0.5055884719, blue: 0.9490465522, alpha: 1), target: self, action: #selector(handleCancel))
    let cancelButton = UIButton(title: "Cancel", titleColor: .white, font: .boldSystemFont(ofSize: 16), backgroundColor: .red, target: self, action: #selector(handleCancel))
    
    @objc fileprivate func handleCancel() {
        dismiss(animated: true)
    }
    
    let fbButton = UIButton(image: #imageLiteral(resourceName: "splash").withRenderingMode(.alwaysOriginal))
    let twitterButton = UIButton(image: #imageLiteral(resourceName: "splash").withRenderingMode(.alwaysOriginal))
    let githubButton = UIButton(image: #imageLiteral(resourceName: "splash").withRenderingMode(.alwaysOriginal))
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
        login.backgroundColor = .white

       
        return login
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    // Hide the Navigation Bar
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    // Show the Navigation Bar
            self.navigationController?.setNavigationBarHidden(false, animated: false)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.alwaysBounceVertical = true
        
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
        let button = GradientButton.init(gradientColors:[UIColor(red: 0.227, green: 0.914, blue: 0.176, alpha: 1), UIColor(red: 0.075, green: 0.765, blue: 0.478, alpha: 1)], startPoint: CGPoint(x: 0.25, y: 0.5), endPoint: CGPoint(x: 0.75, y: 0.5)).withWidth(50)
        
        button.layer.cornerRadius = 25
        let horizontalStack = UIStackView(arrangedSubviews: [UIView(backgroundColor: .red),button,UIView(backgroundColor: .red)])
        horizontalStack.alignment = .fill
        horizontalStack.layer.cornerRadius = 25
//        horizontalStack.withWidth(30)
//        horizontalStack.layer.addSublayer(layer0)
//        layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
//        layer0.position = view.center
//        view.clipsToBounds = true

        horizontalStack.axis = .horizontal
               
               horizontalStack.distribution = .fillEqually
       

        
        let textfieldStackView = UIStackView(arrangedSubviews: [usernameTF, passwordTF,horizontalStack])
         textfieldStackView.layoutMargins = .init(top: 20, left: 0, bottom: 0, right: 0)
        textfieldStackView.axis = .vertical
               
               textfieldStackView.distribution = .fill
        textfieldStackView.spacing = 20
        formContainerStackView.addArrangedSubview(textfieldStackView)
//        formContainerStackView.addArrangedSubview(usernameTF)
//
//        formContainerStackView.addArrangedSubview(passwordTF)
        
        formContainerStackView.addArrangedSubview(signUpButton)
        formContainerStackView.addArrangedSubview(cancelButton)
        signUpButton.constrainHeight(50)
        cancelButton.constrainHeight(50)
        
        let buttonsStackView = UIStackView(arrangedSubviews: [githubButton, fbButton, twitterButton])
        [githubButton, fbButton, twitterButton].forEach({$0.imageView?.contentMode = .scaleAspectFit})
        buttonsStackView.constrainHeight(50)
        buttonsStackView.distribution = .fillEqually
        formContainerStackView.addArrangedSubview(buttonsStackView)
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
