//
//  UsersVC.swift
//  UserListCase
//
//  Created by Bayram Yeleç on 4.03.2025.
//

import UIKit
import SnapKit

class UsersVC: UIViewController {
    
    private let usersTableView = UITableView()
    
    private var viewModel = UsersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        setupTableView()
        viewModel.fetchUsers()
    }
    
    private func setupTableView(){
        usersTableView.delegate = self
        usersTableView.dataSource = self
        usersTableView.register(UserCell.self, forCellReuseIdentifier: UserCell.identifier)
        view.addSubview(usersTableView)
        usersTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        viewModel.reloadUsers = { [weak self] in
            self?.usersTableView.reloadData()
        }
    }
    
    private func setupNavigationBar(){
        navigationItem.title = "Users"
    }
    
}

extension UsersVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier, for: indexPath) as! UserCell
        let user = viewModel.users[indexPath.row]
        cell.configure(with: user)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userDetailVC = UserDetailVC()
        let user = viewModel.users[indexPath.row]
        userDetailVC.user = user
        navigationController?.pushViewController(userDetailVC, animated: true)
    }
}
