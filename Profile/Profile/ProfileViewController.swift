//
//  ProfileViewController.swift
//  Profile
//
//  Created by Вадим Савосько on 07.08.2023.
//

import Foundation
import UIKit
import SnapKit

open class ProfileViewController: UIViewController {
    
    let nameField = UITextField()
    let surNameField = UITextField()
    let emailField = UITextField()
    let jobField = UITextField()
    let passwordField = UITextField()
    
    let nameStrip = UIImageView()
    let surNameStrip = UIImageView()
    let emailStrip = UIImageView()
    let jobStrip = UIImageView()
    let passwordStrip = UIImageView()
    
    let showHideButton = UIButton()
    let checkButton = UIButton()
    let exitButton = UIButton()
    let saveButton = UIButton()
    
    let profileLabel = UILabel()
    let pushLabel = UILabel()

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
        
//        let profileLabel = UILabel()
        profileLabel.textColor = .white
        profileLabel.text = "Мой профиль"
        profileLabel.font = UIFont(name: "Poppins-SemiBold", size: 22)
        navigationItem.titleView = profileLabel
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "default")
        safeView.addSubview(imageView)

        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 120, height: 120))
        }

        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        
        let inputView = UIView()
//        inputView.backgroundColor = .white
        safeView.addSubview(inputView)
        
        inputView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 310, height: 306))
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
        
//        let nameField = UITextField()
        nameField.textColor = .white
        nameField.font = UIFont(name: "Poppins-Regular", size: 16)
        nameField.attributedPlaceholder = NSAttributedString(
            string: "Ivan",
            attributes: [.foregroundColor: UIColor(red: 0.69, green: 0.76, blue: 0.81, alpha: 0.5)]
        )
        nameField.delegate = self
        inputView.addSubview(nameField)
        
        nameField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 284, height: 24))
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(8)
        }
        
//        let nameStrip = UIImageView()
        nameStrip.image = UIImage(named: "strip")
        inputView.addSubview(nameStrip)
        
        nameStrip.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nameField).offset(8)
        }
        
//        let surNameField = UITextField()
        surNameField.textColor = .white
        surNameField.font = UIFont(name: "Poppins-Regular", size: 16)
        surNameField.attributedPlaceholder = NSAttributedString(
            string: "Ivanov",
            attributes: [.foregroundColor: UIColor(red: 0.69, green: 0.76, blue: 0.81, alpha: 0.5)]
        )
        surNameField.delegate = self
        inputView.addSubview(surNameField)
        
        surNameField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 284, height: 24))
            make.top.equalTo(nameStrip).offset(25)
            make.left.equalToSuperview().offset(8)
        }
        
//        let surNameStrip = UIImageView()
        surNameStrip.image = UIImage(named: "strip")
        inputView.addSubview(surNameStrip)
        
        surNameStrip.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(surNameField).offset(8)
        }
        
//        let emailField = UITextField()
        emailField.textColor = .white
        emailField.font = UIFont(name: "Poppins-Regular", size: 16)
        emailField.attributedPlaceholder = NSAttributedString(
            string: "E-mail",
            attributes: [.foregroundColor: UIColor(red: 0.69, green: 0.76, blue: 0.81, alpha: 0.5)]
        )
        emailField.delegate = self
        inputView.addSubview(emailField)
        
        emailField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 284, height: 24))
            make.top.equalTo(surNameStrip).offset(25)
            make.left.equalToSuperview().offset(8)
        }
        
//        let emailStrip = UIImageView()
        emailStrip.image = UIImage(named: "strip")
        inputView.addSubview(emailStrip)
        
        emailStrip.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(emailField).offset(8)
        }
        
//        let jobField = UITextField()
        jobField.textColor = .white
        jobField.font = UIFont(name: "Poppins-Regular", size: 16)
        jobField.attributedPlaceholder = NSAttributedString(
            string: "Должность",
            attributes: [.foregroundColor: UIColor(red: 0.69, green: 0.76, blue: 0.81, alpha: 0.5)]
        )
        jobField.delegate = self
        inputView.addSubview(jobField)
        
        jobField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 284, height: 24))
            make.top.equalTo(emailStrip).offset(25)
            make.left.equalToSuperview().offset(8)
        }
        
//        let jobStrip = UIImageView()
        jobStrip.image = UIImage(named: "strip")
        inputView.addSubview(jobStrip)
        
        jobStrip.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(jobField).offset(8)
        }
        
