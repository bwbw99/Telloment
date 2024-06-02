//
//  MypageViewController.swift
//  may24
//
//  Created by 최병욱 on 5/17/24.
//

import UIKit

class MypageViewController:UIViewController{
    
    
    @IBOutlet weak var LogoutView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        LogoutView.layer.borderWidth = 2
        LogoutView.layer.borderColor = UIColor.black.cgColor
        LogoutView.layer.cornerRadius = 20
    }
    
    
    @IBAction func LogoutButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
}
