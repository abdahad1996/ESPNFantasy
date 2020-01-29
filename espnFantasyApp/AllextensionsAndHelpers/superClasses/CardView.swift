//
//  CardView.swift
//  espnFantasyApp
//
//  Created by prog on 12/22/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit

class CardView:UIView{
    
        
          public var cornerRadius: CGFloat {
            get {
                return layer.cornerRadius
            }
            
            set {
                layer.cornerRadius = newValue
            }
        }
         public var borderWidth: CGFloat {
            get {
                return layer.borderWidth
            }
            
            set {
                layer.borderWidth = newValue
            }
        }
         public var borderColor: UIColor {
            get {
                return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
            }
            
            set {
                layer.borderColor = newValue.cgColor
            }
        }
        
      
        var shadowRadius: CGFloat {
            get {
                return layer.shadowRadius
            }
            set {
                layer.shadowRadius = newValue
            }
        }
        
         
        var shadowOpacity: Float {
            get {
                return layer.shadowOpacity
            }
            set {
                layer.shadowOpacity = newValue
            }
        }
        
       
        var shadowOffset: CGSize {
            get {
                return layer.shadowOffset
            }
            set {
                layer.shadowOffset = newValue
            }
        }
        
       
        var shadowColor: UIColor? {
            get {
                if let color = layer.shadowColor {
                    return UIColor(cgColor: color)
                }
                return nil
            }
            set {
                if let color = newValue {
                    layer.shadowColor = color.cgColor
                } else {
                    layer.shadowColor = nil
                }
            }
        }
    


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        self.setupShadow(opacity: 1, radius: 10, offset: CGSize(width: 0, height: 2), color: UIColor(red: 0.312, green: 0.309, blue: 0.309, alpha: 0.34))
     }
    lazy var logo: AspectFitImageView = {
        let l = AspectFitImageView(image: #imageLiteral(resourceName: "splash"))
        return l
    }()
    lazy var mainText: UILabel = {
        let l = UILabel(text: "Michigan", font: AppFont.Bold().sixteen, textColor: UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 1), textAlignment: .center, numberOfLines: 1)
           return l
           
       }()
    lazy var submainText: UILabel = {
           let l = UILabel(text: "Leads at Halftime", font: AppFont.Medium().twelve, textColor: UIColor(red: 0.308, green: 0.308, blue: 0.308, alpha: 1), textAlignment: .center, numberOfLines: 1)
           return l
           
       }()
    lazy var percentText: UILabel = {
           let l = UILabel(text: "93.4%", font: AppFont.Medium().twelve, textColor: UIColor(red: 0.554, green: 0.547, blue: 0.547, alpha: 1), textAlignment: .center, numberOfLines: 1)
           return l
           
       }()
    convenience init(image:UIImage,mainText:String,submainText:String,percentText:String) {
        self.init()
        logo.image = image
        logo.withHeight(50).withHeight(50)
        let v = stack(self.mainText,self.submainText,self.percentText,UIView())
        v.distribution = .fill
        
        self.mainText.text = mainText
        self.submainText.text = submainText
        self.percentText.text = percentText

        stack(logo,UIView().withHeight(10).withHeight(10),v, spacing: 0, alignment: .center, distribution: .fill).withMargins(.init(top: 10, left: 0, bottom: 10, right: 0))
        
           
    }
     
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
