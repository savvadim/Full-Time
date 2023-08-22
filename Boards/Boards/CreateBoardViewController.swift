//
//  CreateBoardViewController.swift
//  Boards
//
//  Created by Вадим Савосько on 22.08.2023.
//

import UIKit
import SnapKit

open class CreateBoardViewController: UIViewController {
    
    let checkButton = UIButton()

    override open func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.28, alpha: 1)
        
        let boardsLabel = UILabel()
        boardsLabel.text = "Создать доску"
        boardsLabel.textColor = .white
        boardsLabel.font = UIFont(name: "Poppins-Bold", size: 22)
        navigationItem.titleView = boardsLabel
        
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        let barButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = barButtonItem
        
        let safeView = UIView()
        view.addSubview(safeView)
        
        safeView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        let nameField = UITextField()
        nameField.attributedPlaceholder = NSAttributedString(
            string: "Название доски",
            attributes: [.foregroundColor: UIColor(red: 0.69, green: 0.76, blue: 0.81, alpha: 0.5)]
        )
        nameField.font = UIFont(name: "Poppins-Regular", size: 16)
        nameField.textColor = .white
//        nameField.delegate = self
        safeView.addSubview(nameField)
        
        nameField.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(50)
        }
        
        let nameStrip = UIImageView()
        nameStrip.image = UIImage(named: "strip")
        safeView.addSubview(nameStrip)
       
        nameStrip.snp.makeConstraints { make in
            make.top.equalTo(nameField.snp.bottom).offset(6)
            make.centerX.equalToSuperview()
        }
        
//        let checkButton = UIButton()
        checkButton.setImage(UIImage (named: "hover"), for: .normal)
        checkButton.setImage(UIImage (named: "active"), for: .selected)
        checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        safeView.addSubview(checkButton)

        checkButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 15, height: 15))
            make.top.equalToSuperview().offset(117)
            make.left.equalToSuperview().offset(42)
        }
        
        let addLabel = UILabel()
        addLabel.text = "Добавить аватар доски"
        addLabel.font = UIFont(name: "Poppins-Regular", size: 16)
        addLabel.textColor = .white
        safeView.addSubview(addLabel)
        
        addLabel.snp.makeConstraints { make in
            make.centerY.equalTo(checkButton)
            make.left.equalTo(checkButton.snp.right).offset(7)
        }
        
        
        let column1Field = UITextField()
        column1Field.attributedPlaceholder = NSAttributedString(
            string: "Столбец 1",
            attributes: [.foregroundColor: UIColor(red: 0.69, green: 0.76, blue: 0.81, alpha: 0.5)]
        )
        column1Field.font = UIFont(name: "Poppins-Regular", size: 16)
        column1Field.textColor = .white
//        column1Field.delegate = self
        safeView.addSubview(column1Field)
        
        column1Field.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(156)
            make.left.equalToSuperview().offset(50)
        }
        
        let column1Strip = UIImageView()
        column1Strip.image = UIImage(named: "strip")
        safeView.addSubview(column1Strip)
       
        column1Strip.snp.makeConstraints { make in
            make.top.equalTo(column1Field.snp.bottom).offset(6)
            make.centerX.equalToSuperview()
        }
        
        let column2Field = UITextField()
        column2Field.attributedPlaceholder = NSAttributedString(
            string: "Столбец 2",
            attributes: [.foregroundColor: UIColor(red: 0.69, green: 0.76, blue: 0.81, alpha: 0.5)]
        )
        column2Field.font = UIFont(name: "Poppins-Regular", size: 16)
        column2Field.textColor = .white
//        column2Field.delegate = self
        safeView.addSubview(column2Field)
        
        column2Field.snp.makeConstraints{ make in
            make.top.equalTo(column1Strip.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(50)
        }
        
        let column2Strip = UIImageView()
        column2Strip.image = UIImage(named: "strip")
        safeView.addSubview(column2Strip)
       
        column2Strip.snp.makeConstraints { make in
            make.top.equalTo(column2Field.snp.bottom).offset(6)
            make.centerX.equalToSuperview()
        }
        
        let addColumnButton = UIButton()
        addColumnButton.backgroundColor = .white
        addColumnButton.setTitle("Добавить столбец", for: .normal)
        addColumnButton.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 18)
        addColumnButton.setTitleColor(UIColor(red: 0.12, green: 0.15, blue: 0.53, alpha: 1), for: .normal)
        addColumnButton.addTarget(self, action: #selector(addColumnButtonTapped), for: .touchUpInside)
        addColumnButton.layer.cornerRadius = 8
        safeView.addSubview(addColumnButton)

        addColumnButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 365, height: 60))
            make.bottom.equalToSuperview().inset(113)
            make.centerX.equalToSuperview()
        }
        
        let createButton = UIButton()
        createButton.backgroundColor = UIColor(red: 0.12, green: 0.15, blue: 0.53, alpha: 1)
        createButton.setTitle("Создать доску", for: .normal)
        createButton.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 18)
        createButton.setTitleColor(UIColor.white, for: .normal)
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        createButton.layer.cornerRadius = 8
        safeView.addSubview(createButton)

        createButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 365, height: 60))
            make.bottom.equalToSuperview().inset(34)
            make.centerX.equalToSuperview()
        }

    }
    
    @objc func checkButtonTapped(sender: UIButton) {
        checkButton.isSelected.toggle()
    }
    
    @objc func addColumnButtonTapped(sender: UIButton) {
        print("add")
    }
    
    @objc func createButtonTapped(sender: UIButton) {
        print("create")
    }
    
    @objc func backButtonTapped(sender: UIButton) {
        print("back")
    }

}
