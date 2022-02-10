//
//  ForgotPasswordVC.swift
//  Month4-HW1-Murzaliev
//
//  Created by Samat Murzaliev on 10.02.2022.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    
    private lazy var forgotLayout = UIView()
    
    private lazy var titleLogin: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.text = "Reset password"
        return view
    }()
    
    private lazy var emailField: UITextField = {
        let view = UITextField()
        view.placeholder = "Email"
        view.font = UIFont.systemFont(ofSize: 20)
        view.textColor = .black
        view.borderStyle = .roundedRect
        view.keyboardType = .emailAddress
        view.autocapitalizationType = .none
        
        return view
    }()
    
    private lazy var sendButton: UIButton = {
        let view = UIButton()
        view.setTitle("Send email", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        view.backgroundColor = .black
        view.layer.cornerRadius = 48 / 2
        view.addTarget(self, action: #selector(forgotPressed), for: .touchUpInside)

        
        return view
    }()
    
    private lazy var backButton: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .medium)
        view.textColor = .blue
        view.text = "Back"
        view.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(backPressed))
        view.addGestureRecognizer(gesture)
        
        return view
    }()
    
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        makeConstraints()

    }
    
    @objc func forgotPressed() {
        let email = emailField.text!
        var error = false
        if !email.isValidEmail {
            let alert = UIAlertController(title: "Error", message: "Enter valid email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                print("tapped")
            }))
            error = true
            present(alert,animated: true)
        }
        
        if (!error) && (userDefaults.valueExists(forKey: email)) {
            let alert = UIAlertController(title: "Success!", message: "Email verification sent. P.S. your password is \(userDefaults.value(forKey: email)!)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                print("tapped")
            }))
            error = true
            present(alert,animated: true)
        }
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    private func makeConstraints() {
        view.addSubview(forgotLayout)
        forgotLayout.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(200)
        }
        
        forgotLayout.addSubview(titleLogin)
        titleLogin.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        forgotLayout.addSubview(emailField)
        emailField.snp.makeConstraints { make in
            make.top.equalTo(titleLogin.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        forgotLayout.addSubview(sendButton)
        sendButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.bottom.equalToSuperview()
            make.height.equalTo(48)
        }
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(35)
            make.left.equalToSuperview().offset(20)
        }
        
    }

}
