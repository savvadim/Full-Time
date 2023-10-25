import UIKit
import Color
import Font

class NotifyButton: UIView, UITextViewDelegate {
    
    private let logoView = UIImageView()
    private let icon = UIImageView()
    
    private let linkLabel = UILabel()
    private let mainLabel = UILabel()
    
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.buttonGrey
        layer.cornerRadius = 15
        clipsToBounds = true
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        
        logoView.image = UIImage(named: "Vector")
        logoView.contentMode = .scaleAspectFit
        addSubview(logoView)
        
        mainLabel.text = "Доска БлаБлаБла успешно создана!"
        mainLabel.textColor = .white
        mainLabel.font = CustomFont.RegularLarge
        addSubview(mainLabel)
        
        linkLabel.text = "Перейти к доске"
        linkLabel.textColor = .white
        linkLabel.font = CustomFont.RegularSmall
        let attributedText = NSAttributedString(string: linkLabel.text ?? "", attributes: [
                    NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
                ])
        linkLabel.attributedText = attributedText
        addSubview(linkLabel)
        
        icon.image = UIImage(named: "mark")
        icon.contentMode = .scaleAspectFit
        addSubview(icon)
        
        icon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().inset(18)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.centerY.equalTo(icon)
            make.left.equalTo(icon).offset(51)
            make.size.equalTo(CGSize(width: 250, height: 50))
        }
        
        linkLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(10)
//            make.size.equalTo(CGSize(width: 315, height: 60))
        }
        
        logoView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(171)
        }

    }
}
