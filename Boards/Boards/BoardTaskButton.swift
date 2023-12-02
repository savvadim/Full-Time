import UIKit
import Design

class BoardTaskButton: UIButton {
    
    private let logoView = UIImageView()
    
    private let mainLabel = UILabel()
    private let commentLabel = UILabel()
    
    init(mainLabel: String?, commentLabel: String?) {
        super.init(frame: .zero)
        backgroundColor = UIColor.buttonGrey
        layer.cornerRadius = 15
        clipsToBounds = true
        
        setupUI()
        
        if let mainLabel = mainLabel {
            self.mainLabel.text = mainLabel
        }
        
        if let commentLabel = commentLabel {
            self.commentLabel.text = commentLabel
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
        
        mainLabel.text =  "Заголовок"
        mainLabel.textColor = .white
        mainLabel.font = CustomFont.RegularLarge
        addSubview(mainLabel)
        
        commentLabel.text = "kjdfm,scnvlksnclz,mdafgnabklsrglkasnakl.fbnaklbnzlkfs,xbklsnvqvw r.knvslka.nsklv.anlksf.nvklas.fnkle.anrsk;bna;sr.,dnblaksfbnlkv.,snrlkfz.dvnklskdnklvas.dz"
        commentLabel.textColor = .white
        commentLabel.numberOfLines = 0
        commentLabel.font = CustomFont.RegularMedium
        addSubview(commentLabel)
        
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
    }
    
//    @objc func boardButtonTapped (){
//        print("jefksvln")
//    }
}
