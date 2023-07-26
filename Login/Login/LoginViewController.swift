//
//  LoginViewController.swift
//  Login
//
//  Created by Vladislav Skuratov on 09.12.2022.
//

import Foundation
import UIKit
import SnapKit

open class LoginViewController: UIViewController {
    
    let checkButton = UIButton()
    let showHideButton = UIButton()
    let passwordField = UITextField()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        let logoView = UIView()
        //        logoView.backgroundColor = .white
        view.addSubview(logoView)
        
        logoView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 70, height: 70))
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(139)
        }
        
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "Subtract")
        logoImage.contentMode = .scaleAspectFit
        logoView.addSubview(logoImage)
        
        logoImage.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 70, height: 70))
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
            make.top.equalToSuperview().offset(56)
            make.left.equalToSuperview().offset(33)
        }
        
        let logoLabel = UILabel()
        logoLabel.textColor = UIColor(red: 0.44, green: 0.67, blue: 0.92, alpha: 1)
        logoLabel.text = "Планировщик «Full Time»"
        logoLabel.font = UIFont(name: "Poppins-Regular", size: 24)
        view.addSubview(logoLabel)
        
        logoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(223)
        }
        
        let entryView = UIView()
        entryView.backgroundColor = UIColor(red: 0.06, green: 0.06, blue: 0.06, alpha: 1)
        view.addSubview(entryView)
        entryView.layer.cornerRadius = 24
        
        entryView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(442)
        }
        
        let entryLabel = UILabel()
        entryLabel.textColor = UIColor(red: 0.44, green: 0.67, blue: 0.92, alpha: 1)
        entryLabel.font = UIFont(name: "Poppins-Bold", size: 22)
        entryLabel.text = "Вход"
        entryView.addSubview(entryLabel)
        
        entryLabel.snp.makeConstraints {make in
            make.left.equalToSuperview().offset(35)
            make.top.equalToSuperview().offset(21)
        }
        
        let aImage = UIImageView()
        aImage.image = UIImage(named: "a")
        entryView.addSubview(aImage)
        
        aImage.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 17, height: 17))
            make.top.equalToSuperview().offset(84)
            make.left.equalToSuperview().offset(38)
        }
        
        let emailField = UITextField()
        emailField.placeholder = "Введите E-Mail"
        emailField.font = UIFont(name: "Poppins-Bold", size: 16)
        emailField.textColor = .white
        entryView.addSubview(emailField)
        
        emailField.snp.makeConstraints { make in
            make.leading.equalTo(aImage.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(81)
            make.width.equalTo(300)
        }
        
        let emailStrip = UIImageView()
        emailStrip.image = UIImage(named: "Strip")
        entryView.addSubview(emailStrip)
        
        emailStrip.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(111)
            make.left.equalToSuperview().offset(57)
        }
        
        let lockImage = UIImageView()
        lockImage.image = UIImage(named: "Lock")
        entryView.addSubview(lockImage)
        
        lockImage.snp.makeConstraints {make in
            make.size.equalTo(CGSize(width: 17, height: 17))
            make.top.equalToSuperview().offset(135)
            make.left.equalToSuperview().offset(36)
        }
        
        let passwordStrip = UIImageView()
        passwordStrip.image = UIImage(named: "Strip")
        entryView.addSubview(passwordStrip)
        
        passwordStrip.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(158)
            make.left.equalToSuperview().offset(57)
        }
        
        showHideButton.tintColor = UIColor(red: 0.69, green: 0.69, blue: 0.69, alpha: 1)
        showHideButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        showHideButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        showHideButton.addTarget(self, action: #selector(showHideButtonTapped), for: .touchUpInside)
        entryView.addSubview(showHideButton)
        
        showHideButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 28, height: 28))
            make.top.equalToSuperview().offset(125)
            make.right.equalToSuperview().inset(26)
        }
        
        passwordField.isSecureTextEntry = true
        passwordField.placeholder = "Введите пароль"
        passwordField.font = UIFont(name: "Poppins-Bold", size: 16)
        passwordField.textColor = .white
        entryView.addSubview(passwordField)
        
        passwordField.snp.makeConstraints { make in
            make.leading.equalTo(lockImage.snp.trailing).offset(12)
            make.trailing.equalTo(showHideButton.snp.leading).offset(-5)
            make.top.equalToSuperview().offset(128)
        }
        
        checkButton.setImage(UIImage (named: "Check"), for: .normal)
        checkButton.setImage(UIImage (named: "Check2"), for: .selected)
        checkButton.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
        entryView.addSubview(checkButton)
        
        checkButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 15, height: 15))
            make.top.equalToSuperview().offset(176)
            make.left.equalToSuperview().offset(38)
        }
        
        let rememberLabel = UILabel()
        rememberLabel.textColor = .white
        rememberLabel.font = UIFont(name: "Poppins-Regular", size: 12)
        rememberLabel.text = "Запомнить меня"
        entryView.addSubview(rememberLabel)
        
        rememberLabel.snp.makeConstraints {make in
            make.leading.equalTo(checkButton.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(175)
        }
        
        let forgetLabel = UILabel()
        forgetLabel.textColor = UIColor(red: 0.44, green: 0.67, blue: 0.92, alpha: 1)
        forgetLabel.font = UIFont(name: "Poppins-Bold", size: 12)
        forgetLabel.text = "Забыли пароль?"
        entryView.addSubview(forgetLabel)
        
        forgetLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(36)
            make.top.equalToSuperview().offset(175)
        }
        
        let loginButton = UIButton()
        loginButton.backgroundColor = UIColor(red: 0.56, green: 0.58, blue: 0.6, alpha: 1)
        loginButton.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 14)
        loginButton.setTitle("Войти", for: .normal)
        loginButton.layer.cornerRadius = 7
        entryView.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 327, height: 50))
            make.top.equalToSuperview().offset(208)
            make.centerX.equalToSuperview()
        }
        
        let noAccountLabel = UILabel()
        noAccountLabel.text = "Еще нет аккаунта?"
        noAccountLabel.textColor  = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        noAccountLabel.font = UIFont(name: "Poppins-Regular", size: 12)
        entryView.addSubview(noAccountLabel)
        
        noAccountLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(26)
            make.bottom.equalToSuperview().inset(145)
        }
        
        let regLabel = UILabel()
        regLabel.text = "Зарегистрируйтесь"
        regLabel.textColor = UIColor(red: 0.44, green: 0.67, blue: 0.92, alpha: 1)
        regLabel.font = UIFont(name: "Poppins-Regular", size: 12)
        entryView.addSubview(regLabel)
        
        regLabel.snp.makeConstraints { make in
            make.leading.equalTo(noAccountLabel.snp.trailing).offset(3)
            make.bottom.equalToSuperview().inset(145)
        }
        
        let privacyLabel = UILabel()
        privacyLabel.textColor = UIColor(red: 0.68, green: 0.68, blue: 0.68, alpha: 1)
        privacyLabel.font = UIFont(name: "Roboto-Regular", size: 12)
        privacyLabel.text = "Нажимая, вы соглашаетесь с политикой\nконфидециальности"
        privacyLabel.textAlignment = .center
        privacyLabel.numberOfLines = 0
        entryView.addSubview(privacyLabel)
        
        privacyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(357)
            make.centerX.equalToSuperview()
        }
    
    }
    
    @objc func showHideButtonTapped() {
            showHideButton.isSelected.toggle()
            passwordField.isSecureTextEntry = !showHideButton.isSelected
        }
    
    @objc func checkBoxTapped() {
        checkButton.isSelected.toggle()
    }
}
