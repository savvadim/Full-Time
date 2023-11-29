import UIKit
import Foundation
import Font

class ForgetViewController: UIViewController {
    
    private let safeView = UIView()
    
    private let logoImage = UIImageView()
    private let stripImage = UIImageView()
    
    private let backButton = UIButton()
    private let enterButton = UIButton()
    
    private let forgetLabel = UILabel()
    private let textLabel = UILabel()
    
    private let emailField = UITextField()
    
    private var barButtonItem = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.backColor
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
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
    }
    
    @objc func backButtonTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    @objc func enterTapped() {
        print("jfnvsfndk")
    }
}
