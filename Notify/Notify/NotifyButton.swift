import UIKit
import Color
import Font

class NotifyButton: UIView {
    
    private let logoView = UIImageView()
    private let status = UIImageView()
    private let icon = UIImageView()
    
    private let mainLabel = UILabel()
    private let commentLabel = UILabel()
    
    
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
        
        mainLabel.text =  "Заголовок"
        mainLabel.textColor = .white
        mainLabel.font = CustomFont.RegularLarge
        addSubview(mainLabel)
        
        commentLabel.text = "kjdfm,scnvlksnclz,mdafgnabklsrglkasnakl.fbnaklbnzlkfs,xbklsnvqvw r.knvslka.nsklv.anlksf.nvklas.fnkle.anrsk;bna;sr.,dnblaksfbnlkv.,snrlkfz.dvnklskdnklvas.dz"
        commentLabel.textColor = .white
        commentLabel.numberOfLines = 0
        commentLabel.font = CustomFont.RegularMedium
        addSubview(commentLabel)
        
        icon.image = UIImage(named: "icon")
        icon.contentMode = .scaleAspectFit
        addSubview(icon)
        
        status.image = UIImage(named: "in progress")
        status.contentMode = .scaleAspectFit
        addSubview(status)
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9)
            make.left.equalToSuperview().offset(18)
        }
        
        commentLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(18)
            make.size.equalTo(CGSize(width: 315, height: 60))
        }
        
        logoView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(171)
        }
        
        icon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.right.equalToSuperview().inset(11)
        }
        
        status.snp.makeConstraints { make in
            make.center.equalTo(icon)
        }
    }
}
