//
//  LoginViewController.swift
//  may24
//
//  Created by 최병욱 on 5/31/24.
//

import UIKit

class LoginViewController:UIViewController{
    
    @IBOutlet weak var LoginButtonVIew: UIView!
    
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
        guard let mpvc = self.storyboard?.instantiateViewController(identifier: "MypageVC") as? MypageViewController else { return }
                
        self.navigationController?.pushViewController(mpvc, animated: true)
        
        
    }
    
    
    
}
