//
//  newTopic.swift
//  espnFantasyApp
//
//  Created by prog on 12/30/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
//
//  deleteTools.swift
//  espnFantasyApp
//
//  Created by prog on 12/29/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
 
import Foundation
//
//  create_league.swift
//  espnFantasyApp
//
//  Created by engitech on 27/12/2019.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit



class newTopic : LBTAFormController {
    lazy var subjectlabel: UILabel = {
        let l = UILabel(text: "Your subject", font: AppFont.Medium().twelve, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)

              return l
          }()
    lazy var subjectTF: IndentedTextField = {
        let username = IndentedTextField(placeholder: "", padding: 26, cornerRadius: 30, backgroundColor: .white)
        username.font = UIFont(name: "Roboto-Regular", size: 13)
        username.constrainHeight(60)
        username.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        username.layer.borderWidth = 1
        username.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        return username
    }()
    lazy var messagelabel: UILabel = {
    let l = UILabel(text: "Your Message", font: AppFont.Medium().twelve, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)

          return l
      }()
    lazy var messageTF: IndentedTextField = {
           let username = IndentedTextField(placeholder: "", padding: 26, cornerRadius: 10, backgroundColor: .white)
           username.font = AppFont.Medium().twelve
           username.constrainHeight(240)
           username.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
           username.layer.borderWidth = 1
           username.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
           return username
       }()
//    lazy var warning: UILabel = {
//    let l = UILabel()
//                        let primaryStr = "WARNING! "
//                                let secondaryString = "Deleting your league will completely and\npermenantly erase all its data and history. This action cannot\nbe undone."
//                        let attributedString = NSMutableAttributedString(string: "\(primaryStr)\(secondaryString)", attributes: [
//                        .font: AppFont.Bold().fourteen,
//                        .foregroundColor: UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1)
//                           ])
//
//                        attributedString.addAttributes([
//                        .font: AppFont.Bold().fourteen,
//                        .foregroundColor: MyColors.BasketBall().backgroundGradient1
//                        ], range: NSRange(location: 0, length:  primaryStr.count))
//
//                                l.attributedText = attributedString
//        l.numberOfLines = 0
//          return l
//      }()
    lazy var poll: UILabel = {
       let l = UILabel(text: "Poll", font: AppFont.Medium().twelve, textColor: MyColors.settings().secondary, textAlignment: .left, numberOfLines: 1)
             
             return l
         }()
    lazy var polltf: IndentedTextField = {
           let username = IndentedTextField(placeholder: "Add a Poll", padding: 26, cornerRadius: 30, backgroundColor: .white)
           username.font = AppFont.Medium().twelve
           username.constrainHeight(60)
           
           username.layer.borderWidth = 1
           username.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        username.textColor = .red
           return username
       }()
    
    lazy var post: UIButton = {
        let b = UIButton(title: "Post", titleColor: .white, font: AppFont.Bold().sixteen, backgroundColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1), target: self, action: nil)
        b.withHeight(60)
        b.setCorner(withRadius: 30)
         
//        let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "upload 1"), cornerRadius: 0)
//        let img = imageView.image
//
//
//
//               b.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 100)
//         let imageG = #imageLiteral(resourceName: "upload 1")
//               b.setImage(imageG.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
//        b.tintColor = UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1)
        
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
        formContainerStackView.padTop(30)
        
        let v1 = UIStackView(arrangedSubviews: [subjectlabel,subjectTF,messagelabel,messageTF,poll,polltf,])
        v1.axis = .vertical
        v1.distribution = .fill
        v1.padLeft(10)
        v1.padTop(20)
        v1.padRight(10)
        v1.spacing = 10

        
        let h1 = UIStackView(arrangedSubviews: [UIView().withWidth(70),post,UIView().withWidth(70)])
               h1.axis = .horizontal
               h1.distribution = .fill
        h1.padTop(20)
        
        
        
       
        
        
        

         
    
        formContainerStackView.padRight(10).padLeft(10)
        
        formContainerStackView.addArrangedSubview(v1)
        h1
       formContainerStackView.addArrangedSubview(h1)

 
        
        

    }
    func setUpNavBar(){
            navigationItem.title = "New Topic"
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "go-back-left-arrow 1"), style: .plain, target: self, action: #selector(tapOnBack))
            self.navigationController?.setAllTitleColor(.white)
//            self.navigationController?.navigationBar.barTintColor = .black
                  self.navigationController?.navigationBar.tintColor = .white
//                  self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setGradientBackground(colors: [MyColors.BasketBall().backgroundGradient1,MyColors.BasketBall().backgroundGradient2])
    
        }
    @objc func tapOnBack(){
//            self.navigationController?.dismiss(animated: true, completion: nil)
////        dismiss(animated: true, completion: nil)
        
        
            self.navigationController?.popViewController(animated: true)
        }
}

import SwiftUI
struct new:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<new.ContainerView>) -> UIViewController {
           UINavigationController(rootViewController: newTopic())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<new.ContainerView>) {
             
        }
        
        
       
    }
}
