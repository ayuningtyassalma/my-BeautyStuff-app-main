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
            categoriesIMG.layer.cornerRadius = categoriesIMG.frame.width/2
            categoriesIMG.clipsToBounds = true
        }
    }
    
    
}
