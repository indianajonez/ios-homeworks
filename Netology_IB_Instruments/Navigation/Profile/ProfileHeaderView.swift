//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Ekaterina Saveleva on 19.03.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let avatarImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "HipstaCat"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor // Создали аватарку
        image.clipsToBounds = true
        return image
    }()
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // обязательно false если используешь констрейнты
        label.text = "Hipster Cat"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.textColor = .black
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.placeholder = "Write your status..."
        return textField
    }()
    
    
    let statusLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting for something..."
        label.textColor = .systemGray
        //label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let setStatusButtom: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.layer.cornerRadius = 4
        button.layer.backgroundColor = UIColor.blue.cgColor
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(setStatus), for: .touchUpInside)
        return button
    }()
    
    @objc private func setStatus() {
        statusLabel.text = statusTextField.text
        print(statusLabel.text ?? "NOT")
    }
    
    private lazy var simpleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Simple button", for: .normal)
        button.layer.backgroundColor = UIColor.blue.cgColor
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(setStatus), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [avatarImage, fullNameLabel, statusLabel, statusTextField, setStatusButtom, simpleButton].forEach{addSubview($0)} // добавили аватарку на вью
        layout() // закрепили аватарку на вью
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented") 
    }
    
    private func layout() {
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImage.widthAnchor.constraint(equalToConstant: 100),
            avatarImage.heightAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 16),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            setStatusButtom.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 20),
            setStatusButtom.heightAnchor.constraint(equalToConstant: 40),
            setStatusButtom.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButtom.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            simpleButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            simpleButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            simpleButton.heightAnchor.constraint(equalToConstant: 40),
            simpleButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}


