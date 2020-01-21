//
//  scheduleYourDraft.swift
//  espnFantasyApp
//
//  Created by prog on 12/29/19.
//  Copyright © 2019 prog. All rights reserved.
//


import UIKit



class scheduleYourDraft : LBTAFormController {
    lazy var leagueNameLabel: UILabel = {
        let l = UILabel(text: "League Name", font: AppFont.Medium().twelve, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)
              
              return l
          }()
    lazy var scoringType: UILabel = {
    let l = UILabel(text: "scoring Type", font: AppFont.Medium().twelve, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)
          
          return l
      }()
    lazy var leagueTF: IndentedTextField = {
        let leagueTF = IndentedTextField(placeholder: "Arizona League", padding: 26, cornerRadius: 30, backgroundColor: .white)
        leagueTF.font = AppFont.Regular().twelve
        leagueTF.constrainHeight(60)
        leagueTF.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        leagueTF.layer.borderWidth = 1
        leagueTF.layer.borderColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
        return leagueTF
    }()
        lazy var NoTeamLabel: UILabel = {
        let l = UILabel(text: "No of Teams", font: AppFont.Medium().twelve, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)
              
              return l
          }()
 
  
    
    //MARK:Draft type
       
    lazy var Draft: UILabel = {
    let l = UILabel(text: "Draft Type", font: AppFont.Medium().twelve, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)
          
          return l
      }()
   lazy var checkBoxDraft1: CheckBoxButton = {
               let b = CheckBoxButton()
    //           b.checkboxLabel.text = "Auction"
    b.isChecked = true

     let primaryStr = "Snake\n"
            let secondaryString = "Teams make picks and then order reverses"
    let attributedString = NSMutableAttributedString(string: "\(primaryStr)\(secondaryString)", attributes: [
    .font: AppFont.Medium().fourteen,
    .foregroundColor: MyColors.settings().primary
       ])

    attributedString.addAttributes([
    .font: AppFont.Regular().twelve,
       .foregroundColor: MyColors.settings().secondary
    ], range: NSRange(location: primaryStr.count, length:  secondaryString.count))

            b.checkboxLabel.attributedText = attributedString
               return b
           }()
    
    lazy var checkBoxDraft2: CheckBoxButton = {
           let b = CheckBoxButton()
        b.isChecked = false

//           b.checkboxLabel.text = "Auction"
        let primaryStr = "Auction\n"
        let secondaryString = "Each team is given a budget and teams bid for\nplayers"
        let attributedString = NSMutableAttributedString(string: "\(primaryStr)\(secondaryString)", attributes: [
            .font: AppFont.Medium().fourteen,
            .foregroundColor: MyColors.settings().primary
   ])

attributedString.addAttributes([
.font: AppFont.Regular().twelve,
   .foregroundColor:   MyColors.settings().secondary
], range: NSRange(location: primaryStr.count, length:  secondaryString.count))

        b.checkboxLabel.attributedText = attributedString
           return b
       }()
    lazy var checkBoxDraft3: CheckBoxButton = {
               let b = CheckBoxButton()
    //           b.checkboxLabel.text = "Auction"
        b.isChecked = false

     let primaryStr = "Autopick\n"
            let secondaryString = "Teams make picks and then order reverses"
    let attributedString = NSMutableAttributedString(string: "\(primaryStr)\(secondaryString)", attributes: [
    .font: AppFont.Medium().fourteen,
    .foregroundColor: MyColors.settings().primary
       ])

    attributedString.addAttributes([
    .font: AppFont.Regular().twelve,
       .foregroundColor: MyColors.settings().secondary
    ], range: NSRange(location: primaryStr.count, length:  secondaryString.count))

            b.checkboxLabel.attributedText = attributedString
               return b
           }()
    
