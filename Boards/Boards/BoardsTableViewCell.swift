import Foundation
import UIKit
import SnapKit

class BoardsTableViewCell: UITableViewCell {
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        // Настройте внешний вид ячейки, добавьте и расположите элементы UI
        // Пример:
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)

        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true

        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true

        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        subtitleLabel.textColor = UIColor.gray
        // ...
    }
}
