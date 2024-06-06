//
//  WriteViewController.swift
//  may24
//
//  Created by 최병욱 on 5/17/24.
//

import UIKit

class WriteViewController:UIViewController,SBVC_TO_WVC{
    
    func sendData(BookTitle: String,BookId : Int) {
        self.BookTitleLabel.text = BookTitle
        self.BookId = BookId
    }
    @IBOutlet weak var BookTitleLabel: UILabel!
    
    @IBAction func SelectBookButtonTapped(_ sender: UIButton) {
        
        guard let sbvc = self.storyboard?.instantiateViewController(identifier: "SelectBookVC") as? SelectBookViewController else { return }
        sbvc.sbvc_wvc_delegate = self
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    
    @IBOutlet weak var NextView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NextView.layer.cornerRadius = 20
        NextView.layer.borderColor = UIColor.black.cgColor
        NextView.layer.borderWidth = 2
        BookTitleLabel.text = ""
    }
    
    var BookId:Int = 0
    @IBOutlet weak var PageTitleTextField: UITextField!
    
    
    @IBAction func NextButtonTapped(_ sender: UIButton) {
        
        guard let wcvc = self.storyboard?.instantiateViewController(identifier: "WriteContentVC") as? WriteContentViewController else { return }
        wcvc.BookId = BookId
        wcvc.PageTitle = PageTitleTextField.text!
        self.navigationController?.pushViewController(wcvc, animated: true)
        
    }
    
    
    
}
