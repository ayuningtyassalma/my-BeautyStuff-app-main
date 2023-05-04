//
//  BrandListTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 13/04/23.
//

import UIKit

class BrandListTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    static let identifier = "BrandListTableViewCell"
    
    @IBOutlet weak var sectionTitle: UILabel!
    
    @IBOutlet weak var collectionVw: UICollectionView!
    
    func setUpCollectionCell(){
        collectionVw?.dataSource = self
        collectionVw?.delegate = self
        
        collectionVw?.register(UINib(nibName: "BrandListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: BrandListCollectionViewCell.identifier)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionVw.dequeueReusableCell(withReuseIdentifier: BrandListCollectionViewCell.identifier, for: indexPath) as? BrandListCollectionViewCell else {return UICollectionViewCell()}
            return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 37)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    
}
