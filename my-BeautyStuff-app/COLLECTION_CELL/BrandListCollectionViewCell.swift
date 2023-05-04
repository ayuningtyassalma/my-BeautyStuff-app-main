//
//  BrandListCollectionViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 13/04/23.
//

import UIKit

class BrandListCollectionViewCell: UICollectionViewCell {
    static let identifier = "BrandListCollectionViewCell"

  
    @IBOutlet weak var brandsContainer: UIView!{
        didSet{
            
            //shadow
//            brandsContainer.layer.shadowColor = UIColor.black.cgColor
//            brandsContainer.layer.shadowOpacity = 0.3
//            brandsContainer.layer.shadowOffset = CGSize(width: 1.5, height: 1.5);         brandsContainer.layer.shadowRadius = 0.5
//            brandsContainer.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
            
            
            //corner radius
            brandsContainer.layer.cornerRadius = 10
            brandsContainer.layer.masksToBounds = true
            brandsContainer.clipsToBounds = false
       
            
        }
    }
    
    @IBOutlet weak var brandsName: UILabel!
    
}
