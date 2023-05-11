//
//  ProfileViewController.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 08/05/23.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    @objc func logoutBtnTapped(_sender: Any){
        let firebaseAuth = Auth.auth()
        do{
            try firebaseAuth.signOut()
        
        } catch let logoutError as NSError {
            print(logoutError)
        }
        let vc = LogInViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        removeFromParent()
        
    }
    
    func tappedLogout() {
        logoutBtn.addTarget(self, action: #selector(self.logoutBtnTapped(_sender:)), for: .touchUpInside)
 
    }

    @IBOutlet weak var profileIMG: UIImageView!
    
    @IBOutlet weak var arrowRight: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var settingPassword: UIImageView!
    
    @IBOutlet weak var profileIcon: UIImageView!
    
    @IBOutlet weak var profileLbl: UILabel!
    
    @IBOutlet weak var arrowright: UIImageView!
    
    @IBOutlet weak var logoutBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tappedLogout()
        
        self.navigationController?.isNavigationBarHidden = true
    }
    

   

}
