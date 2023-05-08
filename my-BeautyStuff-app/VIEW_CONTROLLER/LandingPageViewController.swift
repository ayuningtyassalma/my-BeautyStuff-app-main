//
//  TabBarViewController.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 10/04/23.
//

import UIKit

protocol LandingPageViewControllerDelegate {
    func navigateToDetail(idProduct: Int)
    func navigateToProductListOfCategories(categoryType: String)
}

class LandingPageViewController: UIViewController, LandingPageViewControllerDelegate {
    
    
    var delegate: LandingPageViewControllerDelegate?
    var viewModel : ProductCategoryViewModel?
    var modelData : [CategoryModel]?
    var categoryIMG : [CategoryImageModel] = [CategoryImageModel(imageCategory: "blush", titleCategory: "Blush"),
                                              CategoryImageModel(imageCategory: "bronzer", titleCategory: "Bronzer"),
                                              CategoryImageModel(imageCategory: "eyebrow", titleCategory: "Eyebrow"),
                                              CategoryImageModel(imageCategory: "eyeliner", titleCategory: "Eyeliner"),
                                              CategoryImageModel(imageCategory: "eyeshadows", titleCategory: "eyeshadows"),
                                              CategoryImageModel(imageCategory: "foundation", titleCategory: "foundation"),
                                              CategoryImageModel(imageCategory: "lipliner", titleCategory: "lip liner"),
                                              CategoryImageModel(imageCategory: "lipstick", titleCategory: "lipstick"),
                                              CategoryImageModel(imageCategory: "mascara", titleCategory: "mascara"),
                                              CategoryImageModel(imageCategory: "nailpolish", titleCategory: "nail polish")
                                              
    ]
    
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
    
    

    func navigateToDetail(idProduct: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController =
        storyboard.instantiateViewController(withIdentifier: "detailProductVc") as! DetailsProductViewController
        viewController.productid = idProduct
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateToProductListOfCategories(categoryType: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CategoriesVc") as! CategoriesViewController
        viewController.categoryType = categoryType
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
    
  
    
}; extension LandingPageViewController: UITableViewDataSource, UITableViewDelegate{
  
    func setUpNavigationBar(){
        let titleLabel = UILabel()
        titleLabel.attributedText = NSAttributedString(string: "My Title", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "pink")])
//        self.navigationItem.titleView = titleLabel
        self.navigationItem.titleView = titleLabel
        
        //set icon in the left side
        

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
            cell.passingDataCategoryIMG = categoryIMG
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
            cell.callApi()
            cell.landingPageDelegate = self
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BestSellerTableViewCell.identifier, for: indexPath) as? BestSellerTableViewCell else {
                return UITableViewCell()}
            cell.callApi()
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
        case 1:
            return 120
        case 2:
            return 130
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
