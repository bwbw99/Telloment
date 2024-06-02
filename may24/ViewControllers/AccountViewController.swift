//
//  AccountViewController.swift
//  may24
//
//  Created by 최병욱 on 5/31/24.
//

import UIKit

class AccountViewController:UIViewController{
    
    @IBOutlet weak var View_1: UIView!
    @IBOutlet weak var View_2: UIView!
    
    @IBOutlet weak var contentsLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        View_1.layer.cornerRadius = 35
        View_1.layer.borderWidth = 2
        View_1.layer.borderColor = UIColor.black.cgColor
        
        View_2.layer.cornerRadius = 35
        View_2.layer.borderWidth = 2
        View_2.layer.borderColor = UIColor.black.cgColor
        
        
        contentsLabel.text = "당신만의 북을\n생성하고\n관리해보세요"
        let attrString = NSMutableAttributedString(string: contentsLabel.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 20
        paragraphStyle.alignment = .center
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        contentsLabel.attributedText = attrString
        
        
    }
    
    
}
