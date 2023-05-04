//
//  HeaderRegisterTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 03/05/23.
//

import UIKit

class HeaderRegisterTableViewCell: UITableViewCell {

    static let identifier = "HeaderRegisterTableViewCell"

    private lazy var container : UIView = {
        let cntainer = UIView()
        cntainer.translatesAutoresizingMaskIntoConstraints = false
        return cntainer
    }()
    
    
    private lazy var characterIMG : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "characterIMG")
        return img
    }()
    
    private lazy var stackView : UIStackView = {
        let stackVw = UIStackView()
        stackVw.axis = .vertical
        stackVw.translatesAutoresizingMaskIntoConstraints = false
        stackVw.spacing = 4
        stackVw.alignment = .center
        stackVw.distribution = .fillEqually
        return stackVw
    }()
    
    private lazy var greeting : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hi There..."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    private lazy var logoIMG: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo-app")
        image.layer.borderColor = UIColor.red.cgColor
        image.layer.borderWidth = 1
        return image
    }()
    
    func setUpTableCell(){
        self.contentView.addSubview(container)
        container.addSubview(characterIMG)
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(greeting)
        stackView.addArrangedSubview(logoIMG)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 0),
            container.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            container.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            characterIMG.topAnchor.constraint(equalTo: container.topAnchor, constant: 0),
            characterIMG.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0),
            characterIMG.heightAnchor.constraint(equalToConstant: 160),
            characterIMG.widthAnchor.constraint(equalToConstant: 150),
            
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 130),
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 50),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -130),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -50),
            
            
            
            logoIMG.widthAnchor.constraint(equalToConstant: 105),
            logoIMG.heightAnchor.constraint(equalToConstant: 40),
            
            logoIMG.topAnchor.constraint(equalTo: greeting.topAnchor , constant: 50),
            logoIMG.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -50)
            
            ])
    }
}
