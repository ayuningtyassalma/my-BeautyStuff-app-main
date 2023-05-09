//
//  ListOfProductCategoriesTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 04/05/23.
//

import UIKit
import SDWebImage

class ListOfProductCategoriesTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   static let identifier = "ListOfProductCategoriesTableViewCell"
    
    @IBOutlet weak var collectionVw: UICollectionView!
    var viewModel : ProductCategoryViewModel?
    var modelData : [CategoryModel]?
    
    func setUpCollectionCell(){
        collectionVw.dataSource = self
        collectionVw.delegate = self

        collectionVw.register(UINib(nibName: "DiscountCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: DiscountCollectionViewCell.identifier)
    }
    
    
    func callApi(for productType: String){
        let urlString = "https://makeup-api.herokuapp.com/api/v1/products.json?product_type=\(productType)"
        print("urlString List: \(urlString)")
        
        self.viewModel = ProductCategoryViewModel(urlString: urlString, apiService: ApiService())
        self.viewModel?.bindTypeProductCategory = {modelData in
            print("tes.. \(modelData)")
            if let data = modelData{
                self.modelData = data
               
            }
            DispatchQueue.main.async {
                self.collectionVw.reloadData()
            }
        }
        
        self.viewModel?.fetchDataCategory()
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelData?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionVw.dequeueReusableCell(withReuseIdentifier: DiscountCollectionViewCell.identifier, for: indexPath) as?
                DiscountCollectionViewCell else {return UICollectionViewCell()}
        let product = modelData?[indexPath.row]
        cell.configureDisc(with: product)
//        if let passingData = modelData{
//            cell.productIMG.sd_setImage(with: URL(string: passingData[indexPath.row].image_link ), completed: nil)
//            cell.productTitle.text = passingData[indexPath.row].brand
//            cell.productSubtitle.text = passingData[indexPath.row].name
//            cell.productPrice.text = "\(String(describing: passingData[indexPath.row].price))"
//        }
        if let passingData = modelData {
            cell.configureDisc(with: modelData?[indexPath.row])
        }
        
       
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 350)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        if let vc = storyboard.instantiateViewController(identifier: "CheckOutViewController") as? CheckOutViewController {
//            navigationController?.pushViewController(vc, animated: true)
//        }
//    }
    
}
