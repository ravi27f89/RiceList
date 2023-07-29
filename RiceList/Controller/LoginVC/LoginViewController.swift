//
//  LoginViewController.swift
//  RiceList
//
//  Created by MA-15 on 28/07/23.
//

import UIKit

class LoginViewController: UIViewController{
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var loginVM = LoginVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginVM.delegate = self
    }
}

extension LoginViewController: LoginVMDelegate {
    func loginVMDidUpdate(_ viewModel: String) {
        DispatchQueue.main.async {
            if let listVC = UIStoryboard.init(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "ListViewController") as? ListViewController{
                self.navigationController?.pushViewController(listVC, animated: true)
            }
        }
    }
}

// MARK: - 🆗 Button Action Events 🆗
extension LoginViewController {
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        if (txtEmail.text!.count > 0 && txtPassword.text!.count > 0){
            loginVM.requestLogin(email: txtEmail.text!, password: txtPassword.text!)
        } else {
            let alert = UIAlertController(title: "Kindly add username and password", message: nil, preferredStyle: .actionSheet)

            let okAction = UIAlertAction(title: "Dismiss", style: .destructive) { _ in
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnSignupClicked(_ sender: UIButton) {
        if let gamePlayVC = UIStoryboard.init(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController{
            self.navigationController?.pushViewController(gamePlayVC, animated: true)
        }
    }
}
