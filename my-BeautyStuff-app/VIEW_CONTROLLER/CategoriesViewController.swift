//
//  CategoriesViewController.swift
//  my-BeautyStuff-app
//
//  Created by Phincon on 04/05/23.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTaableVw()
        // Do any additional setup after loading the view.
    }
    
    func setUpTaableVw(){
        tableView.register(UINib(nibName: "DiscountTableViewCell", bundle: nil), forCellReuseIdentifier: DiscountTableViewCell.identifier)
        tableView.register(UINib(nibName: "ListOfProductCategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: ListOfProductCategoriesTableViewCell.identifier)
    }

}
