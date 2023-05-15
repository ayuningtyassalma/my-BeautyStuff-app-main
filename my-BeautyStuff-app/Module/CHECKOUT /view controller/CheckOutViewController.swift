//
//  CheckOutViewController.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 02/05/23.
//

import UIKit

class CheckOutViewController: UIViewController {
    lazy var tableView : UITableView = {
        let tableVw = UITableView()
        tableVw.translatesAutoresizingMaskIntoConstraints = false
        tableVw.backgroundColor = UIColor(named: "white")
        return tableVw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        view.backgroundColor = .white
        tableView.register(UINib(nibName: "ShoppingChartTableViewCell", bundle: nil), forCellReuseIdentifier: ShoppingChartTableViewCell.identifier)
        tableView.register(UINib(nibName: "TotalPriceTableViewCell", bundle: nil), forCellReuseIdentifier: TotalPriceTableViewCell.identifier)
        tableView.register(UINib(nibName: "CheckOutProductTableViewCell", bundle: nil), forCellReuseIdentifier: CheckOutProductTableViewCell.identifier)
    }

}; extension CheckOutViewController : UITableViewDelegate, UITableViewDataSource{
  
    func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingChartTableViewCell.identifier, for: indexPath) as? ShoppingChartTableViewCell else {return UITableViewCell()}
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TotalPriceTableViewCell", for: indexPath) as? TotalPriceTableViewCell else{
                return UITableViewCell()
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CheckOutProductTableViewCell.identifier, for: indexPath) as?
                    CheckOutProductTableViewCell else {
                return UITableViewCell()
            }
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "succesfullPaymentVC") as? SuccessfullPaymentViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
