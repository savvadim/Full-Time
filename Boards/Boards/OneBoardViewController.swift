import Foundation
import Color
import Font
import UIKit

open class OneBoardViewController: UIViewController {
    
    private let safeView = UIView()
    
    private let boardLabel = UILabel()
    private let backButton = UIButton()
    
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
        
        safeView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        safeView.addSubview(boardTaskButton)
        boardTaskButton.addTarget(self, action: #selector(boardTaskButtonTapped), for: .touchUpInside)
        
        boardTaskButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(65)
        }
        
    }
    
    @objc func backButtonTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func boardTaskButtonTapped(sender: UIButton) {
        print("kjfsnmc,")
    }
}
