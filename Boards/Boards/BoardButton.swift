import UIKit
import Design

class BoardButton: UIView, UITextViewDelegate {
    
    private let logoView = UIImageView()
    
    private let mainLabel = UILabel()
    private let dataLabel = UILabel()
    
    
    init(mainLabel: String?, dataLabel: String?) {
        super.init(frame: .zero)
        backgroundColor = UIColor.buttonGrey
        layer.cornerRadius = 15
        clipsToBounds = true
        
        setupUI()
        
        if let mainLabel = mainLabel {
            self.mainLabel.text = mainLabel
        }
        
        if let dataLabel = dataLabel {
            self.dataLabel.text = dataLabel
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
        
        dataLabel.textColor = .white
        dataLabel.font = CustomFont.RegularSmall
        addSubview(dataLabel)
        
        mainLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(18)
            make.top.equalToSuperview().offset(10)
            make.size.equalTo(CGSize(width: 254, height: 48))
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
