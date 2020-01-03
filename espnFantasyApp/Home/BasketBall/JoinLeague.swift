//
//  JoinLeague.swift
//  espnFantasyApp
//
//  Created by prog on 12/28/19.
//  Copyright © 2019 prog. All rights reserved.
//

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



class join_league : LBTAFormController {
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
    lazy var four: RoundedShadowButton = {
        let b = RoundedShadowButton(title: "4", titleColor:  UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1), font: AppFont.Medium().twelve
            , target: self,action:#selector(handleSettingTapped) )
        b.tag = 0
        b.constrainHeight(40)
        b.constrainWidth(40)

        return b
    }()
    lazy var six: RoundedShadowButton = {
        let b = RoundedShadowButton(title: "6", titleColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1), font: AppFont.Medium().twelve, backgroundColor: .white
            , target: self,action:#selector(handleSettingTapped) )
        b.tag = 1
        b.constrainHeight(40)
               b.constrainWidth(40)
        return b
    }()
    lazy var eight: RoundedShadowButton = {
        let b = RoundedShadowButton(title: "8", titleColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1), font: AppFont.Medium().twelve, backgroundColor: .white
            , target: self,action:#selector(handleSettingTapped) )
        b.tag = 2
        b.constrainHeight(40)
        b.constrainWidth(40)
        return b
    }()
    lazy var ten: RoundedShadowButton = {
        let b = RoundedShadowButton(title: "10", titleColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1), font: AppFont.Medium().twelve, backgroundColor: .white
            , target: self,action:#selector(handleSettingTapped) )
        b.tag = 3
        b.constrainHeight(40)
               b.constrainWidth(40)
        return b
    }()
    lazy var twelve: RoundedShadowButton = {
        let b = RoundedShadowButton(title: "12", titleColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1), font: AppFont.Medium().twelve, backgroundColor: .white
            , target: self,action:#selector(handleSettingTapped) )
        b.tag = 4
        b.constrainHeight(40)
               b.constrainWidth(40)
        return b
    }()
    lazy var fourteen: RoundedShadowButton = {
        let b = RoundedShadowButton(title: "14", titleColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1), font: AppFont.Medium().twelve, backgroundColor: .white
            , target: self,action:#selector(handleSettingTapped) )
        b.tag = 5
        b.constrainHeight(40)
        b.constrainWidth(40)
        return b
    }()
    lazy var sixteen: RoundedShadowButton = {
           let b = RoundedShadowButton(title: "16", titleColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1), font: AppFont.Medium().twelve, backgroundColor: .white
               , target: self,action:#selector(handleSettingTapped) )
           b.tag = 6
         
        b.constrainHeight(40)
        b.constrainWidth(40)
           return b
       }()
    //MARK:checkButtons
    lazy var checkBox1: CheckBoxButton = {
        let b = CheckBoxButton()
        b.checkboxLabel.text = "Head-to-Head Points"
        b.isChecked = true
        return b
    }()
    lazy var checkBox2: CheckBoxButton = {
        let b = CheckBoxButton()
        b.checkboxLabel.text = "Head-to-Head Each Category"
        b.isChecked = false
        return b
    }()
    lazy var checkBox3: CheckBoxButton = {
        let b = CheckBoxButton()
        b.checkboxLabel.text =  "Head-to-Head Most Categories"
        b.isChecked = false

        return b
    }()
    lazy var checkBox4: CheckBoxButton = {
        let b = CheckBoxButton()
        b.checkboxLabel.text = "Rotisserie"
        b.isChecked = false

        return b
    }()
    lazy var checkBox5: CheckBoxButton = {
           let b = CheckBoxButton()
           b.checkboxLabel.text = "Season Points"
        b.isChecked = false

           return b
       }()
    
    //MARK:Draft type
       
