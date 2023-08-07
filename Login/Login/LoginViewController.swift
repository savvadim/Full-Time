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
    
    let scrollView = UIScrollView()
    
    let loginButton = UIButton()
    let regButton = UIButton()
    let showHideButton = UIButton()
    
    let emailStrip = UIImageView()
    let passwordStrip = UIImageView()
   
    let emailField = UITextField()
    let passwordField = UITextField()
    
    var regButtonY: Constraint?
    var loginButtonY: Constraint?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.28, alpha: 1)
        
        let safeView = UIView()
        view.addSubview(safeView)
        
        safeView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
//        let scrollView = UIScrollView()
        safeView.addSubview(scrollView)
        scrollView.frame = view.bounds
        
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "full")
        safeView.addSubview(logoImage)
        
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(236)
            make.centerX.equalToSuperview()
            
        }
        
        let authLabel = UILabel()
        authLabel.textColor = .white
        authLabel.text = "Авторизация"
        authLabel.font = UIFont(name: "Poppins-SemiBold", size: 22)
        navigationItem.titleView = authLabel
        
//        let emailStrip = UIImageView()
        emailStrip.image = UIImage(named: "strip")
        safeView.addSubview(emailStrip)
        
        emailStrip.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.centerX.equalToSuperview()
        }
        
//        let emailField = UITextField()
        emailField.attributedPlaceholder = NSAttributedString(
            string: "Введите E-mail",
            attributes: [.foregroundColor: UIColor(red: 0.69, green: 0.76, blue: 0.81, alpha: 0.5)]
        )
        emailField.font = UIFont(name: "Poppins-Regular", size: 16)
        emailField.textColor = .white
        emailField.delegate = self
        safeView.addSubview(emailField)
        
        emailField.snp.makeConstraints { make in
            make.left.equalTo(emailStrip).offset(8)
            make.top.equalToSuperview().offset(60)
            make.width.equalTo(310)
        }
        
//        let passwordStrip = UIImageView()
        passwordStrip.image = UIImage(named: "strip")
        safeView.addSubview(passwordStrip)
        
        passwordStrip.snp.makeConstraints { make in
            make.top.equalTo(emailStrip.snp.bottom).offset(55)
            make.centerX.equalToSuperview()
        }
        
//        let passwordField = UITextField()
        passwordField.isSecureTextEntry = true
        passwordField.attributedPlaceholder = NSAttributedString(
            string: "Введите пароль",
            attributes: [.foregroundColor: UIColor(red: 0.69, green: 0.76, blue: 0.81, alpha: 0.5)]
        )
        
        passwordField.font = UIFont(name: "Poppins-Regular", size: 16)
        passwordField.textColor = .white
        passwordField.delegate = self
        safeView.addSubview(passwordField)
        
        passwordField.snp.makeConstraints { make in
            make.left.equalTo(passwordStrip).offset(8)
            make.top.equalToSuperview().offset(117)
            make.width.equalTo(280)
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
        
        let forgetLabel = UILabel()
        forgetLabel.textColor = .white
        forgetLabel.font = UIFont(name: "Poppins-Bold", size: 14)
        // Создаем атрибутированную строку с нижним подчеркиванием
        let attributedText = NSAttributedString(string: "Забыли пароль?", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        forgetLabel.attributedText = attributedText
        safeView.addSubview(forgetLabel)
        
        forgetLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(33)
            make.top.equalToSuperview().offset(172)
        }
        
        //let loginButton = UIButton()
        loginButton.backgroundColor = UIColor(red: 0.12, green: 0.15, blue: 0.53, alpha: 1)
        loginButton.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 18)
        loginButton.setTitle("Продолжить", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        loginButton.layer.cornerRadius = 8
        safeView.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 365, height: 60))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(232)
            
            loginButtonY = make.bottom.equalToSuperview().inset(232).constraint
        }

//        let regButton = UIButton()
        regButton.backgroundColor = .white
        regButton.setTitle("Регистрация", for: .normal)
        regButton.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 18)
        regButton.setTitleColor(UIColor(red: 0.12, green: 0.15, blue: 0.53, alpha: 1), for: .normal)
        regButton.addTarget(self, action: #selector(regTapped), for: .touchUpInside)
        regButton.layer.cornerRadius = 8
        safeView.addSubview(regButton)
        
        regButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 365, height: 60))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(153)
            
            regButtonY = make.bottom.equalToSuperview().inset(153).constraint
        }
        
        let privacyLabel = UILabel()
        privacyLabel.textColor = UIColor(red: 0.68, green: 0.68, blue: 0.68, alpha: 1)
        privacyLabel.font = UIFont(name: "Roboto-Regular", size: 12)
        privacyLabel.text = "Нажимая, вы соглашаетесь с политикой\nконфидециальности"
        privacyLabel.textAlignment = .center
        privacyLabel.numberOfLines = 0
        
        safeView.addSubview(privacyLabel)
        
        privacyLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(60)
            make.centerX.equalToSuperview()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
            guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
                return
            }
            
            let keyboardHeight = keyboardFrame.size.height
            let buttonBottomInset: CGFloat = 20
            
            regButtonY?.update(offset: -(keyboardHeight - buttonBottomInset))
        loginButtonY?.update(offset: -(keyboardHeight + regButton.frame.size.height))
            view.layoutIfNeeded()
        }
        
    @objc func keyboardWillHide(_ notification: Notification) {
        regButtonY?.update(offset: 100)
        loginButtonY?.update(offset: 100)
        view.layoutIfNeeded()
    }

    
    @objc func showHideButtonTapped() {
        showHideButton.isSelected.toggle()
        passwordField.isSecureTextEntry = !showHideButton.isSelected
    }
    
    @objc func loginTapped() {
        print("login")
    }
    
    @objc func regTapped() {
        print("reg")
    }
}
extension LoginViewController: UITextFieldDelegate {
    // Метод делегата UITextFieldDelegate, вызывается при начале редактирования
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailField {
            emailStrip.image = UIImage(named: "glow")
        } else if textField == passwordField {
            passwordStrip.image = UIImage(named: "glow")
        }
    }
    
    // Метод делегата UITextFieldDelegate, вызывается при завершении редактирования
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailField {
            emailStrip.image = UIImage(named: "strip")
        } else if textField == passwordField {
            passwordStrip.image = UIImage(named: "strip")
        }
    }
}
