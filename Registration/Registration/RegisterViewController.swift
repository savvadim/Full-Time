import UIKit
import SnapKit
import Color
import Font

open class RegisterViewController: UIViewController {
    
    private let safeView = UIView()
    private let regLabel = UILabel()

    override open func viewDidLoad() {
        
        super.viewDidLoad()

        view.backgroundColor = UIColor.backColor
        
        regLabel.textColor = .white
        regLabel.text = "Регистарция"
        regLabel.font = CustomFont.SemiBold
        navigationItem.titleView = regLabel

        view.addSubview(safeView)
        
        safeView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
