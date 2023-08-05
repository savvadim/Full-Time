//
//  BoardsViewController.swift
//  Boards
//
//  Created by Вадим Савосько on 31.07.2023.
//

import Foundation
import UIKit
import SnapKit

open class BoardsViewController: UIViewController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        // Скрыть навигационную панель (NavBar)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        let safeView = UIView()
        safeView.backgroundColor = .black
        view.addSubview(safeView)
        
        safeView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        let logoView = UIView()
        logoView.backgroundColor = .black
        safeView.addSubview(logoView)
        
        logoView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 55, height: 55))
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
        }
        
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "Subtract")
        logoImage.contentMode = .scaleAspectFit
        logoView.addSubview(logoImage)

        logoImage.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 55, height: 55))
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
        }

        let fullLabel = UILabel()
        fullLabel.textColor = UIColor(red: 0.44, green: 0.67, blue: 0.92, alpha: 1)
        fullLabel.text = "Full"
        fullLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        logoView.addSubview(fullLabel)

        fullLabel.snp.makeConstraints { make in
            make.centerX.equalTo(logoImage)
            make.centerY.equalTo(logoImage)
        }

        let timeLabel = UILabel()
        timeLabel.textColor = UIColor(red: 0.44, green: 0.67, blue: 0.92, alpha: 1)
        timeLabel.text = "Time"
        timeLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        logoView.addSubview(timeLabel)

        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(43)
            make.left.equalToSuperview().offset(27)
        }
        
        let burgerImage = UIImageView()
        burgerImage.image = UIImage(named: "Burger")
        burgerImage.contentMode = .scaleAspectFit
        safeView.addSubview(burgerImage)

        burgerImage.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 22, height: 18))
            make.right.equalToSuperview().inset(20)
            make.centerY.equalTo(logoView)
        }


        let boardsLabel = UILabel()
        boardsLabel.text = "Все доски"
        boardsLabel.textColor = UIColor(red: 0.44, green: 0.67, blue: 0.92, alpha: 1)
        boardsLabel.font = UIFont(name: "Poppins-Bold", size: 22)
        safeView.addSubview(boardsLabel)

        boardsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
        }
        
        let createButton = UIButton()
        createButton.layer.cornerRadius = 7
        createButton.setTitle("Создать доску", for: .normal)
        createButton.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 14)
        createButton.backgroundColor = UIColor(red: 0.01, green: 0.26, blue: 0.62, alpha: 1)
        safeView.addSubview(createButton)
        
        createButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 325, height: 50))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BoardsTableViewCell.self, forCellReuseIdentifier: "YourTableViewCell")
        view.addSubview(tableView)
        
    }
}

extension BoardsViewController : UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataFromDatabase.count
        return 3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YourTableViewCell", for: indexPath) as! BoardsTableViewCell
//        let dataItem = dataFromDatabase[indexPath.row]
//        cell.titleLabel.text = dataItem.title
//        cell.subtitleLabel.text = dataItem.subtitle
        
        cell.titleLabel.text = "test"
        cell.subtitleLabel.text = "test1"
        return cell
    }
    
    
}
