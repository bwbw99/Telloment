//
//  CategoryListViewController.swift
//  may24
//
//  Created by 최병욱 on 5/28/24.
//

import UIKit

class CategoryListViewController:UIViewController{
    
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet var CategoryImages: [UIImageView]!
    @IBOutlet var BelowBars: [UIView]!
    
    
    var dataDelegate : SendDataDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in CategoryImages{
            i.layer.cornerRadius = 20
        }
        
        for i in BelowBars{
            i.layer.cornerRadius = 20
            i.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
    }
    
    @IBAction func Change_Tapped_1(_ sender: UIButton) {
        dataDelegate?.recieveData(response: "여행")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Change_Tapped_2(_ sender: UIButton) {
        dataDelegate?.recieveData(response: "IT·과학")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Change_Tapped_3(_ sender: UIButton) {
        dataDelegate?.recieveData(response: "영화·드라마")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Change_Tapped_4(_ sender: UIButton) {
        dataDelegate?.recieveData(response: "유머")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Change_Tapped_5(_ sender: UIButton) {
        dataDelegate?.recieveData(response: "음악")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Change_Tapped_6(_ sender: UIButton) {
        dataDelegate?.recieveData(response: "결혼·육아")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Change_Tapped_7(_ sender: UIButton) {
        dataDelegate?.recieveData(response: "연애")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Change_Tapped_8(_ sender: UIButton) {
        dataDelegate?.recieveData(response: "요리")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Change_Tapped_9(_ sender: UIButton) {
        dataDelegate?.recieveData(response: "건강·운동")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Change_Tapped_10(_ sender: UIButton) {
        dataDelegate?.recieveData(response: "자기계발")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Change_Tapped_11(_ sender: UIButton) {
        dataDelegate?.recieveData(response: "문화·예술")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Change_Tapped_12(_ sender: UIButton) {
        dataDelegate?.recieveData(response: "동물")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Change_Tapped_13(_ sender: UIButton) {
        dataDelegate?.recieveData(response: "인문·철학")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Change_Tapped_14(_ sender: UIButton) {
        dataDelegate?.recieveData(response: "소설")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Change_Tapped_15(_ sender: UIButton) {
        dataDelegate?.recieveData(response: "부동산·주식")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    
}
protocol SendDataDelegate {
    func recieveData(response : String) -> Void
}
