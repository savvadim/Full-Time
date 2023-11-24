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
            }
        }
        return true
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
        print("efdljnvjekfs")
    }
}
