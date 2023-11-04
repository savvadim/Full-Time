import Foundation
import UIKit
import SnapKit
import Color
import Font
import Domain

open class LoginViewController: UIViewController {
    
    private let safeView = UIView()
    private let scrollView = UIScrollView()
    
    private let loginButton = UIButton()
    private let regButton = UIButton()
    private let showHideButton = UIButton()
    
    private let logoImage = UIImageView()
    private let emailStrip = UIImageView()
    private let passwordStrip = UIImageView()
   
    private let emailField = UITextField()
    private let passwordField = UITextField()
    
    private let authLabel = UILabel()
    private let forgetLabel = UILabel()
    private let privacyLabel = UILabel()
    
    public typealias Empty = () -> Void
    public var viewModel: LoginModels
    
    var onLogin: Empty?
    
    public init(viewModel: LoginModels, onLogin: Empty? = nil) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем распознаватель жестов
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
        view.backgroundColor = UIColor.backColor
        
//        let safeView = UIView()
        view.addSubview(safeView)
        
        safeView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
//        let scrollView = UIScrollView()
        safeView.addSubview(scrollView)
        scrollView.frame = view.bounds
        
//        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "fullBack")
        logoImage.contentMode = .scaleAspectFill
        safeView.addSubview(logoImage)
        
        logoImage.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalToSuperview().offset(236)
        }
        
//        let authLabel = UILabel()
        authLabel.textColor = .white
        authLabel.text = "Авторизация"
        authLabel.font = CustomFont.SemiBold
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
            attributes: [.foregroundColor: UIColor.customGrey]
        )
        emailField.font = CustomFont.RegularMedium
        emailField.textColor = .white
        emailField.delegate = self
        safeView.addSubview(emailField)
        
        emailField.text = "test@test.com"
        
        emailField.snp.makeConstraints { make in
            make.left.equalTo(emailStrip).offset(8)
            make.top.equalToSuperview().offset(60)
            make.width.equalTo(302)
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
            attributes: [.foregroundColor: UIColor.customGrey]
        )
        
        passwordField.font = CustomFont.RegularMedium
        passwordField.textColor = .white
        passwordField.delegate = self
        safeView.addSubview(passwordField)
        
        passwordField.text = "password"
        
        passwordField.snp.makeConstraints { make in
            make.left.equalTo(passwordStrip).offset(8)
            make.top.equalToSuperview().offset(117)
            make.width.equalTo(275)
        }
        
//        let showHideButton = UIButton()
        showHideButton.tintColor = UIColor.eyeGrey
        showHideButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        showHideButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        showHideButton.addTarget(self, action: #selector(showHideButtonTapped), for: .touchUpInside)
        safeView.addSubview(showHideButton)
        
        showHideButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordField)
            make.right.equalTo(passwordStrip)
        }
        
        let forgetButton = UIButton()
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: UIColor.white,
            .font: CustomFont.RegularSmall as Any
        ]
        forgetButton.setAttributedTitle(NSAttributedString(string: "Забыли пароль?", attributes: attributes), for: .normal)
        forgetButton.addTarget(self, action: #selector(forgetTapped), for: .touchUpInside)
        safeView.addSubview(forgetButton)
        
        forgetButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(33)
            make.top.equalToSuperview().offset(170)
        }
        
        //let loginButton = UIButton()
        loginButton.backgroundColor = UIColor.customBlue
        loginButton.titleLabel?.font = CustomFont.RegularLarge
        loginButton.setTitle("Продолжить", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        loginButton.layer.cornerRadius = 8
        safeView.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 365, height: 60))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(232)
        }

//        let regButton = UIButton()
        regButton.backgroundColor = .white
        regButton.setTitle("Регистрация", for: .normal)
        regButton.titleLabel?.font = CustomFont.RegularLarge
        regButton.setTitleColor(UIColor.customBlue, for: .normal)
        regButton.addTarget(self, action: #selector(regTapped), for: .touchUpInside)
        regButton.layer.cornerRadius = 8
        safeView.addSubview(regButton)
        
        regButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 365, height: 60))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(153)
        }
        
//        let privacyLabel = UILabel()
        privacyLabel.textColor = UIColor.privacyGrey
        privacyLabel.font = CustomFont.Roboto
        privacyLabel.text = "Нажимая, вы соглашаетесь с политикой\nконфидециальности"
        privacyLabel.textAlignment = .center
        privacyLabel.numberOfLines = 0
        
        safeView.addSubview(privacyLabel)
        
        privacyLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(60)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func showHideButtonTapped() {
        showHideButton.isSelected.toggle()
        passwordField.isSecureTextEntry.toggle()
    }
    
    @objc func loginTapped() {
        let email = emailField.text ?? ""
        let password = passwordField.text ?? ""
        self.viewModel.onLogin(email: email, password: password)
    }
    
    @objc func regTapped() {
        print("reg")
    }
    
    @objc func forgetTapped() {
        print("forget")
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailField {
            emailStrip.image = UIImage(named: "glow")
        } else if textField == passwordField {
            passwordStrip.image = UIImage(named: "glow")
        }
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailField {
            emailStrip.image = UIImage(named: "strip")
        } else if textField == passwordField {
            passwordStrip.image = UIImage(named: "strip")
        }
    }
}
