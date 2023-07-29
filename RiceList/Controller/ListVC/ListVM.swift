//
//  ListVM.swift
//  RiceList
//
//  Created by MA-15 on 28/07/23.
//

import Foundation

protocol ListVMDelegate: AnyObject {
    func listVMDidUpdate(_ viewModel: ListVM)
}

final class ListVM {
    init() {
        requestPostWebService()
    }
    var delegate: ListVMDelegate?

    var posts: PostModel? {
        didSet {
            delegate?.listVMDidUpdate(self)
        }
    }
    
    var listCount: Int {
        return posts?.userdata.count ?? 0
    }

    func post(at index: Int) -> Usrelist {
        return (posts?.userdata[index])!
    }


    func requestPostWebService() {
        WSManager.shared.getPosts { res in
            switch(res){
                case .success(let response):
                    self.posts = response
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }

}
