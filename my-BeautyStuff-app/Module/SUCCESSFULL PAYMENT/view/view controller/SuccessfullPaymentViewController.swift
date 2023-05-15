//
//  SuccessfullPaymentViewController.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 03/05/23.
//

import UIKit

class SuccessfullPaymentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var successfullpaymentIcon: UIImageView!
    
    @IBOutlet weak var paymenrSuccessLbl: UILabel!
    
    @IBOutlet weak var thankyouLbl: UILabel!
    
    @IBOutlet weak var CTAbtn: UIButton!{
        didSet{
            CTAbtn.layer.cornerRadius = 15
        }
    }
    @IBAction func actionEven(_sender: UIButton){
        let homeViewController: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: "LandingPageVc") as? LandingPageViewController)!
        self.navigationController?.pushViewController(homeViewController, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }


}
