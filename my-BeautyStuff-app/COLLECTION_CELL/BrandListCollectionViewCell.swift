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
            brandsContainer.layer.cornerRadius = 10
            brandsContainer.layer.masksToBounds = true
            brandsContainer.clipsToBounds = false
        }
    }
    
    @IBOutlet weak var brandsName: UILabel!
    
}
