//
//  CategoryViewController.swift
//  may24
//
//  Created by 최병욱 on 5/28/24.
//

import UIKit

class CategoryViewController:UIViewController,SendDataDelegate{
    func recieveData(response: String) {
        self.CategoryLabel.text = response
        self.CategoryImage.image = UIImage(named: response)
    }
    
    
    @IBOutlet weak var CategorySearchBar: UISearchBar!
    
    @IBOutlet weak var CategoryImage: UIImageView!
    @IBOutlet weak var CategoryLabel: UILabel!
    
    
    @IBAction func ChangeButtonTapped(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "CategoryListVC") as? CategoryListViewController else { return }
                
        vc.dataDelegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CategoryImage.layer.cornerRadius = 55
        
        self.CategorySearchBar.searchBarStyle = .minimal
        self.CategorySearchBar.searchTextField.text = "현재 카테고리에서 제목, 내용, 태그로 검색"
        self.CategorySearchBar.searchTextField.font = UIFont(name: "BMJUAOTF", size: 15)
        self.CategorySearchBar.searchTextField.textColor = UIColor.darkGray
        
        
        hideKeyboard()
    }
    
    
    
    
}
