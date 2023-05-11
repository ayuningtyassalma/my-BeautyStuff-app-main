//
//  DiscountTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 26/04/23.
//

import UIKit

class DiscountTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    static let identifier = "DiscountTableViewCell"
    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var seeAllProducts: UILabel!
    @IBOutlet weak var collectionVw: UICollectionView!
    
    var landingPageDelegate: LandingPageViewControllerDelegate?
    var viewModel : DiscountViewModel?
    var modelData : [ProductModel]?
    
    func callApi(){
        self.viewModel = DiscountViewModel(url: "https://makeup-api.herokuapp.com/api/v1/products.json", apiService: ApiService())
        self.viewModel?.bindTypeProduct = {modelData in
            print("tess...\(modelData)")
            if let data = modelData{
                self.modelData = data
            }
            DispatchQueue.main.async {
                self.collectionVw.reloadData()
            }
        }
        
        self.viewModel?.fetchProductData()
    }
    
    
    func setUpCollectionCell(){
        collectionVw.dataSource = self
        collectionVw.delegate = self
        
        collectionVw.register(UINib(nibName: "DiscountCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: DiscountCollectionViewCell.identifier)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelData?.count ?? 0
//        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionVw.dequeueReusableCell(withReuseIdentifier: DiscountCollectionViewCell.identifier, for: indexPath) as?
                DiscountCollectionViewCell else {
            return UICollectionViewCell()}
        let product = modelData?[indexPath.row]
//        cell.configureDisc(with: product)
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
    
//
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("tes")
        self.landingPageDelegate?.navigateToDetail(idProduct: modelData?[indexPath.row].id ?? 0)
    }
    
}