    lazy var Draft: UILabel = {
    let l = UILabel(text: "Draft Type", font: AppFont.Medium().twelve, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)
          
          return l
      }()
   lazy var checkBoxDraft1: CheckBoxButton = {
               let b = CheckBoxButton()
    //           b.checkboxLabel.text = "Auction"
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
    lazy var create:UIButton = {
        let login = UIButton(title: "Join", titleColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1), font:AppFont.Bold().sixteen, backgroundColor: .white, target: self, action: #selector(handleCreate))
        
       
        return login
    }()
    @objc func handleCreate(){
        
    }

    @objc func handleSettingTapped(_ sender: AnyObject){
        switch sender.tag{
                   
               case 0:
                four.isChecked = !four.isChecked
                if six.isChecked{
                 six.isChecked = false
                 }
                 if eight.isChecked{
                 eight.isChecked = false
                 }
                if ten.isChecked{
                 ten.isChecked = false
                 }
                 if twelve.isChecked{
                 twelve.isChecked = false
                 }
                if fourteen.isChecked{
                 fourteen.isChecked = false
                 }
                 if sixteen.isChecked{
                 sixteen.isChecked = false
                 }
               case 1:
                   six.isChecked = !six.isChecked
                   if four.isChecked{
                    four.isChecked = false
                    }
                    if eight.isChecked{
                    eight.isChecked = false
                    }
                   if ten.isChecked{
                    ten.isChecked = false
                    }
                    if twelve.isChecked{
                    twelve.isChecked = false
                    }
                   if fourteen.isChecked{
                    fourteen.isChecked = false
                    }
                    if sixteen.isChecked{
                    sixteen.isChecked = false
                    }
                   
            case 2:
                    eight.isChecked = !eight.isChecked
            if four.isChecked{
             four.isChecked = false
             }
             if six.isChecked{
             six.isChecked = false
             }
            if ten.isChecked{
             ten.isChecked = false
             }
             if twelve.isChecked{
             twelve.isChecked = false
             }
            if fourteen.isChecked{
             fourteen.isChecked = false
             }
             if sixteen.isChecked{
             sixteen.isChecked = false
             }
            case 3:
                           ten.isChecked = !ten.isChecked
            if four.isChecked{
                        four.isChecked = false
                        }
                        if six.isChecked{
                        six.isChecked = false
                        }
                       if eight.isChecked{
                        eight.isChecked = false
                        }
                        if twelve.isChecked{
                        twelve.isChecked = false
                        }
                       if fourteen.isChecked{
                        fourteen.isChecked = false
                        }
                        if sixteen.isChecked{
                        sixteen.isChecked = false
                        }
            
            case 4:
                               twelve.isChecked = !twelve.isChecked
            if four.isChecked{
                               four.isChecked = false
                               }
                               if six.isChecked{
                               six.isChecked = false
                               }
                               if eight.isChecked{
                               eight.isChecked = false
                               }
                              if ten.isChecked{
                               ten.isChecked = false
                               }
                               
                              if fourteen.isChecked{
                               fourteen.isChecked = false
                               }
                               if sixteen.isChecked{
                               sixteen.isChecked = false
                               }
            case 5:
                              fourteen.isChecked = !fourteen.isChecked
            if six.isChecked{
                            six.isChecked = false
                            }
                            if eight.isChecked{
                            eight.isChecked = false
                            }
                           if ten.isChecked{
                            ten.isChecked = false
                            }
                            if twelve.isChecked{
                            twelve.isChecked = false
                            }
                           if four.isChecked{
                            four.isChecked = false
                            }
                            if sixteen.isChecked{
                            sixteen.isChecked = false
                            }
       
               default:
                    sixteen.isChecked = !sixteen.isChecked
            if six.isChecked{
                                      six.isChecked = false
                                      }
                                      if eight.isChecked{
                                      eight.isChecked = false
                                      }
                                     if ten.isChecked{
                                      ten.isChecked = false
                                      }
                                      if twelve.isChecked{
                                      twelve.isChecked = false
                                      }
                                     if four.isChecked{
                                      four.isChecked = false
                                      }
                                      if fourteen.isChecked{
                                      fourteen.isChecked = false
                                      }
                 
               }
            
        
    }
    
   override func viewDidLayoutSubviews() {
    create.setGradientBackground(colorOne: MyColors.BasketBall().backgroundGradient1, colorTwo: MyColors.BasketBall().backgroundGradient2)
       create.withHeight(40)
       create.buttonBorder(withRadius: 20, width: 0)
   //        login.buttonBorder(withRadius: 15, width: 30, color: .black)
           
           
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        four.isChecked = true
        setUpNavBar()
setUpView()
    }
//    override func viewWillLayoutSubviews() {
//        setUpView()
//    }
    func setUpView(){
        formContainerStackView.padTop(30)
        
           let v1 = UIStackView(arrangedSubviews: [leagueNameLabel,leagueTF])
        v1.axis = .vertical
        v1.distribution = .fill
        v1.padLeft(10)
        v1.padTop(20)
        v1.padRight(10)
        v1.spacing = 10

        
        
        let separatorStack = UIStackView(arrangedSubviews: [UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
        separatorStack.padTop(20).padBottom(20)
        
        let separatorStack1 = UIStackView(arrangedSubviews: [UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
        separatorStack1.padTop(20).padBottom(20)
        
        let separatorStack2 = UIStackView(arrangedSubviews: [UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
        separatorStack2.padTop(20).padBottom(20)
        
        let separatorStack3 = UIStackView(arrangedSubviews: [UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
        separatorStack3.padTop(20).padBottom(20)
        
        let separatorStack4 = UIStackView(arrangedSubviews: [UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
               separatorStack4.padTop(20).padBottom(20)
        
        
        

         
        let name = UIStackView(arrangedSubviews: [NoTeamLabel])
        name.padLeft(10)
        
        let Draft_ = UIStackView(arrangedSubviews: [Draft])
        Draft_.padLeft(10)
        
        let h1 = UIStackView(arrangedSubviews: [UIView(),four,UIView(),six,UIView(),eight,UIView(),ten,UIView(),twelve,UIView(),fourteen,UIView(),sixteen,UIView()])
                       h1.axis = .horizontal
        //              h1.distribution = .fillEqually
                      h1.padLeft(10)
                      h1.padTop(20)
                      h1.padRight(10)
                      h1.spacing = 8
        //        h1.constrainHeight(40)
        let scoring = UIStackView(arrangedSubviews: [ scoringType])
               scoring.padLeft(10)
        let v2 = UIStackView(arrangedSubviews: [checkBox1,checkBox2,checkBox3
            ,checkBox4,checkBox5
        
        ])
        
                      v2.axis = .vertical
       //              h1.distribution = .fillEqually
                     v2.padLeft(10)
                     v2.padTop(20)
                     v2.padRight(10)
                     v2.spacing = 20
       let  h2 =   UIStackView(arrangedSubviews: [UIView(),create,UIView()
       ])
       
                     h2.axis = .horizontal
        h2.distribution = .fillEqually
        
        let v3 = UIStackView(arrangedSubviews: [
         checkBoxDraft1,checkBoxDraft2
         ])

                       v3.axis = .vertical
        //              h1.distribution = .fillEqually
                      v3.padLeft(10)
                      v3.padTop(20)
                      v3.padRight(10)
                      v3.spacing = 20
        formContainerStackView.spacing = 10
 
        let h3 = UIStackView(arrangedSubviews: [UIView(),imageButton1.withWidth(160).withHeight(40),UIView(),imageButton2.withWidth(160).withHeight(40),UIView()])
                              h3.axis = .horizontal
//                             h3.distribution = .fillEqually
                             h3.padLeft(20)
                             h3.padTop(0)
                             h3.padRight(10)
                             h3.spacing = 8
        formContainerStackView.addArrangedSubview(name)
        formContainerStackView.addArrangedSubview(h1)
        
        formContainerStackView.addArrangedSubview(separatorStack1)
        
        formContainerStackView.addArrangedSubview(scoring)
        
        formContainerStackView.addArrangedSubview(v2)
        
        formContainerStackView.addArrangedSubview(separatorStack2)
        
        formContainerStackView.addArrangedSubview(Draft_)
        formContainerStackView.addArrangedSubview(v3)
        
        formContainerStackView.addArrangedSubview(separatorStack3)
        formContainerStackView.addArrangedSubview(h3)
        formContainerStackView.addArrangedSubview(separatorStack4)
        
        formContainerStackView.addArrangedSubview(h2)
        
        

    }
    func setUpNavBar(){
            navigationItem.title = "Join League"
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
struct join:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<join.ContainerView>) -> UIViewController {
           UINavigationController(rootViewController: join_league())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<join.ContainerView>) {
             
        }
        
        
       
    }
}

