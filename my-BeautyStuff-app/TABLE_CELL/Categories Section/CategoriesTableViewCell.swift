//
//  CategoriesTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 13/04/23.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var landingPageDelegate : LandingPageViewControllerDelegate?
   
    static let identifier = "CategoriesTableViewCell"
    
    @IBOutlet weak var sectionTitle: UILabel!
    
    @IBOutlet weak var collectionVw: UICollectionView!
    
    func setUpCollectionCell(){
//        let flowlayout = UICollectionViewFlowLayout()
//        flowlayout.scrollDirection = .vertical
//        flowlayout.itemSize = CGSize(width: 200, height: 300)
//        flowlayout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        collectionVw?.delegate = self
        collectionVw?.dataSource = self
//        collectionVw?.collectionViewLayout = flowlayout

        collectionVw?.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionVw.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as? CategoriesCollectionViewCell else {return UICollectionViewCell()}
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tes")
        self.landingPageDelegate?.navigateToProductListOfCategories()
    }
}
