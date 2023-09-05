import UIKit
import Foundation
import SnapKit
import Color
import Font

open class CreateBoardViewController: UIViewController {
    
    private let safeView = UIView()
    
    private let boardsLabel = UILabel()
    private let addLabel = UILabel()
    
    private let nameField = UITextField()
    private let column1Field = UITextField()
    private let column2Field = UITextField()
    
    private let checkButton = UIButton()
    private let uploadButton = UIButton()
    private let backButton = UIButton()
    private let addColumnButton = UIButton()
    private let createButton = UIButton()
    
    private let nameStrip = UIImageView()
    private let column1Strip = UIImageView()
    private let column2Strip = UIImageView()
    
    private var stackView: UIStackView!
    
    private var barButtonItem: UIBarButtonItem!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.backColor
        
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
//        let boardsLabel = UILabel()
        boardsLabel.text = "Создать доску"
        boardsLabel.textColor = .white
        boardsLabel.font = CustomFont.BoldLarge
        navigationItem.titleView = boardsLabel
        
//        let backButton = UIButton()
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
//        let barButtonItem = UIBarButtonItem(customView: backButton)
        barButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = barButtonItem
        
//        let safeView = UIView()
        view.addSubview(safeView)
        
        safeView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
//        let nameField = UITextField()
        nameField.attributedPlaceholder = NSAttributedString(
            string: "Название доски",
            attributes: [.foregroundColor: UIColor.customGrey]
        )
        nameField.font = CustomFont.RegularMedium
        nameField.textColor = .white
//        nameField.delegate = self
        safeView.addSubview(nameField)
        
        nameField.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(50)
        }
        
//        let nameStrip = UIImageView()
        nameStrip.image = UIImage(named: "strip")
        safeView.addSubview(nameStrip)
       
        nameStrip.snp.makeConstraints { make in
            make.top.equalTo(nameField.snp.bottom).offset(6)
            make.centerX.equalToSuperview()
        }
        
//        let checkButton = UIButton()
        checkButton.setImage(UIImage (named: "hover"), for: .normal)
        checkButton.setImage(UIImage (named: "active"), for: .selected)
        checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        safeView.addSubview(checkButton)

        checkButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 15, height: 15))
            make.top.equalToSuperview().offset(117)
            make.left.equalToSuperview().offset(42)
        }
        
//        let addLabel = UILabel()
        addLabel.text = "Добавить аватар доски"
        addLabel.font = CustomFont.RegularMedium
        addLabel.textColor = .white
        stackView.addSubview(addLabel)
        
        addLabel.snp.makeConstraints { make in
            make.centerY.equalTo(checkButton)
            make.left.equalTo(checkButton.snp.right).offset(7)
        }
        
//        let uploadButton = UIButton()
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: UIColor.white,
            .font: CustomFont.RegularSmall as Any
        ]
        uploadButton.setAttributedTitle(NSAttributedString(string: "Загрузить изображение", attributes: attributes), for: .normal)
        uploadButton.addTarget(self, action: #selector(uploadButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(uploadButton)
        
        uploadButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(145)
        }
        
//        let column1Field = UITextField()
        column1Field.attributedPlaceholder = NSAttributedString(
            string: "Столбец 1",
            attributes: [.foregroundColor: UIColor.customGrey]
        )
        column1Field.font = CustomFont.RegularMedium
        column1Field.textColor = .white
//        column1Field.delegate = self
        safeView.addSubview(column1Field)
        
        column1Field.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(156)
            make.left.equalToSuperview().offset(50)
        }
        
//        let column1Strip = UIImageView()
        column1Strip.image = UIImage(named: "strip")
        safeView.addSubview(column1Strip)
       
        column1Strip.snp.makeConstraints { make in
            make.top.equalTo(column1Field.snp.bottom).offset(6)
            make.centerX.equalToSuperview()
        }
        
//        let column2Field = UITextField()
        column2Field.attributedPlaceholder = NSAttributedString(
            string: "Столбец 2",
            attributes: [.foregroundColor: UIColor.customGrey]
        )
        column2Field.font = CustomFont.RegularMedium
        column2Field.textColor = .white
//        column2Field.delegate = self
        safeView.addSubview(column2Field)
        
        column2Field.snp.makeConstraints{ make in
            make.top.equalTo(column1Strip.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(50)
        }
        
//        let column2Strip = UIImageView()
        column2Strip.image = UIImage(named: "strip")
        safeView.addSubview(column2Strip)
       
        column2Strip.snp.makeConstraints { make in
            make.top.equalTo(column2Field.snp.bottom).offset(6)
            make.centerX.equalToSuperview()
        }
        
//        let addColumnButton = UIButton()
        addColumnButton.backgroundColor = .white
        addColumnButton.setTitle("Добавить столбец", for: .normal)
        addColumnButton.titleLabel?.font = CustomFont.RegularLarge
        addColumnButton.setTitleColor(UIColor.customBlue, for: .normal)
        addColumnButton.addTarget(self, action: #selector(addColumnButtonTapped), for: .touchUpInside)
        addColumnButton.layer.cornerRadius = 8
        safeView.addSubview(addColumnButton)

        addColumnButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 365, height: 60))
            make.bottom.equalToSuperview().inset(113)
            make.centerX.equalToSuperview()
        }
        
//        let createButton = UIButton()
        createButton.backgroundColor = UIColor.customBlue
        createButton.setTitle("Создать доску", for: .normal)
        createButton.titleLabel?.font = CustomFont.RegularLarge
        createButton.setTitleColor(UIColor.white, for: .normal)
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        createButton.layer.cornerRadius = 8
        safeView.addSubview(createButton)

        createButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 365, height: 60))
            make.bottom.equalToSuperview().inset(34)
            make.centerX.equalToSuperview()
        }

    }
    
    @objc func checkButtonTapped(sender: UIButton) {
        checkButton.isSelected.toggle()
    }
    
    @objc func addColumnButtonTapped(sender: UIButton) {
        print("add")
    }
    
    @objc func createButtonTapped(sender: UIButton) {
        print("create")
    }
    
    @objc func backButtonTapped(sender: UIButton) {
        print("back")
    }
    
    @objc func uploadButtonTapped(sender: UIButton) {
        print("upload")
    }

}
