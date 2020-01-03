//
//  leagueManagerTool.swift
//  espnFantasyApp
//
//  Created by prog on 12/29/19.
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

class toolListCell: LBTAListCell<String> {
    
    override var item: String! {
        didSet {
                       nameLabel.text = item

        }
    }
    
    lazy var nameLabel:UILabel = {
        let nameLabel = UILabel(text:  "Edit Draft Setting", font: AppFont.Medium().fourteen, textColor:  UIColor(red: 0.254, green: 0.248, blue: 0.248, alpha: 1))
        nameLabel.textAlignment = .left
        return nameLabel
    }()
    
    
    override func setupViews() {
         
        
         let separatorStack3 = UIStackView(arrangedSubviews: [UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
        separatorStack3.padTop(0).padBottom(10)
        
         
        stack(hstack( nameLabel,UIView()),separatorStack3).padLeft(20).padTop(20).padRight(20)
        
    }
    
    
    
     
    
}


class leagueManagerTool : LBTAListController<toolListCell, String>,UICollectionViewDelegateFlowLayout {
   
     
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 60)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
          setUpNavBar()
         self.items = ["Edit Draft Setting","Edit Owners","Delete League"]
    }
    func setUpNavBar(){
         
            navigationItem.title = "League Manager’s Tools"
        
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "go-back-left-arrow 1"), style: .plain, target: self, action: #selector(tapOnBack))
            self.navigationController?.setAllTitleColor(.white)
 
                  self.navigationController?.navigationBar.tintColor = .white
  self.navigationController?.navigationBar.setGradientBackground(colors: [MyColors.BasketBall().backgroundGradient1,MyColors.BasketBall().backgroundGradient2])
    
        }
    @objc func tapOnBack(){
//            self.navigationController?.dismiss(animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
    //        self.navigationController?.popViewController(animated: true)
        }
}

import SwiftUI
struct leagueTool:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<leagueTool.ContainerView>) -> UIViewController {
           UINavigationController(rootViewController: leagueManagerTool())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<leagueTool.ContainerView>) {
             
        }
        
        
       
    }
}
