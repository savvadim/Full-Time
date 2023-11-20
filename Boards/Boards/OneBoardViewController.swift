import Foundation
import Color
import Font
import UIKit

open class OneBoardViewController: UIViewController {
    
    private let safeView = UIView()
    
    private let boardLabel = UILabel()
    private let progressLabel = UILabel()
    
    private let backButton = UIButton()
    private let addButton = UIButton()
    private let todoButton = UIButton()
    private let inrevButton = UIButton()
    
    private let backBlue = UIImageView()
    
    private var barButtonItem: UIBarButtonItem!
    private let boardTaskButton = BoardTaskButton(mainLabel: "ofjlsvkn", commentLabel: "jikfsnv")
   
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.backColor
        
        boardLabel.text = "Доска Задач"
        boardLabel.textColor = .white
        boardLabel.font = CustomFont.BoldLarge
        navigationItem.titleView = boardLabel
        
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        barButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = barButtonItem
        
        view.addSubview(safeView)
        
        safeView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        safeView.addSubview(boardTaskButton)
        boardTaskButton.addTarget(self, action: #selector(boardTaskButtonTapped), for: .touchUpInside)
        
        boardTaskButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(65)
        }
        
        addButton.layer.cornerRadius = 8
        addButton.setTitle("Создать задачу", for: .normal)
        addButton.titleLabel?.font = CustomFont.RegularLarge
        addButton.backgroundColor = UIColor.customBlue
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        safeView.addSubview(addButton)
        
        addButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 366, height: 59))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(34)
        }
        
        backBlue.image = UIImage(named: "backBlue")
        backBlue.contentMode = .scaleAspectFit
        safeView.addSubview(backBlue)
        
        backBlue.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        safeView.addSubview(progressLabel)
        
        progressLabel.text = "IN PROGRESS"
        progressLabel.textColor = .white
        progressLabel.font = CustomFont.RegularLarge
        
        progressLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        safeView.addSubview(todoButton)
        todoButton.setTitle("TO DO", for: .normal)
        todoButton.setTitleColor(UIColor.customBlue, for: .normal)
        
        safeView.addSubview(inrevButton)
        inrevButton.setTitleColor(UIColor.customBlue, for: .normal)
        inrevButton.setTitle("IN REVIEW", for: .normal)
        
        
        todoButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(15)
        }
        
        inrevButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(15)
        }
    }
    
    @objc func backButtonTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func boardTaskButtonTapped(sender: UIButton) {
        print("kjfsnmc,")
    }
    
    @objc func addButtonTapped(sender: UIButton) {
        print("eklfblk")
    }
}
