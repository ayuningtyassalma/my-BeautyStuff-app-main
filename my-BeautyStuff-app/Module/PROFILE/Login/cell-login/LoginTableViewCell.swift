//
//  LoginTableViewCell.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 11/04/23.
//

import UIKit
import Firebase

protocol LoginTableViewCellDelegate: AnyObject{
    func loginTableViewCellDidTapLoginButton(_ cell: LoginTableViewCell)
}

class LoginTableViewCell: UITableViewCell {
static let identifier = "LoginTableViewCell"
    weak var delegate: LoginTableViewCellDelegate?
    private lazy var stackView : UIStackView = {
        let stckvw = UIStackView()
        stckvw.translatesAutoresizingMaskIntoConstraints = false
        stckvw.axis = .vertical
        stckvw.spacing = 5
        stckvw.alignment = .center
        stckvw.distribution = .fillEqually
//        stckvw.layer.borderColor = UIColor.black.cgColor
//        stckvw.layer.borderWidth = 1
        return stckvw
    }()
    
    private lazy var usernameLbl : UILabel = {
        let username = UILabel()
//        username.translatesAutoresizingMaskIntoConstraints = false
        username.text = "Username/Email"
        username.font = .systemFont(ofSize: 16, weight: .semibold)
        username.textColor = .white
        username.textAlignment = .left
        username.numberOfLines = 0
        return username
    }()
    
    private lazy var passwordLbl : UILabel = {
        let password = UILabel()
        password.text = "Password"
        password.textColor = .white
        password.font = .systemFont(ofSize: 16, weight: .semibold)
        password.translatesAutoresizingMaskIntoConstraints = false
        password.numberOfLines = 0
        return password
    }()
    
    private lazy var insertUsername : UITextField = {
        let username = UITextField()
        username.translatesAutoresizingMaskIntoConstraints = false
        username.backgroundColor = UIColor(named: "grey-fortextfield")
        username.layer.cornerRadius = 15.0
        return username
    }()
    
    private lazy var insertPassword : UITextField = {
        let password = UITextField()
        password.layer.cornerRadius = 15.0
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = UIColor(named: "grey-fortextfield")
        
        return password
    }()
    
    private lazy var Loginbtn : UIButton = {
        let login = UIButton()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.setTitle("Sign In", for: .normal)
        login.layer.cornerRadius = 15.0
        login.layer.borderWidth = 1
        login.backgroundColor = UIColor(named: "brown-forInputButton")

        login.addTarget(self, action: #selector(loginBtnTapped(_:)), for: .touchUpInside)
        
        return login
    }()
    
    
    
     @objc func loginBtnTapped(_ sender:Any){
        
         guard let email = insertUsername.text else { return }
             guard let password = insertPassword.text else{ return }
         delegate?.loginTableViewCellDidTapLoginButton(self)
     }
    
    

    
    private lazy var forgotPassLbl : UILabel = {
        let username = UILabel()
//        username.translatesAutoresizingMaskIntoConstraints = false
        username.text = "Forgot Password?"
        username.textColor = .white
        username.font = .systemFont(ofSize: 20, weight: .semibold)
        username.numberOfLines = 0
        return username
    }()
    
    
    private lazy var dontHaveAccLbl : UILabel = {
        let username = UILabel()
//        username.translatesAutoresizingMaskIntoConstraints = false
        username.text = "Doesn't have an account?"
        username.textColor = UIColor(named: "brown-forinputButton")
        username.numberOfLines = 0
        username.font = .systemFont(ofSize: 12, weight: .semibold)
        return username
    }()
    
    private lazy var signUpLbl : UILabel = {
        let username = UILabel()
//        username.translatesAutoresizingMaskIntoConstraints = false
        username.text = "Sign Up"
        username.textColor = .white
        username.numberOfLines = 0
        username.font = .systemFont(ofSize: 20, weight: .semibold)
        return username
    }()
    
    func setUpLoginTableCell(){
        self.contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(usernameLbl)
        stackView.addArrangedSubview(insertUsername)
        stackView.addArrangedSubview(passwordLbl)
        stackView.addArrangedSubview(insertPassword)
        stackView.addArrangedSubview(Loginbtn)
        stackView.addArrangedSubview(forgotPassLbl)
        stackView.addArrangedSubview(dontHaveAccLbl)
        stackView.addArrangedSubview(signUpLbl)


        NSLayoutConstraint.activate([                                    
                                     stackView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 0),
                                     stackView.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 0),
                                     stackView.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: 0),
                                     stackView.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: 0),
                                     usernameLbl.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor, constant: 28),
                                     usernameLbl.trailingAnchor.constraint(lessThanOrEqualTo: stackView.safeAreaLayoutGuide.trailingAnchor, constant: -50),
                                     passwordLbl.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor, constant: 28),
                                     passwordLbl.trailingAnchor.constraint(lessThanOrEqualTo: stackView.safeAreaLayoutGuide.trailingAnchor, constant: -50),
                                     insertUsername.heightAnchor.constraint(equalToConstant: 42),
                                     insertUsername.widthAnchor.constraint(equalToConstant: 350),
                                     insertPassword.heightAnchor.constraint(equalToConstant: 42),
                                     insertPassword.widthAnchor.constraint(equalToConstant: 350),
                                     Loginbtn.heightAnchor.constraint(equalToConstant: 42),
                                     Loginbtn.widthAnchor.constraint(equalToConstant: 350),
//                                     Loginbtn.topAnchor.constraint(greaterThanOrEqualTo: insertPassword.safeAreaLayoutGuide.bottomAnchor, constant: 55),
//                                     Loginbtn.bottomAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.bottomAnchor, constant: -15)
                                     
                                     
                                     
                                    ])
        
        
    }
    
    
}
