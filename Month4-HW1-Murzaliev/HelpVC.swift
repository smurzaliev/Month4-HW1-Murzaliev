//
//  HelpVC.swift
//  Month4-HW1-Murzaliev
//
//  Created by Samat Murzaliev on 11.02.2022.
//

import UIKit
import SnapKit

class HelpVC: UIViewController {
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
    
    private var helpText: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14)
        view.text = """
            This test application created by Samat Murzaliev. Please read carefully.
            1. Go to Sign Up page and register new user
            2. Enter valid and registered email
            3. See chat

        """
        view.numberOfLines = 0
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(helpText)
        helpText.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(35)
            make.left.equalToSuperview().offset(20)
        }
        

    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    

}
