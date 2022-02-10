//
//  ChatVC.swift
//  Month4-HW1-Murzaliev
//
//  Created by Samat Murzaliev on 10.02.2022.
//

import UIKit
import SnapKit

class ChatVC: UIViewController {
    
    private var chats: [ChatModel] = [
    ChatModel(logo: "logo1", chatName: "Eldar", lastMessage: "Молодец!"),
    ChatModel(logo: "logo2", chatName: "MainFootball", lastMessage: "Роберту Левандовски прислали все его награды IFFHS за 2021 год"),
    ChatModel(logo: "logo3", chatName: "GeekTech 05IOS30102021", lastMessage: "Окей"),
    ChatModel(logo: "logo4", chatName: "Футбол | Трансляции матчей | Обзор", lastMessage: "Подписывайтесь на новый канал."),
    ChatModel(logo: "logo5", chatName: "Голос Имана",  lastMessage: "Посланник Аллаха, да благословит его Аллах и приветствует, сказал: Больше всего (человек подвергается) наказанию в могиле из-за (брызгов) мочи, так остерегайтесь же её. Этот хадис передали аль-Баззар в «Кашф» (243), ат-Табарани в «Му’джам аль-Кабир» (11104), аль-Хаким (1/184), ад-Даракъутни в «Сунан» (1/128)."),
    ChatModel(logo: "logo1", chatName: "Eldar", lastMessage: "Молодец!"),
    ChatModel(logo: "logo2", chatName: "MainFootball", lastMessage: "Роберту Левандовски прислали все его награды IFFHS за 2021 год"),
    ChatModel(logo: "logo3", chatName: "GeekTech 05IOS30102021", lastMessage: "Окей"),
    ChatModel(logo: "logo4", chatName: "Футбол | Трансляции матчей | Обзор", lastMessage: "Подписывайтесь на новый канал."),
    ChatModel(logo: "logo5", chatName: "Голос Имана",  lastMessage: "Посланник Аллаха, да благословит его Аллах и приветствует, сказал: Больше всего (человек подвергается) наказанию в могиле из-за (брызгов) мочи, так остерегайтесь же её. Этот хадис передали аль-Баззар в «Кашф» (243), ат-Табарани в «Му’джам аль-Кабир» (11104), аль-Хаким (1/184), ад-Даракъутни в «Сунан» (1/128)."),
    ChatModel(logo: "logo1", chatName: "Eldar", lastMessage: "Молодец!"),
    ChatModel(logo: "logo2", chatName: "MainFootball", lastMessage: "Роберту Левандовски прислали все его награды IFFHS за 2021 год"),
    ChatModel(logo: "logo3", chatName: "GeekTech 05IOS30102021", lastMessage: "Окей"),
    ChatModel(logo: "logo4", chatName: "Футбол | Трансляции матчей | Обзор", lastMessage: "Подписывайтесь на новый канал."),
    ChatModel(logo: "logo5", chatName: "Голос Имана",  lastMessage: "Посланник Аллаха, да благословит его Аллах и приветствует, сказал: Больше всего (человек подвергается) наказанию в могиле из-за (брызгов) мочи, так остерегайтесь же её. Этот хадис передали аль-Баззар в «Кашф» (243), ат-Табарани в «Му’джам аль-Кабир» (11104), аль-Хаким (1/184), ад-Даракъутни в «Сунан» (1/128)."),
    ChatModel(logo: "logo1", chatName: "Eldar", lastMessage: "Молодец!"),
    ChatModel(logo: "logo2", chatName: "MainFootball", lastMessage: "Роберту Левандовски прислали все его награды IFFHS за 2021 год"),
    ChatModel(logo: "logo3", chatName: "GeekTech 05IOS30102021", lastMessage: "Окей"),
    ChatModel(logo: "logo4", chatName: "Футбол | Трансляции матчей | Обзор", lastMessage: "Подписывайтесь на новый канал."),
    ChatModel(logo: "logo5", chatName: "Голос Имана",  lastMessage: "Посланник Аллаха, да благословит его Аллах и приветствует, сказал: Больше всего (человек подвергается) наказанию в могиле из-за (брызгов) мочи, так остерегайтесь же её. Этот хадис передали аль-Баззар в «Кашф» (243), ат-Табарани в «Му’джам аль-Кабир» (11104), аль-Хаким (1/184), ад-Даракъутни в «Сунан» (1/128).")
    
    ]
    
    private var table = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        makeConstraints()

    }
    
    private func makeConstraints() {
        
        table.register(CustomChatCell.self, forCellReuseIdentifier: "CustomChatCell")

        view.addSubview(table)
        table.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        

    }


}

extension ChatVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomChatCell", for: indexPath) as! CustomChatCell
        cell.logo.image = UIImage(named: chats[index].logo)
        cell.chatName.text = chats[index].chatName
        cell.lastMessage.text = chats[index].lastMessage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
    
}
