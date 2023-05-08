//
//  ColorPalleteTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 29/04/23.
//

import UIKit

class ColorPalleteTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var urlString: String = ""
    var modelData: CategoryModel?
    var viewModel : DetailsProductViewModel?
    var productid : Int?
    static let identifier = "ColorPalleteTableViewCell"
    
    
    @IBOutlet weak var productBrand: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    
    
    @IBOutlet weak var collectionVw: UICollectionView!
    
    func callApi( idProduct: Int){
        self.viewModel = DetailsProductViewModel(urlString: "https://makeup-api.herokuapp.com/api/v1/products/\(idProduct).json", apiService: ApiService())
        self.viewModel?.bindDetailsProduct = {modelData in
            if let data = modelData{
                self.modelData = data
                print("model data testing : \(self.modelData) " )
            }
            DispatchQueue.main.async {
                self.collectionVw.reloadData()
            }
        }
        self.viewModel?.fetchDetailsProduct()
        
    }
    
    
    func setUpCollectionCell(){
        
        collectionVw.dataSource = self
        collectionVw.delegate = self
        collectionVw.register(UINib(nibName: "ColorPalleteCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ColorPalleteCollectionViewCell.identifier)
        
        if let layout = collectionVw.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionVw.dequeueReusableCell(withReuseIdentifier:ColorPalleteCollectionViewCell.identifier , for: indexPath) as? ColorPalleteCollectionViewCell else{
            return UICollectionViewCell()
        }
        print("modelData testing : \(modelData?.product_colors)")
        if let colourPallete = modelData?.product_colors{
            
            cell.configureColourPallete(colourPallete: colourPallete , indexPath: indexPath)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
