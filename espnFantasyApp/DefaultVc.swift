//
//  DefaultVc.swift
//  espnFantasyApp
//
//  Created by prog on 1/7/20.
//  Copyright © 2020 prog. All rights reserved.
//

import Foundation
import UIKit
class defaultVC:UIViewController{
    lazy var image: AspectFitImageView = {
                    let imageView = AspectFitImageView(image: #imageLiteral(resourceName: "Screen Shot 2020-01-07 at 4.06.08 AM"), cornerRadius: 0)
       //    imageView.constrainHeight(100)
       //    imageView.constrainWidth(100)
                    return  imageView
                }()
    lazy var button : UIButton = {
        let b = UIButton(target: self, action: #selector(tapPic))
        b.backgroundColor = .clear
        b.titleLabel?.text = "dfafadagagdsgagasgagg"
        return b
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(image)
        view.addSubview(button)
        button.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero, size: .init(width: 100, height: 100))
        image.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero, size: .zero)
//        let gesture = UIGestureRecognizer(target: self, action: #selector(tapPic))
//        view.isUserInteractionEnabled = true
//        view.addGestureRecognizer(gesture)
    }
    @objc func tapPic(){
        print("hello")
        let window = self.view.window
        window?.rootViewController = CustomNavigationController(rootViewController: MyTeamContainer())
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(true)
       // Hide the Navigation Bar
               self.navigationController?.setNavigationBarHidden(true, animated: true)
           }
}
