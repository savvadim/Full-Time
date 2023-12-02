import UIKit
import Design

class NotifyButton: UIView, UITextViewDelegate {
    
    private let logoView = UIImageView()
    private let icon = UIImageView()
    
    private let linkLabel = UILabel()
    private let mainLabel = UILabel()
    private let dataLabel = UILabel()
    
    
    init(icon: UIImage?, mainLabel: String?, dataLabel: String?, linkLabel: String?) {
        super.init(frame: .zero)
        backgroundColor = UIColor.buttonGrey
        layer.cornerRadius = 15
        clipsToBounds = true
        
        setupUI()
        
        if let icon = icon {
            self.icon.image = icon
        }
        
        if let mainLabel = mainLabel {
            self.mainLabel.text = mainLabel
        }
        
        if let dataLabel = dataLabel {
            self.dataLabel.text = dataLabel
        }
        
        if let linkLabel = linkLabel {
            self.linkLabel.text = linkLabel
        }
        
        snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 345, height: 120))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        
        logoView.image = UIImage(named: "Vector")
        logoView.contentMode = .scaleAspectFit
        addSubview(logoView)
        
        mainLabel.textColor = .white
        mainLabel.font = CustomFont.RegularLarge
        mainLabel.lineBreakMode = .byWordWrapping
        mainLabel.numberOfLines = 0
        addSubview(mainLabel)
        
        linkLabel.text = "Перейти к доск"
        linkLabel.textColor = .white
        linkLabel.font = CustomFont.RegularSmall
        let attributedText = NSAttributedString(string: linkLabel.text ?? "", attributes: [
                    NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
                ])
        linkLabel.attributedText = attributedText
        addSubview(linkLabel)
        
        dataLabel.textColor = .white
        dataLabel.font = CustomFont.RegularSmall
        addSubview(dataLabel)
        
        icon.contentMode = .scaleAspectFit
        addSubview(icon)
        
        icon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().inset(18)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.centerY.equalTo(icon)
            make.left.equalTo(icon).offset(51)
            make.size.equalTo(CGSize(width: 254, height: 48))
        }
        
        linkLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(10)
//            make.size.equalTo(CGSize(width: 315, height: 60))
        }
        
        logoView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(171)
        }
        
        dataLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(18)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
