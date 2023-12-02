import UIKit
import Design

class TasksButton: UIView {
    
    private let tasksView = UIImageView()
    private let logoView = UIImageView()
    private let nextView = UIImageView()
    private let myLabel = UILabel()
    private let newLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.customBlue
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
        
        tasksView.image = UIImage(named: "tasks")
        addSubview(tasksView)
        
        logoView.image = UIImage(named: "fullTask")
        logoView.contentMode = .scaleAspectFit
        addSubview(logoView)
        
        nextView.image = UIImage(named: "next")
        addSubview(nextView)
        
        myLabel.text = "Мои задачи"
        myLabel.textColor = UIColor.white
        myLabel.font = CustomFont.RegularLarge
        addSubview(myLabel)
        
        newLabel.text = "У Вас 5 новых задач"
        newLabel.textColor = UIColor.white
        newLabel.font = CustomFont.RegularMedium
        addSubview(newLabel)
        
        tasksView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(11.5)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        logoView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(159)
        }
        
        nextView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(20)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        myLabel.snp.makeConstraints { make in
            make.centerY.equalTo(tasksView)
            make.left.equalToSuperview().offset(52)
        }
        
        newLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(20)
        }
    }
    
    @objc private func buttonTapped() {
        print("my tasks")
    }
}
