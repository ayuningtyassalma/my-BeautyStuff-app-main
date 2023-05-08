//
//  ViewController.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 10/04/23.
//

import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let RegistVc = storyboard.instantiateViewController(withIdentifier: "RegisterVc")
        let LandingPageVc = storyboard.instantiateViewController(withIdentifier: "LandingPageVc")
        viewControllers = [
            createNavController(for: RegistVc, title:NSLocalizedString("Profile", comment:"" ), image: UIImage(systemName: "person")!),
            createNavController(for: LandingPageVc, title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!)
        ]
        self.tabBar.backgroundColor = UIColor(named: "pink")
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image:UIImage) -> UIViewController{
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationItem.title = title
        return navController
        
        //        let landingpage = LandingPageViewController()
        //          let registerUser = LogInViewController()
        //
        //
        //
        //          landingpage.title = "Home"
        //          registerUser.title = "Regist/Login"
        //
        //          self.setViewControllers([landingpage, registerUser], animated: false)
        //          guard let itemsOfIcons = self.tabBar.items else {return}
        //          let icons = ["house", "person"]
        //          for icon in 0...1 {
        //              itemsOfIcons[icon].image = UIImage(systemName: icons[icon])
        //          }
        //        self.tabBar.backgroundColor = UIColor(named: "pink")
        //        self.tabBar.tintColor = .white
        
        
        
        
        
    }
    
    
    
    
    
}