//        let passwordField = UITextField()
        passwordField.isSecureTextEntry = true
        passwordField.textColor = .white
        passwordField.font = UIFont(name: "Poppins-Regular", size: 16)
        passwordField.attributedPlaceholder = NSAttributedString(
                    string: "Изменить пароль",
                    attributes: [.foregroundColor: UIColor(red: 0.69, green: 0.76, blue: 0.81, alpha: 0.5)]
                )
        passwordField.delegate = self
        inputView.addSubview(passwordField)
        
        passwordField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 270, height: 24))
            make.top.equalTo(jobStrip).offset(25)
            make.left.equalToSuperview().offset(8)
        }
        
//        let passwordStrip = UIImageView()
        passwordStrip.image = UIImage(named: "strip")
        inputView.addSubview(passwordStrip)
        
        passwordStrip.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(passwordField).offset(8)
        }
        
//        let showHideButton = UIButton()
        showHideButton.tintColor = UIColor(red: 0.69, green: 0.69, blue: 0.69, alpha: 1)
        showHideButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        showHideButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        showHideButton.addTarget(self, action: #selector(showHideButtonTapped), for: .touchUpInside)
        safeView.addSubview(showHideButton)
        
        showHideButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordField)
            make.right.equalTo(passwordStrip)
        }
        
//        let checkButton = UIButton()
        checkButton.setImage(UIImage (named: "hover"), for: .normal)
        checkButton.setImage(UIImage (named: "active"), for: .selected)
        checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        inputView.addSubview(checkButton)

        checkButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 15, height: 15))
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(18)
        }
        
//        let pushLabel = UILabel()
        pushLabel.text = "Push-уведомления"
        pushLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        pushLabel.textColor = .white
        inputView.addSubview(pushLabel)
        
        pushLabel.snp.makeConstraints { make in
            make.centerY.equalTo(checkButton)
            make.left.equalTo(checkButton.snp.right).offset(7)
        }
        
//        let exitButton = UIButton()
        exitButton.backgroundColor = UIColor(red: 0.12, green: 0.15, blue: 0.53, alpha: 1)
        exitButton.setTitle("Выйти", for: .normal)
        exitButton.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 18)
        exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        exitButton.layer.cornerRadius = 8
        safeView.addSubview(exitButton)
        
        exitButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 366, height: 59))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(34)
        }
        
//        let saveButton = UIButton()
        saveButton.backgroundColor = .white
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 18)
        saveButton.setTitleColor(UIColor(red: 0.12, green: 0.15, blue: 0.53, alpha: 1), for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        saveButton.layer.cornerRadius = 8
        saveButton.isHidden = true
        safeView.addSubview(saveButton)
        
        saveButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 366, height: 59))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(34)
        }
        
    }
    
    @objc func showHideButtonTapped() {
        showHideButton.isSelected.toggle()
        passwordField.isSecureTextEntry = !showHideButton.isSelected
    }
    
    @objc func checkButtonTapped(sender: UIButton) {
        checkButton.isSelected.toggle()
        saveButton.isHidden = !sender.isSelected
    }
    
    @objc func exitButtonTapped() {
        print("exit")
    }
    
    @objc func saveButtonTapped() {
        print("save")
        exitButton.isHidden = false
        saveButton.isHidden = true
    }

}

extension ProfileViewController: UITextFieldDelegate {

    public func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
            case nameField:
                updateImage(for: nameStrip, isActive: true)
            case surNameField:
                updateImage(for: surNameStrip, isActive: true)
            case emailField:
                updateImage(for: emailStrip, isActive: true)
            case jobField:
                updateImage(for: jobStrip, isActive: true)
            case passwordField:
                updateImage(for: passwordStrip, isActive: true)
            default:
                break
            }
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
            case nameField:
                updateImage(for: nameStrip, isActive: false)
            case surNameField:
                updateImage(for: surNameStrip, isActive: false)
            case emailField:
                updateImage(for: emailStrip, isActive: false)
            case jobField:
                updateImage(for: jobStrip, isActive: false)
            case passwordField:
                updateImage(for: passwordStrip, isActive: false)
            default:
                break
            }
    }
    
    public func updateImage(for imageView: UIImageView, isActive: Bool) {
        if isActive {
            imageView.image = UIImage(named: "glow")
        } else {
            imageView.image = UIImage(named: "strip")
        }
    }
}
