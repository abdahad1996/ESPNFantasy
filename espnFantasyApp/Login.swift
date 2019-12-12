//
//  Login.swift
//  espnFantasyApp
//
//  Created by prog on 12/12/19.
//  Copyright © 2019 prog. All rights reserved.
//

import UIKit
class Login: LBTAFormController {
    let signUpButton = UIButton(title: "Sign Up", titleColor: .white, font: .boldSystemFont(ofSize: 16), backgroundColor: #colorLiteral(red: 0.2883880436, green: 0.5055884719, blue: 0.9490465522, alpha: 1), target: self, action: #selector(handleCancel))
    let cancelButton = UIButton(title: "Cancel", titleColor: .white, font: .boldSystemFont(ofSize: 16), backgroundColor: .red, target: self, action: #selector(handleCancel))
    
    @objc fileprivate func handleCancel() {
        dismiss(animated: true)
    }
    
    let fbButton = UIButton(image: #imageLiteral(resourceName: "splash").withRenderingMode(.alwaysOriginal))
    let twitterButton = UIButton(image: #imageLiteral(resourceName: "splash").withRenderingMode(.alwaysOriginal))
    let githubButton = UIButton(image: #imageLiteral(resourceName: "splash").withRenderingMode(.alwaysOriginal))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.alwaysBounceVertical = true
        
        formContainerStackView.axis = .vertical
        formContainerStackView.spacing = 12
        formContainerStackView.layoutMargins = .init(top: 0, left: 24, bottom: 16, right: 24)
        
        view.backgroundColor = #colorLiteral(red: 0.9486700892, green: 0.9493889213, blue: 0.9487814307, alpha: 1)
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "splash"), contentMode: .scaleAspectFit)
        imageView.constrainHeight(64)
        
        formContainerStackView.addArrangedSubview(imageView)
        
        (0...1).forEach { (_) in
            let tf = IndentedTextField(placeholder: "Enter form field", padding: 12, cornerRadius: 5, backgroundColor: .white)
            tf.constrainHeight(60)
            formContainerStackView.addArrangedSubview(tf)
        }
        
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