    lazy var checkBoxDraft4: CheckBoxButton = {
               let b = CheckBoxButton()
    //           b.checkboxLabel.text = "Auction"
        b.isChecked = false
     let primaryStr = "Offline\n"
            let secondaryString = "Teams make picks and then order reverses"
    let attributedString = NSMutableAttributedString(string: "\(primaryStr)\(secondaryString)", attributes: [
    .font: AppFont.Medium().fourteen,
    .foregroundColor: MyColors.settings().primary
       ])

    attributedString.addAttributes([
    .font: AppFont.Regular().twelve,
       .foregroundColor: MyColors.settings().secondary
    ], range: NSRange(location: primaryStr.count, length:  secondaryString.count))

            b.checkboxLabel.attributedText = attributedString
               return b
           }()
    //MARK:- CUSTOMBUTTONSWITHIMAGES
    lazy var imageButton1 :buttonWithImageLeftRight = {
        let b = buttonWithImageLeftRight(rimage: #imageLiteral(resourceName: "drop-down-arrow 1"), mainText: "Later Today", limage: #imageLiteral(resourceName: "time"))
        b.setCorner(withRadius: 20)
        return b
    }()
    lazy var imageButton2 :buttonWithImageLeftRight = {
        let b = buttonWithImageLeftRight(rimage: #imageLiteral(resourceName: "drop-down-arrow 1"), mainText: "Select Time", limage: #imageLiteral(resourceName: "time2"))
        b.setCorner(withRadius: 20)

        return b
    }()
    lazy var scheduleDraft:UIButton = {
        let login = UIButton(title: "schedule Draft", titleColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1), font:AppFont.Bold().sixteen, backgroundColor: .white, target: self, action: #selector(handleCreate))
        
       
        return login
    }()
    @objc func handleCreate(){
        
    }

   
    
   override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    scheduleDraft.setGradientBackground(colorOne: MyColors.BasketBall().backgroundGradient1, colorTwo: MyColors.BasketBall().backgroundGradient2)
       scheduleDraft.withHeight(40)
       scheduleDraft.buttonBorder(withRadius: 20, width: 0)
   //        login.buttonBorder(withRadius: 15, width: 30, color: .black)
           
           
       }

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
         

        
        
        let separatorStack1 = UIStackView(arrangedSubviews: [UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
        separatorStack1.padTop(20).padBottom(20)
        let separatorStack2 = UIStackView(arrangedSubviews: [UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
             separatorStack2.padTop(30).padBottom(30)
//        let separatorStack3 = UIStackView(arrangedSubviews: [UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
//                    separatorStack2.padTop(20).padBottom(20)
        
         
        
        
        

         
        let name = UIStackView(arrangedSubviews: [NoTeamLabel])
        name.padLeft(10)
        
        let Draft_ = UIStackView(arrangedSubviews: [Draft])
        Draft_.padLeft(10)
       
        
                      
       let  h2 =   UIStackView(arrangedSubviews: [UIView(),scheduleDraft,UIView()
       ])
       
                     h2.axis = .horizontal
        h2.distribution = .fillEqually
        
        let v3 = UIStackView(arrangedSubviews: [
         checkBoxDraft1,checkBoxDraft2,checkBoxDraft3,checkBoxDraft4
         ])

                       v3.axis = .vertical
        //              h1.distribution = .fillEqually
                      v3.padLeft(10)
                      v3.padTop(20)
                      v3.padRight(10)
                      v3.spacing = 30
        formContainerStackView.spacing = 10
 
        let h3 = UIStackView(arrangedSubviews: [UIView(),imageButton1.withWidth(160).withHeight(40),UIView(),imageButton2.withWidth(160).withHeight(40),UIView()])
                              h3.axis = .horizontal
//                             h3.distribution = .fillEqually
                             h3.padLeft(20)
                             h3.padTop(0)
                             h3.padRight(10)
                             h3.spacing = 8
//        formContainerStackView.addArrangedSubview(name)
//        formContainerStackView.addArrangedSubview(h1)
//
//        formContainerStackView.addArrangedSubview(separatorStack1)
//
//        formContainerStackView.addArrangedSubview(scoring)
//
//        formContainerStackView.addArrangedSubview(v2)
        
//        formContainerStackView.addArrangedSubview(separatorStack2)
        
        formContainerStackView.addArrangedSubview(Draft_)
        formContainerStackView.addArrangedSubview(v3)
        
        formContainerStackView.addArrangedSubview(separatorStack1)
       
        let label = UILabel(text: "Draft Date & Time", font: AppFont.Medium().twelve, textColor:  UIColor(red: 0, green: 0, blue: 0, alpha: 1), textAlignment: .left, numberOfLines: 1)
        let l = UIStackView(arrangedSubviews: [label])
               l.padLeft(10)
       formContainerStackView.addArrangedSubview(l)
        formContainerStackView.addArrangedSubview(h3)
        formContainerStackView.addArrangedSubview(separatorStack2)
        
        formContainerStackView.addArrangedSubview(h2)
        
        

    }
    func setUpNavBar(){
            navigationItem.title = "Schedule Your Draft"
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
struct sch:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<sch.ContainerView>) -> UIViewController {
           UINavigationController(rootViewController: scheduleYourDraft())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<sch.ContainerView>) {
             
        }
        
        
       
    }
}
