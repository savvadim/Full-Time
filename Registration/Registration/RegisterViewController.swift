import UIKit
import SnapKit
import Color
import Font

open class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    private let safeView = UIView()
    
    private let regLabel = UILabel()
    private let privacyLabel = UILabel()
    
    private let logoImage = UIImageView()
    
    private let backButton = UIButton()
    private let showHideButton1 = UIButton()
    private let showHideButton2 = UIButton()
    
    private var barButtonItem = UIBarButtonItem()
    
    private let textField1 = UITextField()
    private let textField2 = UITextField()
    private let textField3 = UITextField()
    private let textField4 = UITextField()
    private let textField5 = UITextField()
    private let stripe1 = UIImageView()
    private let stripe2 = UIImageView()
    private let stripe3 = UIImageView()
    private let stripe4 = UIImageView()
    private let stripe5 = UIImageView()

    private var fieldStates: [FieldState] = [.active, .inactive, .inactive, .inactive, .inactive]
    private var textFields: [UITextField] = []
    private var stripes: [UIImageView] = []
    
    
    enum FieldState {
        case inactive
        case active
        case invalid
    }

    override open func viewDidLoad() {
        
        super.viewDidLoad()

        view.backgroundColor = UIColor.backColor
        
        logoImage.image = UIImage(named: "fullBack")
        logoImage.contentMode = .scaleAspectFill
        safeView.addSubview(logoImage)
        
        logoImage.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalToSuperview().offset(236)
        }
        
        regLabel.textColor = .white
        regLabel.text = "Регистарция"
        regLabel.font = CustomFont.SemiBold
        navigationItem.titleView = regLabel

        view.addSubview(safeView)
        
        safeView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        barButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = barButtonItem
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
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
        
        showHideButton1.tintColor = UIColor.eyeGrey
        showHideButton1.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        showHideButton1.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        showHideButton1.addTarget(self, action: #selector(showHideButton1Tapped), for: .touchUpInside)
        safeView.addSubview(showHideButton1)
        
        showHideButton2.tintColor = UIColor.eyeGrey
        showHideButton2.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        showHideButton2.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        showHideButton2.addTarget(self, action: #selector(showHideButton2Tapped), for: .touchUpInside)
        safeView.addSubview(showHideButton2)
        
        //MARK: Fields
        
        textFields = [textField1, textField2, textField3, textField4, textField5]
        stripes = [stripe1, stripe2, stripe3, stripe4, stripe5]
        
        for stripe in stripes {
            stripe.image = UIImage(named: "strip")
            safeView.addSubview(stripe)
        }
            
        for textField in textFields {
            textField.textColor = .white
            textField.font = CustomFont.RegularMedium
            safeView.addSubview(textField)
            
            textField.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
            textField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
            textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
        
        textField1.attributedPlaceholder = NSAttributedString(
            string: "Введите имя",
            attributes: [.foregroundColor: UIColor.customGrey]
        )
        textField2.attributedPlaceholder = NSAttributedString(
            string: "Введите фамилию",
            attributes: [.foregroundColor: UIColor.customGrey]
        )
        textField3.attributedPlaceholder = NSAttributedString(
            string: "Введите E-Mail",
            attributes: [.foregroundColor: UIColor.customGrey]
        )
        textField4.isSecureTextEntry = true
        textField4.attributedPlaceholder = NSAttributedString(
            string: "Введите пароль",
            attributes: [.foregroundColor: UIColor.customGrey]
        )
        textField5.isSecureTextEntry = true
        textField5.attributedPlaceholder = NSAttributedString(
            string: "Повторите пароль",
            attributes: [.foregroundColor: UIColor.customGrey]
        )
        
        for i in 0..<stripes.count {
            stripes[i].snp.makeConstraints { make in
                if i == 0 {
                    make.top.equalToSuperview().offset(90)
                    make.centerX.equalToSuperview()
                } else {
                    make.top.equalTo(stripes[i - 1].snp.bottom).offset(55)
                    make.centerX.equalToSuperview()
                }
            }
        }
        
        for i in 0..<textFields.count {
            textFields[i].snp.makeConstraints { make in
                if i == 0 {
                    make.top.equalToSuperview().offset(60)
                    make.left.equalTo(stripe1).offset(8)
                } else {
                    make.top.equalTo(textFields[i - 1].snp.bottom).offset(33)
                    make.left.equalTo(stripe1).offset(8)
                }
            }
        }
        
        showHideButton1.snp.makeConstraints { make in
            make.centerY.equalTo(textField4)
            make.right.equalTo(stripe4)
        }
        
        showHideButton2.snp.makeConstraints { make in
            make.centerY.equalTo(textField5)
            make.right.equalTo(stripe5)
        }
    }
//     func updateImage(for stripe: UIImageView, withState state: FieldState) {
//        switch state {
//        case .inactive:
//            stripe.image = UIImage(named: "strip")
//        case .active:
//            stripe.image = UIImage(named: "glow")
//        case .invalid:
//            stripe.image = UIImage(named: "invalidImage")
//        }
//    }

    
//    func updateFieldsState() {
//        for (index, textField) in textFields.enumerated() {
//            let state = fieldStates[index]
//            let stripe = stripes[index]
//
//            switch state {
//            case .inactive:
//                configureInactiveState(for: textField, and: stripe)
//            case .active:
//                configureActiveState(for: textField, and: stripe)
//            case .invalid:
//                if validateInput(textField) {
//                    configureValidState(for: textField, and: stripe)
//                } else {
//                    configureInvalidState(for: textField, and: stripe)
//                }
//            }
//
//            updateImage(for: stripe, withState: state)
//        }
//    }



    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            guard let index = textFields.firstIndex(of: textField) else { return true }

            switch index {
            case 0..<textFields.count - 1:
                textFields[index + 1].becomeFirstResponder()
            case textFields.count - 1:
                textField.resignFirstResponder()
            default:
                break
            }

            return true
        }

    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//            guard let text = textField.text else { return true }

            switch textField {
            case textField1:
                return validateNumericInput(string)
            case textField2:
                // Другие проверки...
                return true
            // Добавьте проверки для остальных текстовых полей
            default:
                return true
            }
        }

