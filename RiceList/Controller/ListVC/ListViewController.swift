//
//  ListViewController.swift
//  RiceList
//
//  Created by MA-15 on 28/07/23.
//

import UIKit
enum Const {
    static let prototypeCell = "postcell"
}

class ListViewController: UIViewController {
    @IBOutlet weak var tblPost: UITableView!
    var imageLoader = ImageLoader()
    private lazy var listVM: ListVM = {
        return .init()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        configureUI()
    }
    func configureUI() {
        self.listVM.delegate = self
        tblPost.dataSource = self
        tblPost.delegate = self
    }
    
    @IBAction func btnAddClicked(_ sender: UIButton) {
        let alert = UIAlertController(title: "Under Development", message: nil, preferredStyle: .actionSheet)

        let okAction = UIAlertAction(title: "Dismiss", style: .destructive) { _ in
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ListViewController: ListVMDelegate {
    func listVMDidUpdate(_ viewModel: ListVM) {
        DispatchQueue.main.async {
            self.tblPost.reloadData()
        }
    }
}

// MARK: - 🆗 Table View 💢  Data source 💢
extension ListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVM.posts?.userdata.count ?? 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let postCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let postCell = tableView.dequeueReusableCell(withIdentifier: Const.prototypeCell, for: indexPath)
        let model = listVM.post(at: indexPath.row)
        postCell.textLabel?.text = "\(model.firstName) \(model.lastName)"
        postCell.detailTextLabel?.text = model.email
        
        imageLoader.obtainImageWithPath(imagePath: model.avatar) { (image) in
            if let updateCell = tableView.cellForRow(at: indexPath) {
                postCell.imageView?.image = image
            }
        }

        return postCell
    }
}

// MARK: - 🆗 Table View 💢 Delegate 💢
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
