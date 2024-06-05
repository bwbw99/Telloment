//
//  SelectBookViewController.swift
//  may24
//
//  Created by 최병욱 on 6/1/24.
//

import UIKit

class SelectBookViewController:UIViewController{
    
    @IBAction func SelectBookViewController(_ sender: UIButton) {
        
        
    }
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var BookAddView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BookAddView.layer.cornerRadius = 20
        BookAddView.layer.borderWidth = 2
        BookAddView.layer.borderColor = UIColor.black.cgColor
        
    }
    
    
    
}
