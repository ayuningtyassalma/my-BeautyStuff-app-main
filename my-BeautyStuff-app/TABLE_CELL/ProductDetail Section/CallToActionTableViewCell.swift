//
//  CallToActionTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 29/04/23.
//

import UIKit

class CallToActionTableViewCell: UITableViewCell {

  static let identifier = "CallToActionTableViewCell"
    
   
    @IBOutlet weak var buyNowBtn: UIButton!{
        didSet{
            buyNowBtn.layer.cornerRadius = 15
            buyNowBtn.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var addToWishlistBtn: UIButton!{
        didSet{
            addToWishlistBtn.layer.cornerRadius = 15
            addToWishlistBtn.clipsToBounds = true
        }
    }
    
    

    
    
}
