import UIKit
import SnapKit
import Design

open class TasksViewController: UIViewController {
    
    private let safeView = UIView()
    
    private let profileLabel = UILabel()
    private let taskButton = TaskButton()
    

    override open func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.backColor
        
        profileLabel.textColor = .white
        profileLabel.text = "Мои задачи"
        profileLabel.font = CustomFont.SemiBold
        navigationItem.titleView = profileLabel

        view.addSubview(safeView)
        
        safeView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        safeView.addSubview(taskButton)
        
        taskButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.size.equalTo(CGSize(width: 345, height: 120))
        }
    }
}
