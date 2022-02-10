//
//  ViewController.swift
//  Month4-HW1-Murzaliev
//
//  Created by Samat Murzaliev on 10.02.2022.
//

import UIKit
import SnapKit


class EntranceVC: UIViewController {
    
    private lazy var loginLayout = UIView()
    
    private lazy var logo: UIImageView = {
       let image = UIImageView(image: UIImage(named: "logo"))
        return image
    }()
    
    private lazy var titleLogin: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.text = "Login to Telegram"
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
    
    private lazy var loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("Login", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        view.backgroundColor = .black
        view.layer.cornerRadius = 48 / 2
        view.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)

        return view
    }()
    
    private lazy var forgotPassword: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .medium)
        view.textColor = .gray
        view.text = "Forgot password?"
        
        view.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(forgotAction))
        view.addGestureRecognizer(gesture)
        
        return view
    }()
    
    private lazy var userAgreement: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 12, weight: .light)
        view.textColor = .black
        view.text = "Please read carefully through user experience agreement. Whenever you login into our system you automatically agree with all terms provided."
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var signUp: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .medium)
        view.textColor = .blue
        view.text = "Sign Up"
        view.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(signUpAction(view:)))
        view.addGestureRecognizer(gesture)
        
        return view
    }()
    
    private lazy var helpButton: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .medium)
        view.textColor = .blue
        view.text = "Help"
        view.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(helpAction))
        view.addGestureRecognizer(gesture)
        
        return view
    }()

    let userDefaults = UserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        makeConstraints()
    }
    
    @objc func helpAction() {
        navigationController?.pushViewController(HelpVC(), animated: true)

    }

    @objc func loginPressed(view: UILabel) {
        let email = emailField.text!
        let password = passwordField.text!
        var error = false
        
        
        if !email.isValidEmail {
            let alert = UIAlertController(title: "Error", message: "Enter valid email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                print("tapped")
            }))
            error = true
            present(alert,animated: true)
            
        }
        
        if !userDefaults.valueExists(forKey: email) {
            
            let alert = UIAlertController(title: "Error", message: "Register first!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                print("tapped")
            }))
            
            error = true
            present(alert,animated: true)
        }
        
        if (userDefaults.valueExists(forKey: email)) && (password != userDefaults.value(forKey: email) as! String) {
            
            let alert = UIAlertController(title: "Error", message: "Wrong password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                print("tapped")
            }))
            
            error = true
            present(alert,animated: true)
        }
        
        if (!error) && (password == userDefaults.value(forKey: email) as! String) {
            navigationController?.pushViewController(ChatVC(), animated: true)

        }
        
        
    }
    
    @objc func signUpAction(view: UILabel) {

        navigationController?.pushViewController(SignUpVC(), animated: true)
    }
    
    @objc func forgotAction(view: UILabel) {

        navigationController?.pushViewController(ForgotPasswordVC(), animated: true)
    }
    
    private func makeConstraints() {
        
        view.addSubview(loginLayout)
        loginLayout.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(255)
        }
        
        loginLayout.addSubview(titleLogin)
        titleLogin.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        loginLayout.addSubview(emailField)
        emailField.snp.makeConstraints { make in
            make.top.equalTo(titleLogin.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        loginLayout.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        loginLayout.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.bottom.equalToSuperview()
            make.height.equalTo(48)
        }
        
        loginLayout.addSubview(forgotPassword)
        forgotPassword.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        loginLayout.addSubview(userAgreement)
        userAgreement.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(15)
            make.left.equalTo(loginButton.snp.left).offset(2)
            make.right.equalTo(loginButton.snp.right)
        }
        
        view.addSubview(signUp)
        signUp.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-35)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(helpButton)
        helpButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(35)
            make.right.equalToSuperview().offset(-20)
        }
        
        view.addSubview(logo)
        logo.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(60)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(titleLogin.snp.top).offset(-30)
        }
    }

}

