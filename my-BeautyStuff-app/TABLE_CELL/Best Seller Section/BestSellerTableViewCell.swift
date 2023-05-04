//
//  BestSellerTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 26/04/23.
//

import UIKit

class BestSellerTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

   static let identifier = "BestSellerTableViewCell"
    
    @IBOutlet weak var sectionTitle: UILabel!
    
    @IBOutlet weak var allProducts: UILabel!
    
    
    @IBOutlet weak var collectionVw: UICollectionView!
    
    func setUpCollectionCell(){
        collectionVw.dataSource = self
        collectionVw.delegate = self
        collectionVw.register(UINib(nibName: "DiscountCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: DiscountCollectionViewCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionVw.dequeueReusableCell(withReuseIdentifier: DiscountCollectionViewCell.identifier, for: indexPath) as? DiscountCollectionViewCell else {
            return UICollectionViewCell()}
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
