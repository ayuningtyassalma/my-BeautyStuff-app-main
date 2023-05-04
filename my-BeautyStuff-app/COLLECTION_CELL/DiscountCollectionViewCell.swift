//
//  DiscountCollectionViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 13/04/23.
//

import UIKit

class DiscountCollectionViewCell: UICollectionViewCell {

    static let identifier = "DiscountCollectionViewCell"
    
    
    @IBOutlet weak var productIMG: UIImageView!
    
    @IBOutlet weak var productTitle: UILabel!
    
    
    @IBOutlet weak var productSubtitle: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    
    
    @IBOutlet weak var addTochartButton: UIButton!
    
    
    @IBOutlet weak var container: UIView!
}
