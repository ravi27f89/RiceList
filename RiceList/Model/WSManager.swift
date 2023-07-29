//
//  WSManager.swift
//  RiceList
//
//  Created by MA-15 on 28/07/23.
//

import Foundation

internal struct API {

    struct URL {
        static let BASEURL = "https://reqres.in/api/"
    }

    struct Response {
        static let status = "status"
        static let code = "code"
    }

    struct RequestHeader {
        static let deviceUniqueId = "deviceUniqueId"
    }

    struct Request {
        static let data = "data"
    }
}

enum EndPoint: String, Path {
    case login
    case signup
    case users
    case addUser
    

}

/// 📣`Network Mange Web Service Request`
class WSManager {
    
    static let shared = WSManager()
  
    func getPosts(completion: @escaping (Result<PostModel, Error>) -> ()){

        guard let url = URL(string: API.URL.BASEURL+EndPoint.users.rawValue) else {return}

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { (data, response, err) in
            if let err = err{
                completion(.failure(err))
            } else {
                if let data = data {
                    do{
                        let response = try JSONDecoder().decode(PostModel.self, from: data)
                        completion(.success(response))
                    } catch let jsonError{
                        completion(.failure(jsonError))
                    }
                }
            }
        }.resume()
    }
    
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> ()){

        guard let url = URL(string: API.URL.BASEURL+EndPoint.login.rawValue) else {return}

        var request = URLRequest(url: url)
        let parameterDictionary = ["email": email, "password": password]
        let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: [])
        request.httpBody = httpBody
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            if let err = err{
                completion(.failure(err))
            } else {
                if let data = data {
                    do{
                        let response = try JSONDecoder().decode(LoginResponse.self, from: data)
                        completion(.success(response))
                    } catch let jsonError{
                        completion(.failure(jsonError))
                    }
                }
            }
        }.resume()
    }
    
    func signup(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> ()){

        guard let url = URL(string: API.URL.BASEURL+EndPoint.signup.rawValue) else {return}

        var request = URLRequest(url: url)
        let parameterDictionary = ["email": email, "password": password]
        let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: [])
        request.httpBody = httpBody
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            if let err = err{
                completion(.failure(err))
            } else {
                if let data = data {
                    do{
                        let response = try JSONDecoder().decode(LoginResponse.self, from: data)
                        completion(.success(response))
                    } catch let jsonError{
                        completion(.failure(jsonError))
                    }
                }
            }
        }.resume()
    }

}
