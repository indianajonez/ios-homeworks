//
//  LogInViewController.swift
//  Navigation
//
//  Created by Ekaterina Saveleva on 27.03.2023.
//

import UIKit

class LogInViewController: UIViewController {

    private let notificationCenter = NotificationCenter.default
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var loginView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .green
        return view
    }()
    
    private lazy var logoImage: UIImageView = { // логотип
        let image = UIImageView(image: UIImage(named: "logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var loginText: UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.layer.backgroundColor = UIColor.systemGray6.cgColor
        login.layer.borderColor = UIColor.lightGray.cgColor
        login.layer.borderWidth = 0.5
        login.layer.cornerRadius = 10
        login.leftViewMode = .always
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        login.placeholder = "Email of phone"
        return login
    }()
    

    private lazy var loginPassword: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.textColor = .black //done
        password.layer.backgroundColor = UIColor.systemGray6.cgColor
        //password.font = UIFont.systemFont(ofSize: 16, weight: .normal)
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.borderWidth = 0.5//done
        password.layer.cornerRadius = 10//done
        password.leftViewMode = .always
        password.placeholder = "Password" //done
        //password.tintColor = accentColor
        password.autocapitalizationType = .none //done
        password.isSecureTextEntry = true //done
        password.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: 10))
        return password
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(rgb: 0x4885CC)
        button.layer.cornerRadius = 10
        button.setTitle("Log In", for: .normal)
        button.addTarget(self, action: #selector(setStatus), for: .touchUpInside)
        return button
    }()
    
    @objc private func setStatus() {
        print(loginText.text == "" ? "Not login" : loginText.text ?? "Not login")
        print(loginPassword.text == "" ? "Not password": loginPassword.text ?? "Not password")
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificationCenter.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc private func kbdShow(notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue {
            let keyboardRect = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRect.height
            
            let loginButtonBottomPointY = self.logInButton.frame.origin.y + 16
            let keyboardOriginY = self.view.frame.height - keyboardHeight
            
            let yOffset = keyboardOriginY < loginButtonBottomPointY ? loginButtonBottomPointY - keyboardOriginY + 16 : 0
            
            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }
    
    @objc private func kbdHide() {
        scrollView.contentOffset = .zero

    }
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(loginView)
        [logoImage, loginText, loginPassword, loginText, logInButton].forEach{loginView.addSubview($0)}
        let constant: CGFloat = 16
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            loginView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            loginView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            loginView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            loginView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            loginView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImage.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 100), // привязка лого к верхней части экрана , чтобы скол понимал размер вью
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            
            loginText.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            //loginText.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            loginText.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: constant),
            loginText.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -constant),
            loginText.heightAnchor.constraint(equalToConstant: 50),
            
            loginPassword.topAnchor.constraint(equalTo: loginText.bottomAnchor, constant: 0),
            //loginPassword.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            loginPassword.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: constant),
            loginPassword.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -constant),
            loginPassword.heightAnchor.constraint(equalToConstant: 50),
            
            logInButton.topAnchor.constraint(equalTo: loginPassword.bottomAnchor, constant: constant),
            //logInButton.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            logInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: constant),
            logInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -constant),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -constant) // привязка  к нижней части экрана , чтобы скрол понимал высоту окна
        ])
        
    }




}


