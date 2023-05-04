//
//  BannerTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 11/04/23.
//

import UIKit

class BannerTableViewCell: UITableViewCell {
    static let identifier = "BannerTableviewCell"
    
    private lazy var container : UIView = {
        let cntainer = UIView()
        cntainer.translatesAutoresizingMaskIntoConstraints = false
        cntainer.layer.borderColor = UIColor.black.cgColor
        cntainer.layer.borderWidth = 0.5
        cntainer.layer.cornerRadius = 20
        cntainer.layer.masksToBounds = true
        return cntainer
    }()
    
    private lazy var bannerIMG : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "banner")
        return img
    }()
    
    
    func setUpBannerTableViewCell(){
        self.contentView.addSubview(container)
        container.addSubview(bannerIMG)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            container.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            container.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            container.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            
            bannerIMG.topAnchor.constraint(equalTo: container.topAnchor, constant: 0),
            bannerIMG.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0), bannerIMG.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 0), bannerIMG.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0),
        ])
    }
    

}
