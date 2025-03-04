//
//  UserCell.swift
//  UserListCase
//
//  Created by Bayram Yeleç on 4.03.2025.
//

import UIKit

class UserCell: UITableViewCell {
    
    static let identifier = "UserCell"
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let userEmailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .secondaryLabel
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        contentView.addSubview(arrowImageView)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(userEmailLabel)
        
        arrowImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(20)
            make.width.equalTo(10)
        }
        userNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(20)
            make.right.equalTo(arrowImageView.snp.left).offset(5)
        }
        userEmailLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(5)
            make.bottom.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(20)
            make.right.equalTo(arrowImageView.snp.left).offset(5)
        }
    }
    
    func configure(with user: User){
        userNameLabel.text = user.name
        userEmailLabel.text = user.email
    }
    
}
