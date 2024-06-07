//
//  SearchViewController.swift
//  may24
//
//  Created by 최병욱 on 5/17/24.
//

import UIKit

class SearchViewController:UIViewController{
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var SearchBar: UISearchBar!
    
    
    @IBOutlet weak var Outter_1: UIView!
    @IBOutlet weak var Outter_2: UIView!
    @IBOutlet weak var Outter_3: UIView!
    
    @IBOutlet weak var Inner_1: UIView!
    @IBOutlet weak var Inner_2: UIView!
    @IBOutlet weak var Inner_3: UIView!
    
    @IBOutlet weak var Vertical_1: UIView!
    @IBOutlet weak var Vertical_2: UIView!
    
    @IBOutlet weak var Button_1: UIButton!
    @IBOutlet weak var Button_2: UIButton!
    @IBOutlet weak var Button_3: UIButton!
    
    
    @IBOutlet weak var BookLabel: UILabel!
    @IBOutlet weak var PageLabel: UILabel!
    @IBOutlet weak var UserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SearchBar.searchTextField.font = UIFont(name: "BMJUAOTF", size: 17)
        self.SearchBar.searchTextField.textColor = UIColor.darkGray
        self.SearchBar.searchBarStyle = .minimal
        self.Outter_1.layer.cornerRadius = 5
        self.Outter_3.layer.cornerRadius = 5
        self.Inner_1.layer.cornerRadius = 4
        self.Inner_3.layer.cornerRadius = 4
        
        Button_1_Tapped(Button_1)
        hideKeyboard()
        
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Button_1_Tapped(_ sender: UIButton) {
        self.SearchBar.text = "제목, 태그로 검색"
        
        self.Outter_1.backgroundColor = UIColor.black
        self.Outter_2.backgroundColor = UIColor.lightGray
        self.Outter_3.backgroundColor = UIColor.lightGray
        
        self.Vertical_1.backgroundColor = UIColor.black
        self.Vertical_2.backgroundColor = UIColor.lightGray
        
        self.BookLabel.textColor = UIColor.black
        self.PageLabel.textColor = UIColor.lightGray
        self.UserLabel.textColor = UIColor.lightGray
    }
    
    @IBAction func Button_2_Tapped(_ sender: UIButton) {
        self.SearchBar.text = "제목, 내용, 태그로 검색"
        
        self.Outter_1.backgroundColor = UIColor.lightGray
        self.Outter_2.backgroundColor = UIColor.black
        self.Outter_3.backgroundColor = UIColor.lightGray
        
        self.Vertical_1.backgroundColor = UIColor.black
        self.Vertical_2.backgroundColor = UIColor.black
        
        self.BookLabel.textColor = UIColor.lightGray
        self.PageLabel.textColor = UIColor.black
        self.UserLabel.textColor = UIColor.lightGray
    }
    
    @IBAction func Button_3_Tapped(_ sender: UIButton) {
        self.SearchBar.text = "사용자 닉네임으로 검색"
        
        self.Outter_1.backgroundColor = UIColor.lightGray
        self.Outter_2.backgroundColor = UIColor.lightGray
        self.Outter_3.backgroundColor = UIColor.black
        
        self.Vertical_1.backgroundColor = UIColor.lightGray
        self.Vertical_2.backgroundColor = UIColor.black
        
        self.BookLabel.textColor = UIColor.lightGray
        self.PageLabel.textColor = UIColor.lightGray
        self.UserLabel.textColor = UIColor.black
    }
    
    
    
    
    
}

