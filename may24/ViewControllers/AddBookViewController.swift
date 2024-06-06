//
//  AddBookViewController.swift
//  may24
//
//  Created by 최병욱 on 6/5/24.
//

import UIKit

class AddBookViewController:UIViewController, SendDataDelegate{
    func recieveData(response: String, categoryCode: String) {
        self.CategoryLabel.text = response
        self.CategoryImage.image = UIImage(named: response)
    }
    
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var CategoryImage: UIImageView!
    @IBOutlet weak var CategoryLabel: UILabel!
    @IBOutlet weak var TodayPageLabel: UILabel!
    @IBOutlet weak var TotalPageLabel: UILabel!
    
    @IBOutlet weak var BookTitle: UITextField!
    @IBOutlet weak var Tags: UITextField!
    
    @IBOutlet weak var AddView: UIView!
    
    
    
    @IBAction func ChangeCategoryButton(_ sender: UIButton) {
        guard let clvc = self.storyboard?.instantiateViewController(withIdentifier: "CategoryListVC") as? CategoryListViewController else {return}
        clvc.dataDelegate = self
        self.navigationController?.pushViewController(clvc, animated: true)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        CategoryImage.layer.cornerRadius = 55
        AddView.layer.cornerRadius = 20
        AddView.layer.borderColor = UIColor.black.cgColor
        AddView.layer.borderWidth = 2
    }
    
    
    @IBAction func AddButtonTapped(_ sender: UIButton) {
        var TagArrTemp:[String.SubSequence] = Tags.text!.split(separator: ", ", omittingEmptySubsequences: true)
        var TagArr:[String] = []
        for i in TagArrTemp{
            TagArr.append(String(i.suffix(i.count - 1)))
        }
        // 여기에 API 통신 연결하기
        print(BookTitle.text)
        print(categoryCode(name: CategoryLabel.text!))
        print(TagArr)
        
        
        
    }
    
    
    
    func categoryCode(name:String) -> String{
        if(name == "여행"){
            return "Trip"
        }
        else if(name == "IT·과학"){
            return "ITNSCI"
        }
        else if(name == "영화·드라마"){
            return "MVD"
        }
        else if(name == "유머"){
            return "HUMR"
        }
        else if(name == "음악"){
            return "MUS"
        }
        else if(name == "결혼·육아"){
            return "MRG"
        }
        else if(name == "연애"){
            return "ROM"
        }
        else if(name == "요리"){
            return "COK"
        }
        else if(name == "건강·운동"){
            return "HLTH"
        }
        else if(name == "자기계발"){
            return "STD"
        }
        else if(name == "문화·예술"){
            return "ART"
        }
        else if(name == "동물"){
            return "ANML"
        }
        else if(name == "인문·철학"){
            return "HUMN"
        }
        else if(name == "소설"){
            return "LIT"
        }
        else{
            return "FIN"
        }
    }
    
    
    
    
    
}
