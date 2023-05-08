//
//  DetailsProductViewController.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 29/04/23.
//

import UIKit


class DetailsProductViewController: UIViewController  {
    

    lazy var tableView : UITableView = {
       let tableVw = UITableView()
        tableVw.translatesAutoresizingMaskIntoConstraints = false
        tableVw.backgroundColor = UIColor(named: "white")
        return tableVw
    }()
    
    
    var urlString: String = ""
    var modelData: CategoryModel?
    var viewModel : DetailsProductViewModel?
    var productid : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi(idProduct: self.productid ?? 0)
        setUpTableView()
        tableView.register(UINib(nibName: "ProductImageDetailSectionTableViewCell", bundle: nil), forCellReuseIdentifier: ProductImageDetailSectionTableViewCell.identifier)
        tableView.register(UINib(nibName: "ColorPalleteTableViewCell", bundle: nil), forCellReuseIdentifier: ColorPalleteTableViewCell.identifier)
        tableView.register(UINib(nibName: "DescriptionProductTableViewCell", bundle: nil), forCellReuseIdentifier: DescriptionProductTableViewCell.identifier)
        tableView.register(UINib(nibName: "CallToActionTableViewCell", bundle: nil), forCellReuseIdentifier: CallToActionTableViewCell.identifier)

    }
    
    func callApi( idProduct: Int){
        urlString = "https://makeup-api.herokuapp.com/api/v1/products/\(idProduct).json"
        print("urlString: \(urlString)")
        self.viewModel = DetailsProductViewModel(urlString: urlString, apiService: ApiService())
        self.viewModel?.bindDetailsProduct = {modelData in
            if let data = modelData{
                self.modelData = data
                print("model data\(modelData) " )
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        self.viewModel?.fetchDetailsProduct()
        
    }
    
    


}; extension DetailsProductViewController : UITableViewDataSource, UITableViewDelegate{
   
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
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductImageDetailSectionTableViewCell.identifier, for: indexPath) as? ProductImageDetailSectionTableViewCell else{
                return UITableViewCell()
            }
            cell.productIMG.sd_setImage(with: URL(string: modelData?.image_link ?? ""))
            return cell
        case 1:
                        guard let cell = tableView.dequeueReusableCell(withIdentifier: ColorPalleteTableViewCell.identifier, for: indexPath)as? ColorPalleteTableViewCell else {
                return UITableViewCell()
            }
            cell.productBrand.text = modelData?.brand
            cell.productPrice.text = modelData?.price
            cell.modelData = modelData
            cell.productid = productid
            cell.setUpCollectionCell()
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionProductTableViewCell.identifier, for: indexPath) as? DescriptionProductTableViewCell else{
                return UITableViewCell()
            }
            cell.descLabel.text = modelData?.description
            cell.setUpTagsCollectionCell()
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CallToActionTableViewCell.identifier, for: indexPath) as? CallToActionTableViewCell else {
                return UITableViewCell()
            }
            return cell
        default:
        break
        }
        
       return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 300
        case 1:
            return 150
        case 2:
            return 320
        case 3:
            return UITableView.automaticDimension
        default:
            break
        }
        return 300
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 300
        case 1:
            return 150
        case 2:
            return 320
        case 3:
            return UITableView.automaticDimension
        default:
            break
        }
        return 300
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(identifier: "CheckOutViewController") as? CheckOutViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
