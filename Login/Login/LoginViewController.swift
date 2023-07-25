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
        let logoView = UIView()
//        logoView.backgroundColor = .white
        view.addSubview(logoView)
        
        logoView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 70, height: 70))
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(139)
        }
        
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "Subtract")
        logoView.addSubview(logoImage)
        
        logoImage.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        let fullLabel = UILabel()
        fullLabel.textColor = UIColor(red: 0.44, green: 0.67, blue: 0.92, alpha: 1)
        fullLabel.text = "Full"
        fullLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        logoView.addSubview(fullLabel)
        
        fullLabel.snp.makeConstraints { make in
            make.centerX.equalTo(logoImage)
            make.centerY.equalTo(logoImage)
        }
        
        let timeLabel = UILabel()
        timeLabel.textColor = UIColor(red: 0.44, green: 0.67, blue: 0.92, alpha: 1)
        timeLabel.text = "Time"
        timeLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        logoView.addSubview(timeLabel)
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(52)
            make.left.equalToSuperview().offset(30)
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
