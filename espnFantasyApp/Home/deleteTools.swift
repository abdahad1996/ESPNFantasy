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



class deleteTools : LBTAFormController {
    lazy var leagueNameLabel: UILabel = {
        let l = UILabel(text: "League Name", font: AppFont.Medium().twelve, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)

              return l
          }()
    lazy var warning: UILabel = {
    let l = UILabel()
                        let primaryStr = "WARNING! "
                                let secondaryString = "Deleting your league will completely and\npermenantly erase all its data and history. This action cannot\nbe undone."
                        let attributedString = NSMutableAttributedString(string: "\(primaryStr)\(secondaryString)", attributes: [
                        .font: AppFont.Bold().fourteen,
                        .foregroundColor: UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1)
                           ])
          
                        attributedString.addAttributes([
                        .font: AppFont.Bold().fourteen,
                        .foregroundColor: MyColors.BasketBall().backgroundGradient1
                        ], range: NSRange(location: 0, length:  primaryStr.count))
          
                                l.attributedText = attributedString
        l.numberOfLines = 0
          return l
      }()
    lazy var leagueName: UILabel = {
       let l = UILabel(text: "Arizona League", font: AppFont.Medium().twelve, textColor: MyColors.settings().secondary, textAlignment: .left, numberOfLines: 1)
             
             return l
         }()
    
    lazy var delete: UIButton = {
        let b = UIButton(title: "Delete My League", titleColor: .white, font: AppFont.Bold().fourteen, backgroundColor: UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), target: self, action: nil)
        b.withHeight(40)
        b.setCorner(withRadius: 20)
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
        
           let v1 = UIStackView(arrangedSubviews: [leagueNameLabel,leagueName])
        v1.axis = .vertical
        v1.distribution = .fill
        v1.padLeft(10)
        v1.padTop(20)
        v1.padRight(10)
        v1.spacing = 10

        
        
        let separatorStack = UIStackView(arrangedSubviews: [UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
        separatorStack.padTop(20).padBottom(20)
        
       
        
        
        

         
    
        formContainerStackView.padRight(10).padLeft(10)
        
        formContainerStackView.addArrangedSubview(v1)
        formContainerStackView.addArrangedSubview(separatorStack)
        formContainerStackView.addArrangedSubview(warning.withHeight(100))
       
        formContainerStackView.addArrangedSubview(delete)

        
        

    }
    func setUpNavBar(){
            navigationItem.title = "League Manager’s Tools"
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
struct Tool:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<Tool.ContainerView>) -> UIViewController {
           UINavigationController(rootViewController: deleteTools())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<Tool.ContainerView>) {
             
        }
        
        
       
    }
}
