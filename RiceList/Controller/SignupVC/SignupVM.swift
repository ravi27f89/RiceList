//
//  SignupVM.swift
//  RiceList
//
//  Created by MA-15 on 29/07/23.
//

import Foundation



protocol SignupVMDelegate: AnyObject {
    func signupVMDidUpdate(_ viewModel: String)
}

final class SignupVM {
    init() {
    }
    var delegate: SignupVMDelegate?

    var posts: String? {
        didSet {
            delegate?.signupVMDidUpdate("")
        }
    }
    
    func requestSignup(email: String, password: String) {
        WSManager.shared.signup(email: email, password: password) { res in
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
