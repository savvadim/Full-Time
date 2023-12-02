import Foundation
import UIKit
import SnapKit
import Design

open class BoardsViewController: UIViewController {
    
    private let safeView = UIView()
    private let tableView = UITableView()
    
    private let boardsLabel = UILabel()
    
    private let createButton = UIButton()
    
    private let taskButton = TasksButton()
    private let notiButton = NoticeButton()
    private let boardButton = BoardButton(mainLabel: "JDcejsdl", dataLabel: "647239810")
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.backColor
        
        safeView.addSubview(taskButton)
        
        taskButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.size.equalTo(CGSize(width: 345, height: 100))
        }
        
        safeView.addSubview(notiButton)
        
        notiButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(taskButton.snp.bottom).offset(20)
            make.size.equalTo(CGSize(width: 345, height: 75))
        }
        
        safeView.addSubview(boardButton)
        
        boardButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(notiButton.snp.bottom).offset(40)
        }
        
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
        createButton.layer.cornerRadius = 8
        createButton.setTitle("Создать доску", for: .normal)
        createButton.titleLabel?.font = CustomFont.RegularLarge
        createButton.backgroundColor = UIColor.customBlue
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        safeView.addSubview(createButton)
        
        createButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 366, height: 59))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(34)
        }
        
//        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BoardsTableViewCell.self, forCellReuseIdentifier: "YourTableViewCell")
        view.addSubview(tableView)
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
        let secondViewController = OneBoardViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
