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
    
    
    func setUpCollectionCell(){
        collectionVw.dataSource = self
        collectionVw.delegate = self
        
        collectionVw.register(UINib(nibName: "DiscountCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: DiscountCollectionViewCell.identifier)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionVw.dequeueReusableCell(withReuseIdentifier: DiscountCollectionViewCell.identifier, for: indexPath) as?
                DiscountCollectionViewCell else {
            return UICollectionViewCell()}
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
        self.landingPageDelegate?.navigateToDetail()
    }
    
}
