import UIKit
import SnapKit
import Color
import Font

open class NotificationViewController: UIViewController {
    
    private let safeView = UIView()
    
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
    }
}
