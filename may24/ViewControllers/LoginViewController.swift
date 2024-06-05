//
//  LoginViewController.swift
//  may24
//
//  Created by 최병욱 on 5/31/24.
//

import UIKit

class LoginViewController:UIViewController{
    
    
    @IBOutlet weak var LoginButtonVIew: UIView!
    
    
    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var ErrorMessageLabel: UILabel!
    
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginButtonVIew.layer.borderColor = UIColor.black.cgColor
        LoginButtonVIew.layer.borderWidth = 2
        LoginButtonVIew.layer.cornerRadius = 20
        
        
        hideKeyboard()
    }
    
    
    @IBAction func LoginButtonTapped(_ sender: UIButton) {
        
        AuthenticationApi.shared.login(email: IDTextField.text!, password: PasswordTextField.text!){ res in
                    switch res {
                    case .success(let str):
                        guard let mpvc = self.storyboard?.instantiateViewController(identifier: "MypageVC") as? MypageViewController else { return }
                        self.navigationController?.pushViewController(mpvc, animated: true)
                    case .failure(let err):
                        self.ErrorMessageLabel.text = "로그인 실패"
                    }
                }
        
        
    }
    
    
    
}
