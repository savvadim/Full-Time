import UIKit
import Color
import Font

class NoticeButton: UIView {
    
    private let noticeView = UIImageView()
    private let logoView = UIImageView()
    private let nextView = UIImageView()
    private let noticeLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.white
        layer.cornerRadius = 15
        clipsToBounds = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
        self.addGestureRecognizer(tapGesture)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        
        noticeView.image = UIImage(named: "notiBlue")
        addSubview(noticeView)
        
        logoView.image = UIImage(named: "fullNoti")
        logoView.contentMode = .scaleAspectFit
        addSubview(logoView)
        
        nextView.image = UIImage(named: "nextBlue")
        addSubview(nextView)
        
        noticeLabel.text = "У вас 15 непрочитанных\nуведомлений"
        noticeLabel.numberOfLines = 0
        noticeLabel.textColor = UIColor.customBlue
        noticeLabel.font = CustomFont.RegularLarge
        addSubview(noticeLabel)
        
        noticeView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(21)
            make.left.equalToSuperview().offset(18)
            make.width.equalTo(33)
            make.height.equalTo(34)
        }
        
        logoView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(210)
        }
        
        nextView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(20)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        noticeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(noticeView)
            make.left.equalToSuperview().offset(60)
        }
    }
    
    @objc private func buttonTapped() {
        print("notifications")
    }
}
