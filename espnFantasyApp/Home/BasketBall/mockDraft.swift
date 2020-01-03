//
//  mockDraft.swift
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

class draft_cell:BaseCell{
    //make this a subclass in the future to reuse it everywhere 
    lazy var cardView: UIView = {
        let cv = UIView()
//        cv.withBorder(width: 1, color: UIColor(red: 0.906, green: 0.267, blue: 0.212, alpha: 1))
        cv.setCorner(withRadius: 10, borderWidth: 1, color:   UIColor(red: 0.906, green: 0.267, blue: 0.212, alpha: 1))
        
        return cv
    }()
    lazy var playersOff: UILabel = {
        let l = UILabel(text: "Players OFF", font: AppFont.Medium().fourteen, textColor:  UIColor(red: 0.906, green: 0.267, blue: 0.212, alpha: 1), textAlignment: .left, numberOfLines: 1)
        return l
    }()
    lazy var timeLabel: UILabel = {
        let l = UILabel(text: "4:00 PM", font: AppFont.Medium().fourteen, textColor:  UIColor(red: 0.906, green: 0.267, blue: 0.212, alpha: 1), textAlignment: .left, numberOfLines: 1)
        return l
    }()
    
    override func setupViews() {
        cardView.addSubview(playersOff)
        cardView.addSubview(timeLabel)
        playersOff.anchor(top: cardView.topAnchor, leading: cardView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left:10, bottom: 0, right: 0), size: .init(width: 75, height: 16))
        playersOff.centerYToSuperview()

        timeLabel.anchor(top: cardView.topAnchor, leading: nil, bottom: nil, trailing: cardView.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 15), size: .init(width: 60, height: 14))
        timeLabel.centerYToSuperview()

        stack(cardView).withMargins(.init(top: 5, left: 16, bottom: 5, right: 16))
        
    }
}

extension Mock_Draft:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? draft_cell else{return UICollectionViewCell()}
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 60)
    }
    
}
class Mock_Draft : LBTAFormController {
    let cellID = "cellid"
    lazy var availableLabel: UILabel = {
        let l = UILabel(text: "Available Mocks", font: AppFont.Medium().twelve, textColor: MyColors.settings().primary, textAlignment: .left, numberOfLines: 1)
              
              return l
          }()

    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
       
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
 
                 
                collectionView.delegate = self
                       collectionView.dataSource = self
        collectionView.register(draft_cell.self,   forCellWithReuseIdentifier: cellID)
        setUpNavBar()
        setUpView()
    }
    func setUpView(){

        formContainerStackView.withMargins(.init(top: 40, left: 10, bottom: 10, right: 10))
        formContainerStackView.spacing = 20
        formContainerStackView.distribution = .fill
        formContainerStackView.addArrangedSubview(availableLabel)

        formContainerStackView.addArrangedSubview(collectionView.withHeight(1000))
    }
    func setUpNavBar(){
            navigationItem.title = "Draft Lobby"
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
struct mock:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<mock.ContainerView>) -> UIViewController {
           UINavigationController(rootViewController: Mock_Draft())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<mock.ContainerView>) {
             
        }
        
        
       
    }
}
