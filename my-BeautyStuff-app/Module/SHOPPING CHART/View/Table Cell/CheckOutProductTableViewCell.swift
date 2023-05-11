//
//  CheckOutProductTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 02/05/23.
//

import UIKit

class CheckOutProductTableViewCell: UITableViewCell {

   static let identifier = "CheckOutProductTableViewCell"
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var checkoutBtn: UIButton!{
        didSet{
            checkoutBtn.layer.cornerRadius = 15
            checkoutBtn.clipsToBounds = true
        }
    }
    
}
