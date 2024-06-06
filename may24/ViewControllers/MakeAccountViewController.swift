//
//  MakeAccountViewController.swift
//  may24
//
//  Created by 최병욱 on 5/31/24.
//

import UIKit

class MakeAccountViewController:UIViewController{
    
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var NicknameTextField: UITextField!
    
    
    
    
    @IBOutlet weak var ButtonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        
        ButtonView.layer.cornerRadius = 20
        ButtonView.layer.borderColor = UIColor.black.cgColor
        ButtonView.layer.borderWidth = 2
    }
    
}
