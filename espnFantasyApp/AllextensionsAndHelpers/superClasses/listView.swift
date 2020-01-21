//
//  tradeCollectionView.swift
//  espnFantasyApp
//
//  Created by prog on 12/29/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
struct obj {
    let name:String
    let val:Int
}
class PhotoGridCell: LBTAListCell<obj> {
    
    override var item: obj! {
        didSet {
            Label.text = item.name
            Labelint.text = "\(item.val)"
        }
    }
    
    lazy var Label: UILabel = {
           let l = UILabel(text: "League Name", font: AppFont.Regular().fourteen, textColor: UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), textAlignment: .left, numberOfLines: 1)
                 
                 return l
             }()
    lazy var Labelint: UILabel = {
    let l = UILabel(text: "0", font: AppFont.Regular().fourteen, textColor: UIColor(red: 0.003, green: 0.57, blue: 0.783, alpha: 1), textAlignment: .left, numberOfLines: 1)
          
          return l
      }()
    
    override func setupViews() {
        backgroundColor = .white
        let separatorStack4 = UIStackView(arrangedSubviews: [UIView(backgroundColor: UIColor(red: 0.621, green: 0.621, blue: 0.621, alpha: 1)).withHeight(1)])
            separatorStack4.padTop(5).padBottom(0)

        let h = hstack(Label,Labelint.withWidth(10))
        h.distribution = .fillEqually
        h.spacing = 15
        stack(h,separatorStack4).padLeft(30).padRight(30)
        
        
    }
}
class StoryHeader: UICollectionReusableView {
    
     
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let label = UILabel(text:  "Trades & Acquisitions", font: AppFont.Bold().twelve, textColor: .white, textAlignment: .left, numberOfLines: 1)
        setGradientBackground(colorOne: MyColors.BasketBall().backgroundGradient1, colorTwo: MyColors.BasketBall().backgroundGradient2)
        stack(label).padLeft(30)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
class tradeController:
LBTAListHeaderController<PhotoGridCell, obj, StoryHeader>,UICollectionViewDelegateFlowLayout
  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        self.items = [obj(name: "Acquisitions", val: 0) ,obj(name: "Matchup Acquisitions", val: 0),obj(name: "Trades", val: 0) , obj(name: "Trade Deadline", val: 0) ,obj(name: "Waive Order", val: 0)  ]
    }
    
    let cellSpacing: CGFloat = 4
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let vc = UINavigationController(rootViewController: leagueInfoContainer())
                          vc.modalPresentationStyle = .fullScreen
                          self.present(vc, animated: true, completion: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        
        return .init(width: view.frame.width, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return .init(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return cellSpacing
//    }
    
}

struct listGrid: PreviewProvider {
    
    static var previews: some View {
       ContainerView()
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<listGrid.ContainerView>) -> UIViewController {
            return tradeController()
        }
        
        func updateUIViewController(_ uiViewController: listGrid.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<listGrid.ContainerView>) {
            
        }
    }
    
}
