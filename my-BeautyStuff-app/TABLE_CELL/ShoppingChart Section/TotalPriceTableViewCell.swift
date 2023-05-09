//
//  TotalPriceTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 01/05/23.
//

import UIKit

class TotalPriceTableViewCell: UITableViewCell {

   static let identifier = "TotalPriceTableViewCell"
    
    @IBOutlet weak var subTotal: UILabel!
    @IBOutlet weak var subTotalLbl: UILabel!
    @IBOutlet weak var tax: UILabel!
    @IBOutlet weak var taxLbl: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var discountLbl: UILabel!
    
}
