//
//  CustomChatCell.swift
//  Month4-HW1-Murzaliev
//
//  Created by Samat Murzaliev on 10.02.2022.
//

import UIKit
import SnapKit

class CustomChatCell: UITableViewCell {
    
    let customView = UIView()
    
    let logo: UIImageView = {
        let logo = UIImageView()
        logo.clipsToBounds = true
        logo.layer.cornerRadius = 30
        
        return logo
    }()
    
    let chatName: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14, weight: .semibold)
       
        return view
    }()
    
    let lastMessage: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 12, weight: .thin)
        view.numberOfLines = 0
        return view
    }()


    override func layoutSubviews() {
        addSubview(customView)
        customView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        customView.addSubview(logo)
        logo.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(60)
            make.left.equalToSuperview().offset(4)
            make.top.equalToSuperview().offset(4)
        }
        
        customView.addSubview(chatName)
        chatName.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(logo.snp.right).offset(3)
        }
        
        customView.addSubview(lastMessage)
        lastMessage.snp.makeConstraints { make in
            make.height.equalTo(40)

            make.top.equalTo(chatName.snp.bottom).offset(2)
            make.left.equalTo(logo.snp.right).offset(3)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
        
    }


}
