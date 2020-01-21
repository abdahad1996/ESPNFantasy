//
//  editTeamMain.swift
//  espnFantasyApp
//
//  Created by prog on 12/29/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation

class editTeamMain : LBTAFormController {
    
    lazy var useImageFromWeb: UILabel = {
        let l = UILabel(text: "To use an image from the web,\ntype or paste the URL below.", font: AppFont.Medium().sixteen, textColor: UIColor(red: 0.255, green: 0.247, blue: 0.247, alpha: 1), textAlignment: .center, numberOfLines: 1)
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
              return l
          }()
    lazy var kblabel: UILabel = {
           let l = UILabel(text: "Images must be under 500kb in size. Square images make the best logos.", font: AppFont.Medium().sixteen, textColor: UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), textAlignment: .center, numberOfLines: 1)
           l.numberOfLines = 0
//           l.lineBreakMode = .byWordWrapping
                 return l
             }()
    
    lazy var nameLabel: UILabel = {
        let l = UILabel(text: "Bella Alex", font: AppFont.Medium().twelve, textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment: .center, numberOfLines: 1)

          return l
      }()
    
     lazy var imageURLtf: IndentedTextField = {
        let passwordTF = IndentedTextField(placeholder:  "http://www.googlephotos.com/id=232", padding: 26, cornerRadius: 30, backgroundColor:.white)
           passwordTF.font = AppFont.Regular().twelve
           passwordTF.constrainHeight(60)
        passwordTF.textColor = UIColor(red: 0.906, green: 0.271, blue: 0.216, alpha: 1)
        passwordTF.text = "http://www.googlephotos.com/id=232"
          
           passwordTF.layer.borderWidth = 1
           passwordTF.layer.borderColor = UIColor(red: 0.906, green: 0.271, blue: 0.216, alpha: 1).cgColor
           return passwordTF
       }()
    
   lazy var save:UIButton = {
          let login = UIButton(title: "Save", titleColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1), font:AppFont.Bold().sixteen, backgroundColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1), target: self, action: nil)
          
         
          return login
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
        
        let v1 = UIStackView(arrangedSubviews: [AspectFitImageView(image: #imageLiteral(resourceName: "Group 63"), cornerRadius: 0).withHeight(150),useImageFromWeb,imageURLtf,kblabel,save.withHeight(60).withWidth(60)])
        v1.axis = .vertical
        v1.distribution = .fill
        v1.padLeft(10)
        v1.padTop(20)
        v1.padRight(10)
        v1.padBottom(20)
        v1.spacing = 20

        
        save.setCorner(withRadius: 30)
       
        
            
        

         
    
        formContainerStackView.padRight(10).padLeft(10)
        
        formContainerStackView.addArrangedSubview(v1)
         
        
         

        
        

    }
    func setUpNavBar(){
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Save"), style: .plain, target: self, action: #selector(tapOnBack))

                navigationItem.title = "Use a Custom Logo"
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "go-back-left-arrow 1"), style: .plain, target: self, action: #selector(tapOnBack))
                self.navigationController?.setAllTitleColor(.white)
    //            self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.tintColor = .white
        
        
    //                  self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.setGradientBackground(colors: [MyColors.BasketBall().backgroundGradient1,MyColors.BasketBall().backgroundGradient2])
        
            }
    @objc func tapOnBack(){
//            self.navigationController?.dismiss(animated: true, completion: nil)
//        dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }
}
import SwiftUI
struct ed: PreviewProvider {
    
    static var previews: some View {
                 ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ed.ContainerView>) -> UIViewController {
            return UINavigationController(rootViewController: editTeamMain())
        }
        
        func updateUIViewController(_ uiViewController: ed.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ed.ContainerView>) {
            
        }
    }
    
}
