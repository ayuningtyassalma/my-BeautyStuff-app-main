//
//  ShoppingChartTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 01/05/23.
//

import UIKit

class ShoppingChartTableViewCell: UITableViewCell {

    static let identifier = "ShoppingChartTableViewCell"
    
    @IBOutlet weak var productIMG: UIImageView!{
        didSet{
            productIMG.layer.cornerRadius = 15
            productIMG.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var trashIcon: UIImageView!
    
}
