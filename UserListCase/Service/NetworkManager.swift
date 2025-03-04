//
//  NetworkManager.swift
//  UserListCase
//
//  Created by Bayram Yeleç on 4.03.2025.
//

import Foundation
import Alamofire

class NetworkManager {
    
    // Her yerden erişilebilir olması için static yaptım.
    
    static let shared = NetworkManager()
    
    private init() {}
    
    // Burada tipini belirtmeyerek kod fazlalığından kurtuldum. Alamofire kütüphanesi ile daha az kod yazarak aynı işlevi yerine getirdim.
    
    private func fetchData<T: Decodable>(_ endpoint: EndPoint, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(endpoint.urlRequest()).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void){
        let endPoint = EndPoint.getUsers
        fetchData(endPoint, completion: completion)
    }
}
