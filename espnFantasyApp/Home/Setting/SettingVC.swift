//
//  SettingVC.swift
//  espnFantasyApp
//
//  Created by prog on 12/25/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
struct list {
    let section:String
    let data:[listData]
}
struct listData{
    let first:String
    

}
import UIKit
class SettingVC:BaseListController,UICollectionViewDelegateFlowLayout{
    var data = [
        list(section: "Subscription & Support", data: [listData(first: "Manager TV Provider"),listData(first:"Fantasy Subscription"), listData(first:"Fantasy Support")]),
    
        list(section: "Help Center", data: [listData(first: "Get Help"),listData(first:"Send Feedback" )]),
        
        list(section: "Account Preferences", data: [listData(first: "Account Information"),listData(first:"Legal Notices"), listData(first:"Share APP")])
        ]
    lazy var logout:UIButton = {
           let login = UIButton(title: "LogOut", titleColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1), font:AppFont.Bold().sixteen, backgroundColor: .white, target: self, action: #selector(handleLogout))
           
          
           return login
       }()
    @objc func handleLogout(){
        
    }
    fileprivate let  cellId = "DashboardcellId"
       fileprivate let supplementaryViewId = "supplementaryViewId"
    fileprivate let supplementaryViewId1 = "supplementaryViewId1"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        collectionView.backgroundColor = .white
        
        collectionView.register(settingHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: supplementaryViewId)
         collectionView.register(settingFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: supplementaryViewId1)
        
               collectionView.register(settingCell.self, forCellWithReuseIdentifier: cellId)
        
//        collectionView.addSubview(logout)
//        logout.anchor(top: nil, leading: nil, bottom: collectionView.bottomAnchor, trailing: nil, padding: .zero, size: .init(width: 60, height: 40))
//        logout.centerXTo(collectionView.centerXAnchor)
//        logout.setGradientBackground(colorOne: UIColor(red: 0.967, green: 0.31, blue: 0.31, alpha: 1), colorTwo:  UIColor(red: 0.738, green: 0.098, blue: 0.098, alpha: 1))
//        logout.buttonBorder(withRadius: 20, width: 0)
        
    }
    func setUpNavBar(){
        navigationItem.title = "Settings"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "go-back-left-arrow 1"), style: .plain, target: self, action: #selector(tapOnBack))
        self.navigationController?.setAllTitleColor(.white)
        self.navigationController?.navigationBar.barTintColor = .black
              self.navigationController?.navigationBar.tintColor = .white
              self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.navigationBar.barTintColor = .white
//        self.navigationController?.navigationBar.backgroundColor = .black
    }
    @objc func tapOnBack(){
        self.navigationController?.dismiss(animated: true, completion: nil)
//        self.navigationController?.popViewController(animated: true)
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].data.count
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return .init(width: view.frame.width, height: 100)
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if data.count == 3{
            return .init(width: view.frame.width, height: 50)
        }
        return .zero
    }
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryViewId, for: indexPath) as! settingHeader
//
//        supplementaryView.str = data[indexPath.section].section
//              return supplementaryView
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! settingCell
        cell.d = data[indexPath.section].data[indexPath.item]
        return cell
        
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 50)
    }
   
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {

           case UICollectionView.elementKindSectionHeader:

               let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryViewId, for: indexPath) as! settingHeader
                      
                      supplementaryView.str = data[indexPath.section].section
                            return supplementaryView

           case UICollectionView.elementKindSectionFooter:
              let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryViewId1, for: indexPath) as! settingFooter

               
               return supplementaryView

           default:

               assert(false, "Unexpected element kind")
           }
        
               
     }
}

class settingFooter: UICollectionReusableView {
     
   lazy var logout:UIButton = {
           let login = UIButton(title: "LogOut", titleColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1), font:AppFont.Bold().sixteen, backgroundColor: .white, target: self, action: #selector(handleLogout))
           
          
           return login
       }()
    @objc func handleLogout(){
        
    }
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .white
             logout.setGradientBackground(colorOne: UIColor(red: 0.967, green: 0.31, blue: 0.31, alpha: 1), colorTwo:  UIColor(red: 0.738, green: 0.098, blue: 0.098, alpha: 1))
        logout.setGradientBackground(colorOne: UIColor(red: 0.967, green: 0.31, blue: 0.31, alpha: 1), colorTwo:  UIColor(red: 0.738, green: 0.098, blue: 0.098, alpha: 1))
                logout.buttonBorder(withRadius: 20, width: 0)
        logout.withHeight(40)
           let main =  stack(logout)
        main.alignment = .center
        
        }
        required init?(coder: NSCoder) {
            fatalError()
        }
}

class settingHeader: UICollectionReusableView {
    var str:String?{
        didSet{
            self.mainTitle.text = str
        }
    }
    lazy var mainTitle: UILabel = {
        let l = UILabel(text: "Fantasy Soccer", font: AppFont.Bold().twenty, textColor:MyColors.settings().primary, textAlignment:.left , numberOfLines: 1)
       l.lineBreakMode = .byWordWrapping
       l.backgroundColor = .white
            return l
           
       }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .white
             
            stack(mainTitle).padTop(30).padLeft(10)
             
             
        }
        required init?(coder: NSCoder) {
            fatalError()
        }
}

class settingCell:BaseCell{
    var d:listData? {
        didSet{
            self.textlabel1.text = d?.first ?? ""
            
        }
    }
   
       lazy var textlabel1: UILabel = {
        let l = UILabel(text: "Pick the top Champions league players\neach week. Play the season against \nfamily and friends.", font: AppFont.Regular().twentytwo, textColor: MyColors.settings().secondary, textAlignment:.left, numberOfLines: 0)
           l.lineBreakMode = .byWordWrapping
        l.backgroundColor = .white
            return l
           
       }()
    
    override func setupViews() {
        super.setupViews()
        stack(textlabel1).padTop(10).padLeft(10)
     }
}
