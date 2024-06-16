//
//  ViewController.swift
//  uikit-playground
//
//  Created by dgsw8th71 on 3/11/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디를 입력해주세요"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.innerPadding(for: .horizontal, width: 12)
        return textField
    }()
    
    private let pwTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.isSecureTextEntry = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.innerPadding(for: .horizontal, width: 12)
        return textField
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "로그인"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let submitButton: UIButton = {
        let buttonConfiguration = UIButton.Configuration.filled()
        let button = UIButton(configuration: buttonConfiguration)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle("로그인", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(idTextField)
        view.addSubview(pwTextField)
        view.addSubview(submitButton)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            label.heightAnchor.constraint(equalToConstant: 20),
            idTextField.topAnchor.constraint(equalTo: label.safeAreaLayoutGuide.topAnchor, constant: 32),
            idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            idTextField.heightAnchor.constraint(equalToConstant: 48),
            pwTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 8),
            pwTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pwTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pwTextField.heightAnchor.constraint(equalToConstant: 48),
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            submitButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}
