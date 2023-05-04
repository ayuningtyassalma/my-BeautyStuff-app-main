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
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func setUpTaableVw(){
        tableView.register(UINib(nibName: "ListOfProductCategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: ListOfProductCategoriesTableViewCell.identifier)
    }

}

extension CategoriesViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ListOfProductCategoriesTableViewCell.identifier) as? ListOfProductCategoriesTableViewCell else {
                return UITableViewCell()}
        cell.setUpCollectionCell()
            return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
