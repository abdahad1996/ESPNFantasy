//
//  Fonts.swift
//  espnFantasyApp
//
//  Created by prog on 12/14/19.
//  Copyright © 2019 prog. All rights reserved.
//
import UIKit
import Foundation
enum fontType: String {
   case Regular = "Roboto-Regular"
   case Thin = "Roboto-Thin"
   case Medium = "Roboto-Medium"
   case Bold = "Roboto-Bold"
   case Light = "Roboto-Light"
}

extension UIFont {
   convenience  init(name: fontType, size: CGFloat) {
      self.init(name: name.rawValue, size: size)!
   }
}
struct AppFont {
   struct Medium {
      let eight: UIFont = UIFont(name: .Medium, size: 8.0)
    let twelve: UIFont = UIFont(name: .Medium, size: 12.0)
    let fourteen: UIFont = UIFont(name: .Medium, size: 14.0)
    let sixteen: UIFont = UIFont(name: .Medium, size: 16.0)


   }
   struct Regular {
      let sixteen: UIFont = UIFont(name: .Regular, size: 16.0)
    let twelve: UIFont = UIFont(name: .Regular, size: 12.0)
    let fourteen: UIFont = UIFont(name: .Regular, size: 14.0)
    let twentytwo: UIFont = UIFont(name: .Regular, size: 22.0)


    
   }
   struct Thin {
      let sixteen: UIFont = UIFont(name: .Thin, size: 16.0)
   }
    struct Bold {
        let twelve: UIFont = UIFont(name: .Bold, size: 12.0)

       let sixteen: UIFont = UIFont(name: .Bold, size: 16.0)
        let twenty: UIFont = UIFont(name: .Bold, size: 20.0)
        let thirtyfour: UIFont = UIFont(name: .Bold, size: 34.0)


    }
}
