//
//  DescriptionProductTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 29/04/23.
//

import UIKit

class DescriptionProductTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
    

   static let identifier = "DescriptionProductTableViewCell"
    
    
   
    @IBOutlet weak var descLabel: UILabel!
    
    
    @IBOutlet weak var tagsSection: UILabel!
    
   
    @IBOutlet weak var tagsBulletLabel: UILabel!
    
    @IBOutlet weak var collectionVw: UICollectionView!
    
    
    func setUpTagsCollectionCell(){
        collectionVw?.dataSource = self
        collectionVw?.delegate = self
        collectionVw?.register(UINib(nibName: "TagsOfProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: TagsOfProductCollectionViewCell.identifier)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionVw.dequeueReusableCell(withReuseIdentifier: TagsOfProductCollectionViewCell.identifier, for: indexPath) as? TagsOfProductCollectionViewCell else {
                return UICollectionViewCell()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}
