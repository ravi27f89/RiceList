//
//  SignupViewController.swift
//  RiceList
//
//  Created by MA-15 on 28/07/23.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    var signupVM = SignupVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signupVM.delegate = self
    }
}

extension SignupViewController: SignupVMDelegate {
    func signupVMDidUpdate(_ viewModel: String) {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - 🆗 Button Action Events 🆗
extension SignupViewController {
    @IBAction func btnSignupClicked(_ sender: UIButton) {
        if (txtEmail.text!.count > 0 && txtPassword.text!.count > 0 && txtConfirmPassword.text!.count > 0){
            signupVM.requestSignup(email: txtEmail.text!, password: txtPassword.text!)
        } else {
            let alert = UIAlertController(title: "Kindly add username, password, confirm password ", message: nil, preferredStyle: .actionSheet)

            let okAction = UIAlertAction(title: "Dismiss", style: .destructive) { _ in
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
