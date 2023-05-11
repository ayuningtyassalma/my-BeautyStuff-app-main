//
//  RegisterViewController.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 03/05/23.
//

import UIKit

class RegisterViewController: UIViewController {

    lazy var tableView : UITableView = {
        let tableVw = UITableView()
        tableVw.translatesAutoresizingMaskIntoConstraints = false
        tableVw.backgroundColor = UIColor(named: "pink")
        tableVw.register(HeaderRegisterTableViewCell.self, forCellReuseIdentifier: HeaderRegisterTableViewCell.identifier)
        tableVw.register(RegisterTableViewCell.self, forCellReuseIdentifier: RegisterTableViewCell.identifier)

        return tableVw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        view.backgroundColor = UIColor(named: "pink")
    }
    

};extension RegisterViewController: UITableViewDelegate, UITableViewDataSource{
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
            
                                    
                                    
                                    ])
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1:
            return 1
        default:
            break
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderRegisterTableViewCell.identifier, for: indexPath) as? HeaderRegisterTableViewCell else {
                return UITableViewCell()
            }
            cell.backgroundColor = UIColor(named: "pink")
            cell.setUpTableCell()
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterTableViewCell.identifier, for: indexPath) as? RegisterTableViewCell else{
                return UITableViewCell()
            }
            cell.backgroundColor = UIColor(named: "pink")
            cell.setUpLoginTableCell()
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 250
        case 1:
            return UITableView.automaticDimension
        default:
            break
        }
        return 100
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0,1:
            return UITableView.automaticDimension
        default:
            break
        }
        return 100
    }
}
