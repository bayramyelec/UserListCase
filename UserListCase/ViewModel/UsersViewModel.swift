//
//  UsersViewModel.swift
//  UserListCase
//
//  Created by Bayram Yeleç on 4.03.2025.
//

import Foundation

class UsersViewModel {
    
    // Burada kullandığım didset, user dizisinde herhangi bir değişiklik olduğunda reloadUsers closureunu çalıştırıyor.
    
    var users: [User] = [] {
        didSet {
            reloadUsers?()
        }
    }
    
    var reloadUsers: (() -> Void)?
    
    func fetchUsers(){
        NetworkManager.shared.fetchUsers { users in
            switch users {
            case .success(let success):
                self.users = success
                self.reloadUsers?()
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}
