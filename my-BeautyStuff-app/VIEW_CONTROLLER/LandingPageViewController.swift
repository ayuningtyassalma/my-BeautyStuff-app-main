//
//  TabBarViewController.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 10/04/23.
//

import UIKit

protocol LandingPageViewControllerDelegate {
    func navigateToDetail()
    func navigateToProductListOfCategories()
}

class LandingPageViewController: UIViewController, LandingPageViewControllerDelegate {
    
    
    var delegate: LandingPageViewControllerDelegate?
    func navigateToDetail() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "detailProductVc")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateToProductListOfCategories() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CategoriesVc")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    

    lazy var tableView : UITableView = {
        let tablevw = UITableView()
        tablevw.translatesAutoresizingMaskIntoConstraints = false
//        tablevw.rowHeight = UITableView.automaticDimension
//        tablevw.estimatedRowHeight = 4
        tablevw.separatorStyle = .none
        tablevw.backgroundColor = UIColor(named: "white")
        tablevw.register(BannerTableViewCell.self, forCellReuseIdentifier: BannerTableViewCell.identifier)
        return tablevw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        view.backgroundColor = .white
    
        
        setUpTableView()
        setUpNavigationBar()
        tableView.register(UINib(nibName: "BrandListTableViewCell", bundle: nil), forCellReuseIdentifier: BrandListTableViewCell.identifier)
        tableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: CategoriesTableViewCell.identifier)
        tableView.register(UINib(nibName: "DiscountTableViewCell", bundle: nil), forCellReuseIdentifier: DiscountTableViewCell.identifier)
        tableView.register(UINib(nibName: "BestSellerTableViewCell", bundle: nil), forCellReuseIdentifier: BestSellerTableViewCell.identifier)
    }
    
}; extension LandingPageViewController: UITableViewDataSource, UITableViewDelegate{
  
    func setUpNavigationBar(){
        let navbar : UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 64.0))
        self.view.addSubview(navbar)
        let navItem = UINavigationItem(title: "My Beauty Stuff")
        navbar.setItems([navItem], animated: true)
    }
    

    
//    func setUpLeftButtonNavBar(){
//        //hamburger menu
//        let hamburgerMenu = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
//        self.navigationItem.leftBarButtonItem = hamburgerMenu
//    }
    
    func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ]
            )
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.identifier, for: indexPath) as? BannerTableViewCell else { return UITableViewCell()}
            cell.setUpBannerTableViewCell()
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.identifier, for: indexPath) as? CategoriesTableViewCell else {
                return UITableViewCell()}
            print(cell)
            cell.setUpCollectionCell()
            cell.landingPageDelegate = self
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BrandListTableViewCell.identifier, for: indexPath) as?
                    BrandListTableViewCell else {return UITableViewCell()}
            cell.setUpCollectionCell()
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DiscountTableViewCell.identifier, for: indexPath) as? DiscountTableViewCell else {
                return UITableViewCell()}
            cell.setUpCollectionCell()
            cell.landingPageDelegate = self
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BestSellerTableViewCell.identifier, for: indexPath) as? BestSellerTableViewCell else {
                return UITableViewCell()}
            cell.setUpCollectionCell()
            return cell
        default:
            break
        }
        return UITableViewCell()
    
     
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UITableView.automaticDimension
        case 1,2:
            return 200
        case 3,4 :
            return 375
        default:
            break
        }
        return 300
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UITableView.automaticDimension
        case 1:
            return 200
        case 2:
            return UITableView.automaticDimension
        case 3,4:
            return 375
        default:
            break
        }
        return 300
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1,2,3,4 :
            return 1
        default:
            break
        }
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
}