//        private func configureInactiveState(for textField: UITextField, and stripe: UIImageView) {
//            textField.isEnabled = false
//            textField.backgroundColor = UIColor.lightGray
//            textField.placeholder = "Неактивное поле"
//            stripe.tintColor = UIColor.lightGray
//        }
//
//        private func configureActiveState(for textField: UITextField, and stripe: UIImageView) {
////            textField.isEnabled = true
//            textField.backgroundColor = UIColor.white
//            textField.placeholder = "Активное поле"
//            stripe.image = UIImage(named: "glow")
//        }
//
//        private func configureValidState(for textField: UITextField, and stripe: UIImageView) {
//            textField.isEnabled = true
//            textField.backgroundColor = UIColor.white
//            textField.placeholder = "Данные валидны"
//            stripe.tintColor = UIColor.green
//        }
//
//        private func configureInvalidState(for textField: UITextField, and stripe: UIImageView) {
//            textField.isEnabled = true
//            textField.backgroundColor = UIColor.red
//            textField.placeholder = "Неверные данные"
//            stripe.tintColor = UIColor.red
//        }

        private func validateNumericInput(_ string: String) -> Bool {
            let allowedCharacters = CharacterSet(charactersIn: "0123456789")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }

        private func validateInput(_ textField: UITextField) -> Bool {
            guard let text = textField.text else { return false }

            switch textField {
            case textField1:
                return validateNumericInput(text)
            case textField2:
                // Другие проверки...
                return true
            // Добавьте проверки для остальных текстовых полей
            default:
                return true
            }
        }
    
    @objc func backButtonTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    @objc func showHideButton1Tapped() {
        showHideButton1.isSelected.toggle()
        textField4.isSecureTextEntry.toggle()
    }
    
    @objc func showHideButton2Tapped() {
        showHideButton2.isSelected.toggle()
        textField5.isSecureTextEntry.toggle()
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let index = textFields.firstIndex(of: textField) else { return }
        
        let stripe = stripes[index]
        stripe.image = UIImage(named: "glow")

        print("Начало редактирования текстового поля")
    }


    public func textFieldDidEndEditing(_ textField: UITextField) {
        guard let index = textFields.firstIndex(of: textField) else { return }

        let stripe = stripes[index]
        stripe.image = UIImage(named: "strip")
        
        guard let text = textField.text else { return false }

        switch textField {
        case textField1:
            return validateNumericInput(text)
        case textField2:
            // Другие проверки...
            return true
        // Добавьте проверки для остальных текстовых полей
        default:
            return true
        }
        
        print("Окончание редактирования текстового поля")
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            print("Изменение значения текстового поля: \(text)")
        }
    }
}
