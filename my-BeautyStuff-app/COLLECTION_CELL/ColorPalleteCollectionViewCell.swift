//
//  ColorPalleteCollectionViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 29/04/23.
//

import UIKit

class ColorPalleteCollectionViewCell: UICollectionViewCell {

    static let identifier = "ColorPalleteCollectionViewCell"

    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var collorPallete: UIImageView!{
        didSet{
            collorPallete.layer.cornerRadius = collorPallete.frame.width/2
            collorPallete.clipsToBounds = true
            collorPallete.backgroundColor = UIColor(named: "pink")
        }
    }
    
    @IBOutlet weak var collorpalleteLabel: UILabel!
    var modelData : CategoryModel?
    func configureColourPallete(colourPallete: [Colors]?, indexPath: IndexPath){
        print("colourPallete inside collectionCell: \(colourPallete)")
        collorpalleteLabel.text = colourPallete?[indexPath.row].colour_name
}
}
