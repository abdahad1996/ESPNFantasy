//
//  colors.swift
//  espnFantasyApp
//
//  Created by prog on 12/12/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit

import UIKit

extension UIColor {
    static public func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

struct MyColors {
    
    //gradient
    
    static let greenGradient1 =      UIColor(red: 0.227, green: 0.914, blue: 0.176, alpha: 1)
    static let greenGradient2 =     UIColor(red: 0.075, green: 0.765, blue: 0.478, alpha: 1)
    
    //splash
    static let progresstrackTintColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
    static let   progressTintColor = UIColor(red: 0.24, green: 0.96, blue: 0.16, alpha: 1)
    
    struct Dashboard {
        let backgroundGradient1 =  UIColor(red: 0.22, green: 0.906, blue: 0.188, alpha: 1)
        let backgroundGradient2 =  UIColor(red: 0.094, green: 0.784, blue: 0.435, alpha: 1)
    }
    struct Rugby {
        
        let backgroundGradient1 =         UIColor(red: 0.906, green: 0.317, blue: 0.188, alpha: 1)
        
        let backgroundGradient2 =          UIColor(red: 0.829, green: 0.614, blue: 0.062, alpha: 1)
        
    }
    struct BasketBall {
        
        let backgroundGradient1 =         UIColor(red: 0.906, green: 0.188, blue: 0.188, alpha: 1)
        
        let backgroundGradient2 =          UIColor(red: 0.913, green: 0.468, blue: 0.278, alpha: 1)
        
    }
    struct Hockey {
        
        let backgroundGradient1 =  UIColor(red: 0.188, green: 0.777, blue: 0.906, alpha: 1)
        let backgroundGradient2 =   UIColor(red: 0.045, green: 0.593, blue: 0.767, alpha: 1)
    }
    struct Baseball {
        
        let backgroundGradient1 =         UIColor(red: 0.675, green: 0.262, blue: 1, alpha: 1)
        
        let backgroundGradient2 =          UIColor(red: 0.836, green: 0.102, blue: 0.9, alpha: 1)
        
    }
    struct Play {
        
        let backgroundGradient1 =   UIColor(red: 0.933, green: 0.663, blue: 0.137, alpha: 1)
        let backgroundGradient2 =    UIColor(red: 1, green: 0.905, blue: 0.046, alpha: 1)
        
    }
    
    
    
}
