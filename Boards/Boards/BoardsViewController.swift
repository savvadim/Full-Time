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
        
        view.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.28, alpha: 1)
        
        let safeView = UIView()
        view.addSubview(safeView)
        
        safeView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "full")
        safeView.addSubview(logoImage)

        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(236)
            make.centerX.equalToSuperview()

        }
        
        let boardsLabel = UILabel()
        boardsLabel.text = "Все доски"
        boardsLabel.textColor = .white
        boardsLabel.font = UIFont(name: "Poppins-Bold", size: 22)
        navigationItem.titleView = boardsLabel
        
//        let burgerButton = UIButton()
//        burgerButton.setImage(UIImage(named: "Burger"), for: .normal)
//        burgerButton.addTarget(self, action: #selector(burgerButtonTapped), for: .touchUpInside)
//
//        let customBarButtonItem = UIBarButtonItem(customView: burgerButton)
//        navigationItem.rightBarButtonItem = customBarButtonItem
//
//        burgerButton.snp.makeConstraints { make in
//            make.width.equalTo(22) // Ширина кнопки
//            make.height.equalTo(18) // Высота кнопки
//        }
        
        let createButton = UIButton()
        createButton.layer.cornerRadius = 7
        createButton.setTitle("Создать доску", for: .normal)
        createButton.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 18)
        createButton.backgroundColor = UIColor(red: 0.12, green: 0.15, blue: 0.53, alpha: 1)
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
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
//    @objc func burgerButtonTapped() {
//            print("burger")
//        }
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
    
    @objc func createButtonTapped (){
        print("create")
    }
    
}
