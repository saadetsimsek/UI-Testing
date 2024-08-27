//
//  ViewController.swift
//  Testing
//
//  Created by Saadet Şimşek on 26/08/2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Log in"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username"
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 8
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.label.cgColor
        field.leftView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: 10,
                                              height: 50))
        field.leftViewMode = .always
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 8
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.label.cgColor
        field.leftView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: 10,
                                              height: 50))
        field.leftViewMode = .always
        return field
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 8
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(button)
        
        button.addTarget(self,
                         action: #selector(didTapButton),
                         for: .touchUpInside)
        
        addConstraits()
    }
    
    @objc private func didTapButton(){
        
        guard let username = usernameField.text, let password = passwordField.text, username == "Saadet", password == "password" else{
            
            let alert = UIAlertController(title: "Invalid Login",
                                          message: "Your login creditials were incorrect. Try Again.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss",
                                          style: .cancel))
            present(alert, animated: true)
            return
        }
        
        let vc = AccountViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

    private func addConstraits(){
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 50),
            
            usernameField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            usernameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            usernameField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 20),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            button.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}

