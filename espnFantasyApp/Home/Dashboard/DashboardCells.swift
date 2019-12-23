//
//  DashboardCells.swift
//  espnFantasyApp
//
//  Created by prog on 12/19/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
 

import UIKit

 

class DashboardCells: BaseCell {
    
//    var video: Video? {
//        didSet {
//            titleLabel.text = video?.title
//
//            setupThumbnailImage()
//
//            setupProfileImage()
//
//            if let channelName = video?.channel?.name, let numberOfViews = video?.numberOfViews {
//
//                let numberFormatter = NumberFormatter()
//                numberFormatter.numberStyle = .decimal
//
//                let subtitleText = "\(channelName) • \(numberFormatter.string(from: NSNumber(value: numberOfViews))!) • 2 years ago "
//                subtitleTextView.text = subtitleText
//            }
//
//            //measure title text
//            if let title = video?.title {
//                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
//                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
//                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
//
//                if estimatedRect.size.height > 20 {
//                    titleLabelHeightConstraint?.constant = 44
//                } else {
//                    titleLabelHeightConstraint?.constant = 20
//                }
//            }
//
//
//        }
//    }
    
//    func setupProfileImage() {
//        if let profileImageUrl = video?.channel?.profileImageName {
//            userProfileImageView.loadImageUsingUrlString(urlString: profileImageUrl)
//        }
//    }
//    
//    func setupThumbnailImage() {
//        if let thumbnailImageUrl = video?.thumbnailImageName {
//            thumbnailImageView.loadImageUsingUrlString(urlString: thumbnailImageUrl)
//        }
//    }
    lazy var cardView1: CardView = {
        let cv = CardView(image: #imageLiteral(resourceName: "l1 1"), mainText: "Michigan", submainText: "Leads at Halftime", percentText: "93.4%")
        cv.backgroundColor = .white
        let button = UIButton()
            button.setBackgroundImage(#imageLiteral(resourceName: "Group 10"), for: .normal)
            cv.addSubview(button)
            button.anchor(top: cv.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: -10, left: 0, bottom: 0, right: 0), size: .init(width: 40, height: 40))
            button.layer.cornerRadius = 20
            button.layer.masksToBounds = true
            button.centerXTo(cv.centerXAnchor)
        return cv
    }()
    lazy var cardView2: CardView = {
             let cv = CardView(image: #imageLiteral(resourceName: "l5 1"), mainText: "Michigan", submainText: "Leads at Halftime", percentText: "93.4%")
                cv.backgroundColor = .white
            let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "Group 7"), for: .normal)
        cv.addSubview(button)
        button.anchor(top: cv.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: -10, left: 0, bottom: 0, right: 0), size: .init(width: 40, height: 40))
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.centerXTo(cv.centerXAnchor)
 
                return cv
       }()
 lazy var textlabel: UILabel = {
    let l = UILabel(text: "NCW (Charleston @ Presbyterian): \nWhich TEAM will be LEADING at HALFTIME?", font: AppFont.Medium().fourteen, textColor:UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 1), textAlignment:.left, numberOfLines: 0)
    l.lineBreakMode = .byWordWrapping
    l.backgroundColor = .white
         return l
        
    }()
    lazy var preview: UIButton = {
        let b = UIButton(title: "PREVIEW", titleColor: UIColor(red: 0.125, green: 0.812, blue: 0.38, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
        return b
    }()
    lazy var Discuss: UIButton = {
        let b = UIButton(title: "DISCUSS", titleColor: UIColor(red: 0.125, green: 0.812, blue: 0.38, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
        return b
    }()
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        backgroundColor  =  .white
        let h1 = hstack(cardView1.withHeight(152).withWidth(149),cardView2.withHeight(152).withWidth(149))
//        h1.constrainHeight(152)
        h1.distribution = .fillEqually
        h1.spacing = 20
         let h2 = hstack(preview,Discuss)
        h2.distribution = .fillEqually
        let v1 = stack(textlabel,h1).padBottom(20)
//        v1.spacing = -5
       let mainStack = stack(textlabel,
              v1,
              UIView(backgroundColor: UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1)).withHeight(1),
              h2
        ).withMargins(.init(top: 10, left: 10, bottom: 10, right: 10))
         setupShadow(opacity: 1, radius: 12, offset: .init(width: 0, height: 4), color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.17) )
//        mainStack.backgroundColor = .white
//        mainStack.addBackground(color: .red)
        mainStack.spacing = 20
    }
}
extension UIStackView {

    func addBackground(color: UIColor) {
        let subview = UIView(frame: bounds)
        subview.backgroundColor = color
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subview, at: 0)
    }

}
