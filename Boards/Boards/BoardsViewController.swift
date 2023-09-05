import Foundation
import UIKit
import SnapKit
import Color
import Font

open class BoardsViewController: UIViewController {
    
    private let safeView = UIView()
    private let tableView = UITableView()
    
    private let boardsLabel = UILabel()
    
    private let createButton = UIButton()
    private let tasksButton = UIButton()
    private let notifyButton = UIButton()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.backColor
        
//        let boardsLabel = UILabel()
        boardsLabel.text = "Все доски"
        boardsLabel.textColor = .white
        boardsLabel.font = CustomFont.BoldLarge
        navigationItem.titleView = boardsLabel
        
//        let safeView = UIView()
        view.addSubview(safeView)
        
        safeView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
//        let createButton = UIButton()
        createButton.layer.cornerRadius = 7
        createButton.setTitle("Создать доску", for: .normal)
        createButton.titleLabel?.font = CustomFont.RegularLarge
        createButton.backgroundColor = UIColor.customBlue
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        safeView.addSubview(createButton)
        
        createButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 325, height: 50))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
        
//        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BoardsTableViewCell.self, forCellReuseIdentifier: "YourTableViewCell")
        view.addSubview(tableView)
        
//        let tasksButton = UIButton()
        tasksButton.layer.cornerRadius = 15
        tasksButton.setTitle("Мои задачи", for: .normal)
        tasksButton.titleLabel?.font = CustomFont.RegularLarge
        tasksButton.backgroundColor = UIColor.customBlue
//        tasksButton.setImage(UIImage(named: "full"), for: .normal)
        safeView.addSubview(tasksButton)
        
        tasksButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30)
            make.size.equalTo(CGSize(width: 345, height: 100))
        }
        
//        let notifyButton = UIButton()
        notifyButton.layer.cornerRadius = 15
        notifyButton.setTitle("Уведомления", for: .normal)
        notifyButton.titleLabel?.font = CustomFont.RegularLarge
        notifyButton.setTitleColor(UIColor.customBlue, for: .normal)
        notifyButton.backgroundColor = .white
//        tasksButton.setImage(UIImage(named: "full"), for: .normal)
        safeView.addSubview(notifyButton)
        
        notifyButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(tasksButton.snp.bottom).offset(20)
            make.size.equalTo(CGSize(width: 345, height: 75))
        }
    }
}

extension BoardsViewController : UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataFromDatabase.count
        return 3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YourTableViewCell", for: indexPath) as! BoardsTableViewCell
//        let dataItem = dataFromDatabase[indexPath.row]
//        cell.titleLabel.text = dataItem.title
//        cell.subtitleLabel.text = dataItem.subtitle
        
        cell.titleLabel.text = "test"
        cell.subtitleLabel.text = "test1"
        return cell
    }
    
    @objc func createButtonTapped (){
        print("create")
    }
    
}
