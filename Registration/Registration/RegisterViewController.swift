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
    private let regButton = UIButton()
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
            make.top.equalToSuperview().offset(190)
        }
        
        regLabel.textColor = .white
        regLabel.text = "Регистрация"
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
        privacyLabel.text = "Нажимая, вы соглашаетесь с политикой\nконфиденциальности"
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
        
        regButton.backgroundColor = UIColor.customBlue
        regButton.addTarget(self, action: #selector(regTapped), for: .touchUpInside)
        regButton.setImage(UIImage(named: "reg"), for: .normal)
        regButton.layer.cornerRadius = 8
        safeView.addSubview(regButton)
    
        regButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 365, height: 60))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(153)
        }
        
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
            textField.delegate = self
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
                make.left.equalTo(stripe1).offset(8)
                make.width.equalTo(275)
                if i == 0 {
                    make.top.equalToSuperview().offset(60)
                } else {
                    make.top.equalTo(textFields[i - 1].snp.bottom).offset(33)
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
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let index = textFields.firstIndex(of: textField) {
            if index < textFields.count - 1 {
                textFields[index + 1].becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
                regTapped()
            }
        }
        return true
    }

    public func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let index = textFields.firstIndex(of: textField) else { return }
        
        let stripe = stripes[index]
        stripe.image = UIImage(named: "glow")
        updateFieldState(index: index, state: .active)

        print("Начало редактирования текстового поля")
    }


    public func textFieldDidEndEditing(_ textField: UITextField) {
        guard let index = textFields.firstIndex(of: textField) else { return }

        let stripe = stripes[index]
        stripe.image = UIImage(named: "strip")
        updateFieldState(index: index, state: .inactive)
        
        print("Окончание редактирования текстового поля")
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            print("Изменение значения текстового поля: \(text)")
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
    
    @objc func regTapped() {
        if validateFields() {
            // Perform registration logic here
            print("efdljnvjekfs")
        } else {
            print("Registration tapped, fields are invalid.")
        }
    }
    
    private func validateTextField(_ text: String?, at index: Int) -> Bool {
        guard let text = text, !text.isEmpty, !text.contains(" ") else {
            updateFieldState(index: index, state: .invalid)
            return false
        }
        return true
    }
    
    private func validateFirstName(_ text: String?) -> Bool {
        return validateTextField(text, at: 0)
    }

    private func validateLastName(_ text: String?) -> Bool {
        return validateTextField(text, at: 1)
    }

    private func validateEmail(_ text: String?) -> Bool {
        guard validateTextField(text, at: 2),
              NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: text)
        else {
            return false
        }
        return true
    }

    private func validatePassword(_ text: String?) -> Bool {
        guard let text = text, text.count >= 6 else {
            updateFieldState(index: 3, state: .invalid)
            return false
        }
        return true
    }


    private func validateConfirmPassword(_ text: String?) -> Bool {
        guard validateTextField(text, at: 4), text == textField4.text else {
            return false
        }
        updateFieldState(index: 4, state: .active)
        return true
    }

    private func validateFields() -> Bool {
        var isValid = true

        for (index, textField) in textFields.enumerated() {
            let validation: (String?) -> Bool

            switch index {
            case 0: validation = validateFirstName
            case 1: validation = validateLastName
            case 2: validation = validateEmail
            case 3: validation = validatePassword
            case 4: validation = validateConfirmPassword
            default: fatalError("Unexpected index")
            }

            if !validation(textField.text) {
                isValid = false
                updateFieldState(index: index, state: .invalid)
            }
        }

        return isValid
    }


    private func updateFieldState(index: Int, state: FieldState) {
        fieldStates[index] = state

        switch state {
        case .inactive:
            stripes[index].image = UIImage(named: "strip")
        case .active:
            stripes[index].image = UIImage(named: "glow")
            textFields[index].textColor = .white
        case .invalid:
            stripes[index].image = UIImage(named: "red")
            textFields[index].textColor = .red
        }
    }
}
