import Foundation
import Networking
import UIKit
import SnapKit
import Domain
import Design

open class ProfileViewController: UIViewController {
    
    private let safeView = UIView()
    private let scrollView = UIView()
    
    private let nameField = UITextField()
    private let surNameField = UITextField()
    private let emailField = UITextField()
    private let jobField = UITextField()
    private let passwordField = UITextField()
    
    private let nameStrip = UIImageView()
    private let surNameStrip = UIImageView()
    private let emailStrip = UIImageView()
    private let jobStrip = UIImageView()
    private let passwordStrip = UIImageView()
    
    private let showHideButton = UIButton()
    private let checkButton = UIButton()
    private let exitButton = UIButton()
    private let saveButton = UIButton()
    
    private let profileLabel = UILabel()
    private let pushLabel = UILabel()
    
    private let logoImage = UIImageView()
    private let imageView = UIImageView()
    
    private let profileModel = ProfileModel()

    override open func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.backColor
        
        // Создаем распознаватель жестов
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
//        let safeView = UIView()
        view.addSubview(safeView)
        
        safeView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
//        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "fullBack")
        logoImage.contentMode = .scaleAspectFill
        safeView.addSubview(logoImage)

        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(236)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
//        let profileLabel = UILabel()
        profileLabel.textColor = .white
        profileLabel.text = "Мой профиль"
        profileLabel.font = CustomFont.SemiBold
        navigationItem.titleView = profileLabel
        
//        let imageView = UIImageView()
        imageView.image = UIImage(named: "default")
        safeView.addSubview(imageView)

        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 120, height: 120))
        }

        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        
//        let scrollView = UIScrollView()
        safeView.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 310, height: 306))
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
        
//        let nameField = UITextField()
        nameField.textColor = .white
        nameField.font = CustomFont.RegularMedium
        nameField.attributedPlaceholder = NSAttributedString(
            string: "Ivan",
            attributes: [.foregroundColor: UIColor.customGrey]
        )
        nameField.delegate = self
        scrollView.addSubview(nameField)
        
        nameField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 302, height: 24))
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(8)
        }
        
//        let nameStrip = UIImageView()
        nameStrip.image = UIImage(named: "strip")
        scrollView.addSubview(nameStrip)
        
        nameStrip.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nameField).offset(8)
        }
        
//        let surNameField = UITextField()
        surNameField.textColor = .white
        surNameField.font = CustomFont.RegularMedium
        surNameField.attributedPlaceholder = NSAttributedString(
            string: "Ivanov",
            attributes: [.foregroundColor: UIColor.customGrey]
        )
        surNameField.delegate = self
        scrollView.addSubview(surNameField)
        
        surNameField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 302, height: 24))
            make.top.equalTo(nameStrip).offset(25)
            make.left.equalToSuperview().offset(8)
        }
        
//        let surNameStrip = UIImageView()
        surNameStrip.image = UIImage(named: "strip")
        scrollView.addSubview(surNameStrip)
        
        surNameStrip.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(surNameField).offset(8)
        }
        
//        let emailField = UITextField()
        emailField.textColor = .white
        emailField.font = CustomFont.RegularMedium
        emailField.attributedPlaceholder = NSAttributedString(
            string: "E-mail",
            attributes: [.foregroundColor: UIColor.customGrey]
        )
        emailField.delegate = self
        scrollView.addSubview(emailField)
        
        emailField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 302, height: 24))
            make.top.equalTo(surNameStrip).offset(25)
            make.left.equalToSuperview().offset(8)
        }
        
//        let emailStrip = UIImageView()
        emailStrip.image = UIImage(named: "strip")
        scrollView.addSubview(emailStrip)
        
        emailStrip.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(emailField).offset(8)
        }
        
//        let jobField = UITextField()
        jobField.textColor = .white
        jobField.font = CustomFont.RegularMedium
        jobField.attributedPlaceholder = NSAttributedString(
            string: "Должность",
            attributes: [.foregroundColor: UIColor.customGrey]
        )
        jobField.delegate = self
        scrollView.addSubview(jobField)
        
        jobField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 302, height: 24))
            make.top.equalTo(emailStrip).offset(25)
            make.left.equalToSuperview().offset(8)
        }
        
//        let jobStrip = UIImageView()
        jobStrip.image = UIImage(named: "strip")
        scrollView.addSubview(jobStrip)
        
        jobStrip.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(jobField).offset(8)
        }
        
//        let passwordField = UITextField()
        passwordField.isSecureTextEntry = true
        passwordField.textColor = .white
        passwordField.font = CustomFont.RegularMedium
        passwordField.attributedPlaceholder = NSAttributedString(
                    string: "Изменить пароль",
                    attributes: [.foregroundColor: UIColor.customGrey]
                )
        passwordField.delegate = self
        scrollView.addSubview(passwordField)
        
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(jobStrip).offset(25)
            make.left.equalToSuperview().offset(8)
            make.width.equalTo(275)
        }
        
//        let passwordStrip = UIImageView()
        passwordStrip.image = UIImage(named: "strip")
        scrollView.addSubview(passwordStrip)
        
        passwordStrip.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(passwordField).offset(8)
        }
        
//        let showHideButton = UIButton()
        showHideButton.tintColor = UIColor.eyeGrey
        showHideButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        showHideButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        showHideButton.addTarget(self, action: #selector(showHideButtonTapped), for: .touchUpInside)
        scrollView.addSubview(showHideButton)
        
        showHideButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordField)
            make.right.equalTo(passwordStrip)
        }
        
//        let checkButton = UIButton()
        checkButton.setImage(UIImage (named: "hover"), for: .normal)
        checkButton.setImage(UIImage (named: "active"), for: .selected)
        checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        scrollView.addSubview(checkButton)

        checkButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 15, height: 15))
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(18)
        }
        
//        let pushLabel = UILabel()
        pushLabel.text = "Push-уведомления"
        pushLabel.font = CustomFont.RegularSmall
        pushLabel.textColor = .white
        scrollView.addSubview(pushLabel)
        
        pushLabel.snp.makeConstraints { make in
            make.centerY.equalTo(checkButton)
            make.left.equalTo(checkButton.snp.right).offset(7)
        }
        
//        let exitButton = UIButton()
        exitButton.backgroundColor = UIColor.customBlue
        exitButton.setTitle("Выйти", for: .normal)
        exitButton.titleLabel?.font = CustomFont.RegularLarge
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
        saveButton.titleLabel?.font = CustomFont.RegularLarge
        saveButton.setTitleColor(UIColor.customBlue, for: .normal)
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
        saveButton.isHidden.toggle()
    }
    
    @objc func exitButtonTapped() {
        print("exit")
        profileModel.getProfile()
    }
    
    @objc func saveButtonTapped() {
        print("save")
        exitButton.isHidden = false
        saveButton.isHidden = true
    }
    
    @objc func handleTap() {
        view.endEditing(true)
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
