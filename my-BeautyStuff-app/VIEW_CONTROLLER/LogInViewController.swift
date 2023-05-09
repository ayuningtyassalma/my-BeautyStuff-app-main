//
//  LogInViewController.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 10/04/23.
//

import UIKit

class LogInViewController: UIViewController, LoginTableViewCellDelegate{
func loginTableViewCellDidTapLoginButton(_ cell: LoginTableViewCell) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "ProfileViewController")
    navigationController?.pushViewController(vc, animated: true)
    }
    
    
    lazy var tableView : UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = UIColor(named: "pink")
        tableview.register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.identifier)
        tableview.register(LoginTableViewCell.self, forCellReuseIdentifier: LoginTableViewCell.identifier)
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        view.backgroundColor = UIColor(named: "pink")
    }
    
}; extension LogInViewController : UITableViewDataSource, UITableViewDelegate{
    func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
             tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
             tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
             tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
                                    
                                    
            ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1:
         return 1
        default:
            return 1
        }
      
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier, for: indexPath) as? HeaderTableViewCell else{
                return UITableViewCell()
            }
            cell.setUpTableCell()
            cell.backgroundColor = UIColor(named: "pink")
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LoginTableViewCell.identifier, for: indexPath) as? LoginTableViewCell else {return UITableViewCell()}
           
            
            cell.setUpLoginTableCell()
            cell.delegate = self
            cell.backgroundColor = UIColor(named: "pink")
            return cell
        default:
            break
        }
       return UITableViewCell()
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("tes")
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let vc = storyboard.instantiateViewController(identifier: "LandingPageVc") as? LandingPageViewController {
//            navigationController?.pushViewController(vc, animated: true)
//        }
//    }
//
    
    
}
