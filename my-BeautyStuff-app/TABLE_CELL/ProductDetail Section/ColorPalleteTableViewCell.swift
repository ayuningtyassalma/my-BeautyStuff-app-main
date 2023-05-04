//
//  ColorPalleteTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 29/04/23.
//

import UIKit

class ColorPalleteTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    static let identifier = "ColorPalleteTableViewCell"
    
    
    @IBOutlet weak var productBrand: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    
    
    @IBOutlet weak var collectionVw: UICollectionView!
    
    
    
    
    func setUpCollectionCell(){
        
        collectionVw.dataSource = self
        collectionVw.delegate = self
        collectionVw.register(UINib(nibName: "ColorPalleteCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ColorPalleteCollectionViewCell.identifier)
        
        if let layout = collectionVw.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionVw.dequeueReusableCell(withReuseIdentifier:ColorPalleteCollectionViewCell.identifier , for: indexPath) as? ColorPalleteCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
