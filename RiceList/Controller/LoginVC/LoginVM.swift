//
//  ListVM.swift
//  RiceList
//
//  Created by MA-15 on 28/07/23.
//

import Foundation

protocol LoginVMDelegate: AnyObject {
    func loginVMDidUpdate(_ viewModel: String)
}

final class LoginVM {
    init() {
    }
    var delegate: LoginVMDelegate?

    var posts: String? {
        didSet {
            delegate?.loginVMDidUpdate("")
            //delegate?.loginVMDidUpdate(self)
        }
    }
    
    func requestLogin(email: String, password: String) {
        WSManager.shared.login(email: email, password: password) { res in
            switch(res){
                case .success(let response):
                    print(response)
                    self.posts = ""
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
