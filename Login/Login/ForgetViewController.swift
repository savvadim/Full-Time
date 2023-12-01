import UIKit
import Foundation
import Font

open class ForgetViewController: UIViewController {
    
    private let safeView = UIView()
    
    private let logoImage = UIImageView()
    private let stripImage = UIImageView()
    
    private let backButton = UIButton()
    private let enterButton = UIButton()
    
    private let forgetLabel = UILabel()
    private let textLabel = UILabel()
    
    private let emailField = UITextField()
    
    private var barButtonItem = UIBarButtonItem()

    override open func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.backColor
        
        forgetLabel.textColor = .white
        forgetLabel.text = "Восстановление пароля"
        forgetLabel.font = CustomFont.SemiBold
        navigationItem.titleView = forgetLabel

        view.addSubview(safeView)
        
        safeView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        barButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = barButtonItem
        
        textLabel.textColor = UIColor.privacyGrey
        textLabel.font = CustomFont.Roboto
        textLabel.text = "Пожалуйста, проверьте свою почту и перейдите\nпо ссылке в письме"
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 0
        
        safeView.addSubview(textLabel)
        
        textLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(60)
            make.centerX.equalToSuperview()
        }
        
        enterButton.backgroundColor = UIColor.customBlue
        enterButton.addTarget(self, action: #selector(enterTapped), for: .touchUpInside)
        enterButton.setTitle("Продолжить", for: .normal)
        enterButton.layer.cornerRadius = 8
        safeView.addSubview(enterButton)
    
        enterButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 365, height: 60))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(153)
        }
        
        logoImage.image = UIImage(named: "fullBack")
        logoImage.contentMode = .scaleAspectFill
        safeView.addSubview(logoImage)
        
        logoImage.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalToSuperview().offset(190)
        }
        
        stripImage.image = UIImage(named: "strip")
        safeView.addSubview(stripImage)
        
        stripImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(90)
        }
        
        emailField.textColor = .white
        emailField.delegate = self
        emailField.font = CustomFont.RegularMedium
        emailField.attributedPlaceholder = NSAttributedString(
            string: "Введите e-mail",
            attributes: [.foregroundColor: UIColor.customGrey]
        )
        safeView.addSubview(emailField)
        
        emailField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 302, height: 24))
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func backButtonTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    @objc func enterTapped() {
        
//        guard NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: emailField.text)
//        else {
//            return print("wrong email")
//        }
        print("correct email")
    }
}

extension ForgetViewController: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        stripImage.image = UIImage(named: "glow")
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        stripImage.image = UIImage(named: "strip")
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        enterTapped()
        
        return true
    }
}
