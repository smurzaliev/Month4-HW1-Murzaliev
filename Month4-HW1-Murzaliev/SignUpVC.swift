//
//  SignUpVC.swift
//  Month4-HW1-Murzaliev
//
//  Created by Samat Murzaliev on 10.02.2022.
//

import UIKit
import SnapKit

class SignUpVC: UIViewController {
    
    private var signUpLayout = UIView()
    
    private lazy var logo: UIImageView = {
       let image = UIImageView(image: UIImage(named: "logo"))
        return image
    }()
    
    private var signUpLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.text = "Sign up to Telegram"
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
    
    private lazy var passwordField: UITextField = {
        let view = UITextField()
        view.placeholder = "Password"
        view.isSecureTextEntry = true
        view.font = UIFont.systemFont(ofSize: 20)
        view.textColor = .black
        view.borderStyle = .roundedRect

        
        return view
    }()
    
    private lazy var passwordField2: UITextField = {
        let view = UITextField()
        view.placeholder = "Re-type password"
        view.isSecureTextEntry = true
        view.font = UIFont.systemFont(ofSize: 20)
        view.textColor = .black
        view.borderStyle = .roundedRect

        
        return view
    }()
    
    private lazy var loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("Sign Up", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        view.backgroundColor = .black
        view.layer.cornerRadius = 48 / 2
        view.addTarget(self, action: #selector(singUpPressed), for: .touchUpInside)
        
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
    
    var userDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeConstraints()
        
    }
    
    @objc func singUpPressed() {
        
        let username = emailField.text!
        let password = passwordField.text!
        let passwordAgain = passwordField2.text!
        var error = false
        
        if !username.isValidEmail {
            let alert = UIAlertController(title: "Error", message: "Please enter valid email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                print("tapped")
            }))
            
            present(alert,animated: true)
            error = true
            
        }
        
        if password != passwordAgain {
            let alert = UIAlertController(title: "Error", message: "passwords do not match", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                print("tapped")
            }))
            
            present(alert,animated: true)
            error = true

            
        }
        
        if password.count > 9 {
            
            let alert = UIAlertController(title: "Error", message: "password must be at least 8 charachters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                print("tapped")
            }))
            
            present(alert,animated: true)
            error = true

            
        }
        
        if userDefaults.valueExists(forKey: username) {
            let alert = UIAlertController(title: "Error", message: "Email already registered", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                print("tapped")
            }))
            
            present(alert,animated: true)
            error = true

            
        }
        
        if !error {
            userDefaults.set(password, forKey: username)
            
            let alert = UIAlertController(title: "Success!", message: "New user registered", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                self.navigationController?.popViewController(animated: true)

            }))
            
            present(alert,animated: true)
            

            
        }
        

        
        
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    
    private func makeConstraints() {
        
        view.addSubview(signUpLayout)
        signUpLayout.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(290)
        }
        
        signUpLayout.addSubview(signUpLabel)
        signUpLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            
        }
        
        signUpLayout.addSubview(emailField)
        emailField.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        signUpLayout.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        signUpLayout.addSubview(passwordField2)
        passwordField2.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        signUpLayout.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.bottom.equalToSuperview()
            make.height.equalTo(48)
        }
        
        view.addSubview(logo)
        logo.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(60)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(signUpLabel.snp.top).offset(-30)
        }
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(35)
            make.left.equalToSuperview().offset(20)
        }
    }
    
}

extension UserDefaults {

    func valueExists(forKey key: String) -> Bool {
        return object(forKey: key) != nil
    }

}

extension String {
   var isValidEmail: Bool {
      let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
      return testEmail.evaluate(with: self)
   }
}
