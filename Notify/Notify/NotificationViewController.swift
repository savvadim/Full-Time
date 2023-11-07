import UIKit
import SnapKit
import Color
import Font

open class NotificationViewController: UIViewController {
    
    private let safeView = UIView()
    
    private let notifyButton = NotifyButton(icon: UIImage(named: "mark"), mainLabel: "Доска успешно создана", dataLabel: "15.08.2023 13:58", linkLabel: "Перейти к доске")
    
    private let notificationLabel = UILabel()

    override open func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.backColor
        
        notificationLabel.textColor = .white
        notificationLabel.text = "Уведомления"
        notificationLabel.font = CustomFont.SemiBold
        navigationItem.titleView = notificationLabel

        view.addSubview(safeView)
        
        safeView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        safeView.addSubview(notifyButton)
        
        notifyButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
//            make.size.equalTo(CGSize(width: 345, height: 120))
        }
    }
}
