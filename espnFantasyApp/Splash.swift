//
//  Splash.swift
//  espnFantasyApp
//
//  Created by prog on 12/12/19.
//  Copyright © 2019 prog. All rights reserved.
//
import UIKit

@available(iOS 13.0, *)
extension UIResponder {
    @objc var scene: UIScene? {
        return nil
    }
}

@available(iOS 13.0, *)
extension UIScene {
    @objc override var scene: UIScene? {
        return self
    }
}

@available(iOS 13.0, *)
extension UIView {
    @objc override var scene: UIScene? {
        if let window = self.window {
            return window.windowScene
        } else {
            return self.next?.scene
        }
    }
}

@available(iOS 13.0, *)
extension UIViewController {
    @objc override var scene: UIScene? {
        // Try walking the responder chain
        var res = self.next?.scene
        if (res == nil) {
            // That didn't work. Try asking my parent view controller
            res = self.parent?.scene
        }
        if (res == nil) {
            // That didn't work. Try asking my presenting view controller
            res = self.presentingViewController?.scene
        }

        return res
    }
}

import Foundation
import UIKit
   extension UIView {
        class func loadFromNibNamed(nibNamed: String, bundle: Bundle? = nil) -> UIView? {
          return UINib(
              nibName: nibNamed,
              bundle: bundle
          ).instantiate(withOwner: nil, options: nil)[0] as? UIView
      }
    }
class Splash:LBTAFormController{
    
    var timerForSplashEnd: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
    
  scrollView.alwaysBounceVertical = true
  
  formContainerStackView.axis = .vertical
  formContainerStackView.spacing = 5
  formContainerStackView.layoutMargins = .init(top: 0, left: 24, bottom: 16, right: 24)
  
  view.backgroundColor = #colorLiteral(red: 0.9486700892, green: 0.9493889213, blue: 0.9487814307, alpha: 1)
  
  let imageView = UIImageView(image: #imageLiteral(resourceName: "splash"), contentMode: .scaleAspectFit)
  imageView.constrainHeight(300)
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.constrainHeight(10)
        progress.trackTintColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        progress.progressTintColor = UIColor(red: 0.24, green: 0.96, blue: 0.16, alpha: 1)
        progress.progress = 0.1
        let spacer = UIView().withHeight(200)
        
        formContainerStackView.alignment = .fill
    
        formContainerStackView.distribution = .fill
        formContainerStackView.addArrangedSubview(spacer)
        formContainerStackView.addArrangedSubview(imageView)
        formContainerStackView.addArrangedSubview(progress)
//        formContainerStackView.addArrangedSubview(UIView())
//        UIView.transition(with: progress, duration: 10, options: .curveEaseInOut, animations: {
//             print("start")
//                progress.setProgress(1.0, animated: true)
//        }) { (true) in
//            self.checkSession()
//        }
 
        UIView.transition(with: progress,
                          duration:4,
                          options: .curveEaseIn,
                          animations: { progress.setProgress(1.0, animated: true) },
                          completion:  {
                            (finished: Bool) -> Void in
                            DispatchQueue.main.asyncAfter(deadline: .now()+4) {
                        self.checkSession()
                            }
                            
        })

            
         
    }
    func checkSession(){
//        if let windowScene = scene as? UIWindowScene {
//                    let window = UIWindow(windowScene: windowScene)
//        //            window.rootViewController = UIHostingController(rootView: contentView)
//                     window.rootViewController = UINavigationController(rootViewController: Login())
//                     window.makeKeyAndVisible()
//                }
        print("completed")
        let window = self.view.window
        window?.rootViewController = UINavigationController(rootViewController: Login())
    }
}
import SwiftUI
struct MainPreview:PreviewProvider{
    static var previews: some View {
//        Text("main preview 123123")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
            return Splash()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
            
        }
    }
}
