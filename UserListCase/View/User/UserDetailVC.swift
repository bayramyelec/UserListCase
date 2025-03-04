//
//  UserDetailVC.swift
//  UserListCase
//
//  Created by Bayram Yeleç on 4.03.2025.
//

import UIKit

class UserDetailVC: UIViewController {
    
    var user: User?
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "person.circle")
        imageView.tintColor = .secondaryLabel
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        return stackView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let websiteLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()
    
    private let companyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        componentSetup()
        configure()
    }
    
    private func setupNavigationBar(){
        navigationItem.title = user?.username
    }
    
    private func componentSetup(){
        view.addSubview(stackView)
        view.addSubview(userImageView)
        view.addSubview(nameLabel)
        [emailLabel, phoneLabel, websiteLabel, addressLabel, companyLabel].forEach { stackView.addArrangedSubview($0) }
        
        userImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(150)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
        }
    }
    
    private func configure(){
        guard let user = self.user else { return }
        nameLabel.text = user.name
        emailLabel.text = "E-mail: \(user.email)"
        phoneLabel.text = "Phone: \(user.phone)"
        websiteLabel.text = "Website: \(user.website)"
        addressLabel.text = "Adress: \(user.address.street), \(user.address.suite), \(user.address.city), \(user.address.zipcode)"
        companyLabel.text = "Company: \(user.company.name), \(user.company.catchPhrase), \(user.company.bs)"
    }
    
}
