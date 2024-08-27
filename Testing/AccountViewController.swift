//
//  AccountViewController.swift
//  Testing
//
//  Created by Saadet Şimşek on 27/08/2024.
//

import UIKit

class AccountViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Welcome Saadet"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen
        view.addSubview(label)
        addConstraits()
        
    }
    
    private func addConstraits(){
        NSLayoutConstraint.activate([
        
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 300),
            label.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

}
