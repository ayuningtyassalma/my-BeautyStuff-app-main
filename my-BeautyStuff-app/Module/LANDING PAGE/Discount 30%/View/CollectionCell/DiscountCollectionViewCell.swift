//
//  DiscountCollectionViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 13/04/23.
//

import UIKit
import SDWebImage

class DiscountCollectionViewCell: UICollectionViewCell {

    static let identifier = "DiscountCollectionViewCell"
    
    @IBOutlet weak var productIMG: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productSubtitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var addTochartButton: UIButton!{
        didSet{
            addTochartButton.layer.cornerRadius = 15
            addTochartButton.clipsToBounds = true
        }
    }
    @IBOutlet weak var container: UIView!
    func configureDisc(with product: ProductModel?) {
        productIMG.sd_setImage(with: URL(string: product?.image_link ?? ""))
        productTitle.text = product?.brand
        productSubtitle.text = product?.name
        productPrice.text = product?.price
    }
}
