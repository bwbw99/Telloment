//
//  WriteViewController.swift
//  may24
//
//  Created by 최병욱 on 5/17/24.
//

import UIKit

class WriteViewController:UIViewController{
    
    @IBAction func SelectBookButtonTapped(_ sender: UIButton) {
        
        guard let sbvc = self.storyboard?.instantiateViewController(identifier: "SelectBookVC") as? SelectBookViewController else { return }
                
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    
    @IBOutlet weak var NextView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NextView.layer.cornerRadius = 20
        NextView.layer.borderColor = UIColor.black.cgColor
        NextView.layer.borderWidth = 2
    }
    
    
    
    @IBAction func NextButtonTapped(_ sender: UIButton) {
        
        guard let wcvc = self.storyboard?.instantiateViewController(identifier: "WriteContentVC") as? WriteContentViewController else { return }
                
        self.navigationController?.pushViewController(wcvc, animated: true)
        
    }
    
    
    
}
