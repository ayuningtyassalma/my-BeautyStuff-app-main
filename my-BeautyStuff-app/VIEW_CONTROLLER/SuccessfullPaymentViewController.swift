//
//  SuccessfullPaymentViewController.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 03/05/23.
//

import UIKit

class SuccessfullPaymentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

    
    @IBOutlet weak var tableVw: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVw.dataSource = self
        tableVw.delegate = self
    
    }
    


}
