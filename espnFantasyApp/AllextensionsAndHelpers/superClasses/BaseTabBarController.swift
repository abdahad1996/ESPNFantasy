

import UIKit

class BaseTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        viewControllers = [
//            createNavController(viewController: MusicController(), title: "Music", imageName: "music"),
//            createNavController(viewController: TodayController(), title: "Today", imageName: "today_icon"),
//            createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps"),
//            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search"),
//        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        if #available(iOS 11.0, *) {
            navController.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
        
    }
    
}
