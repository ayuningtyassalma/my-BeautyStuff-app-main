//
//  RegisterTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 10/04/23.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    static let identifier = "HeaderTableViewCell"
    
    private lazy var container : UIView = {
        let cntainer = UIView()
        cntainer.translatesAutoresizingMaskIntoConstraints = false
        return cntainer
        
    }()
    private lazy var characterIMG : UIImageView = {
        let charaimg = UIImageView()
        charaimg.translatesAutoresizingMaskIntoConstraints = false
        charaimg.image = UIImage(named: "characterIMG")
        return charaimg
    }()
    private lazy var stackView : UIStackView = {
        let stckvw = UIStackView()
        stckvw.translatesAutoresizingMaskIntoConstraints = false
        stckvw.axis = .vertical
        stckvw.spacing = 4
        stckvw.alignment = .center
        stckvw.distribution = .fillEqually
        return stckvw
    }()
    
    private lazy var welcomeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "welcome back to.."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private lazy var logoIMG : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo-app")
        return image
    }()
    
    
    func setUpTableCell(){
        self.contentView.addSubview(container)
        container.addSubview(characterIMG)
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(welcomeLabel)
        stackView.addArrangedSubview(logoIMG)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 0),
            container.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            container.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: 0),
         
            characterIMG.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            characterIMG.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0),
            characterIMG.heightAnchor.constraint(equalToConstant: 160),
            characterIMG.widthAnchor.constraint(equalToConstant: 150),

            
            stackView.topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor, constant: 130),
            stackView.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: -130),
            
            logoIMG.widthAnchor.constraint(equalToConstant: 100),
            logoIMG.heightAnchor.constraint(equalToConstant: 40),
            logoIMG.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 15),
            logoIMG.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -15),

        
        ])
    }
    
    
   

}
