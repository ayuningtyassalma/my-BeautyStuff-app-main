//
//  CategoriesTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 13/04/23.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var landingPageDelegate : LandingPageViewControllerDelegate?
    var passingDataCategoryIMG : [CategoryImageModel]?
    var categoryType: String = ""
   
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
        if let layout = collectionVw.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: 200, height: 200)
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionVw.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as? CategoriesCollectionViewCell else {return UICollectionViewCell()
            
        }
        if let assignData = passingDataCategoryIMG{
            cell.categoriesIMG.image = UIImage(named:"\(assignData[indexPath.row].imageCategory)")
            cell.categoryTitle.text = assignData[indexPath.row].titleCategory 
            
        } else{
            print("no data")
        }
        
    
     
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 95)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tes")
        
        if indexPath.item == 0 {
            categoryType = "blush"
        } else if indexPath.item == 1 {
            categoryType = "bronzer"
        } else if indexPath.item == 2 {
            categoryType = "eyebrow"
        } else if indexPath.item == 3 {
            categoryType = "eyeliner"
        } else if indexPath.item == 4 {
            categoryType = "eyeshadow"
        } else if indexPath.item == 5 {
            categoryType = "foundation"
        } else if indexPath.item == 6 {
            categoryType = "lip_liner"
        } else if indexPath.item == 7 {
            categoryType = "lipstick"
        } else if indexPath.item == 8 {
            categoryType = "mascara"
        } else {
            categoryType = "nail_polish"
        }
        
        self.landingPageDelegate?.navigateToProductListOfCategories(categoryType: categoryType)
    }
}
