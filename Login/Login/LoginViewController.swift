//
//  LoginViewController.swift
//  Login
//
//  Created by Vladislav Skuratov on 09.12.2022.
//

import Foundation
import UIKit
import SnapKit

open class LoginViewController: UIViewController {
    override open func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        let entryView = UIView()
        entryView.backgroundColor = UIColor(red: 0.06, green: 0.06, blue: 0.06, alpha: 1)
        view.addSubview(entryView)
        
        entryView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(442)
        }
        
        let logoLabel = UILabel()
        logoLabel.textColor = UIColor(red: 0.44, green: 0.67, blue: 0.92, alpha: 1)
        logoLabel.text = "Планировщик «Full Time»"
        logoLabel.font = UIFont(name: "Poppins-Regular", size: 24)
        view.addSubview(logoLabel)
        
        logoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(223)
        }
    
    }
}
