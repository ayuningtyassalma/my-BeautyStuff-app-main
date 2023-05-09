//
//  CategoriesCollectionViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 13/04/23.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

   
    static let identifier = "CategoriesCollectionViewCell"

    @IBOutlet weak var categoriesIMG: UIImageView!{
        didSet{
            categoriesIMG.layer.cornerRadius = 15
            categoriesIMG.clipsToBounds = true
        }
    }
    @IBOutlet weak var categoryTitle: UILabel!
    
    
}
