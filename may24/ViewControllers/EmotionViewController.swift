//
//  EmotionViewController.swift
//  may24
//
//  Created by 최병욱 on 6/1/24.
//

import UIKit

class EmotionViewController:UIViewController,EmotionDelegate_2{
    func WCVC_TO_EVC(type_num: Int, level_num: Int) {
        self.Type_num = type_num
        self.Level_num = level_num
    }
    
    
    var emotionDelegate_1 : EmotionDelegate_1?
    
    @IBOutlet weak var SelectFourView: UIView!
    
    @IBOutlet weak var Outter_1_1: UIView!
    @IBOutlet weak var Outter_1_2: UIView!
    @IBOutlet weak var Outter_1_3: UIView!
    @IBOutlet weak var Outter_1_4: UIView!
    
    
    @IBOutlet weak var Inner_1_1: UIView!
    @IBOutlet weak var Inner_1_2: UIView!
    @IBOutlet weak var Inner_1_3: UIView!
    @IBOutlet weak var Inner_1_4: UIView!
    
    
    @IBOutlet weak var Label_1_1: UILabel!
    @IBOutlet weak var Label_1_2: UILabel!
    @IBOutlet weak var Label_1_3: UILabel!
    @IBOutlet weak var Label_1_4: UILabel!

    
    @IBOutlet weak var Vertical_1_1: UIView!
    @IBOutlet weak var Vertical_1_2: UIView!
    
    
    @IBOutlet weak var Horizontal_1_1: UIView!
    @IBOutlet weak var Horizontal_1_2: UIView!
    
    @IBOutlet weak var Button_1_1: UIButton!
    @IBOutlet weak var Button_1_2: UIButton!
    @IBOutlet weak var Button_1_3: UIButton!
    @IBOutlet weak var Button_1_4: UIButton!
    
    
    
    var Type_num : Int = 1
    var Level_num : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let wcvc = self.storyboard?.instantiateViewController(identifier: "WriteContentVC") as? WriteContentViewController else {return}
        wcvc.emotionDelegate_2 = self
        
        SelectFourView.layer.cornerRadius = 5
        Outter_1_1.layer.cornerRadius = 5
        Outter_1_2.layer.cornerRadius = 5
        Outter_1_3.layer.cornerRadius = 5
        Outter_1_4.layer.cornerRadius = 5
        
        Inner_1_1.layer.cornerRadius = 4
        Inner_1_2.layer.cornerRadius = 4
        Inner_1_3.layer.cornerRadius = 4
        Inner_1_4.layer.cornerRadius = 4
        
        Outter_1_1.layer.maskedCorners = [.layerMinXMinYCorner]
        Outter_1_2.layer.maskedCorners = [.layerMaxXMinYCorner]
        Outter_1_3.layer.maskedCorners = [.layerMinXMaxYCorner]
        Outter_1_4.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
        
        Inner_1_1.layer.maskedCorners = [.layerMinXMinYCorner]
        Inner_1_2.layer.maskedCorners = [.layerMaxXMinYCorner]
        Inner_1_3.layer.maskedCorners = [.layerMinXMaxYCorner]
        Inner_1_4.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
        
    
        Outter_2_1.layer.cornerRadius = 5
        Outter_2_3.layer.cornerRadius = 5
        
        Inner_2_1.layer.cornerRadius = 4
        Inner_2_3.layer.cornerRadius = 4
        
        if(Type_num == 1){
            ButtonTapped_1(Button_1_1)
        }
        else if (Type_num == 2){
            ButtonTapped_2(Button_1_2)
        }
        else if (Type_num == 2){
            ButtonTapped_3(Button_1_3)
        }
        else{
            ButtonTapped_4(Button_1_4)
        }
            
        if(Level_num == 1){
            ButtonTapped_2_1(Button_2_1!)
        }
        else if(Level_num == 2){
            ButtonTapped_2_2(Button_2_2!)
        }
        else{
            ButtonTapped_2_3(Button_2_3!)
        }
        
        
    }
    
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var Button_2_1: UIButton!
    @IBOutlet weak var Button_2_2: UIButton!
    @IBOutlet weak var Button_2_3: UIButton!
    
    
    @IBAction func ButtonTapped_1(_ sender: UIButton) {
        Outter_1_1.backgroundColor = UIColor.black
        Outter_1_2.backgroundColor = UIColor.lightGray
        Outter_1_3.backgroundColor = UIColor.lightGray
        Outter_1_4.backgroundColor = UIColor.lightGray
        
        Vertical_1_1.backgroundColor = UIColor.black
        Vertical_1_2.backgroundColor = UIColor.lightGray
        
        Horizontal_1_1.backgroundColor = UIColor.black
        Horizontal_1_2.backgroundColor = UIColor.lightGray
        
        emotionDelegate_1?.EVC_To_WCVC_Type(type: "행복")
    }
    
    
    @IBAction func ButtonTapped_2(_ sender: UIButton) {
        Outter_1_1.backgroundColor = UIColor.lightGray
        Outter_1_2.backgroundColor = UIColor.black
        Outter_1_3.backgroundColor = UIColor.lightGray
        Outter_1_4.backgroundColor = UIColor.lightGray
        
        Vertical_1_1.backgroundColor = UIColor.black
        Vertical_1_2.backgroundColor = UIColor.lightGray
        
        Horizontal_1_1.backgroundColor = UIColor.lightGray
        Horizontal_1_2.backgroundColor = UIColor.black
        
        emotionDelegate_1?.EVC_To_WCVC_Type(type: "슬픔")
    }
    
    
    
    
    @IBAction func ButtonTapped_3(_ sender: UIButton) {
        Outter_1_1.backgroundColor = UIColor.lightGray
        Outter_1_2.backgroundColor = UIColor.lightGray
        Outter_1_3.backgroundColor = UIColor.black
        Outter_1_4.backgroundColor = UIColor.lightGray
        
        Vertical_1_1.backgroundColor = UIColor.lightGray
        Vertical_1_2.backgroundColor = UIColor.black
        
        Horizontal_1_1.backgroundColor = UIColor.black
        Horizontal_1_2.backgroundColor = UIColor.lightGray
        
        emotionDelegate_1?.EVC_To_WCVC_Type(type: "화남")
    }
    
    
    
    @IBAction func ButtonTapped_4(_ sender: UIButton) {
        Outter_1_1.backgroundColor = UIColor.lightGray
        Outter_1_2.backgroundColor = UIColor.lightGray
        Outter_1_3.backgroundColor = UIColor.lightGray
        Outter_1_4.backgroundColor = UIColor.black
        
        Vertical_1_1.backgroundColor = UIColor.lightGray
        Vertical_1_2.backgroundColor = UIColor.black
        
        Horizontal_1_1.backgroundColor = UIColor.lightGray
        Horizontal_1_2.backgroundColor = UIColor.black
        
        emotionDelegate_1?.EVC_To_WCVC_Type(type: "중립")
    }
    
    
    
    
    
    @IBOutlet weak var Outter_2_1: UIView!
    @IBOutlet weak var Outter_2_2: UIView!
    @IBOutlet weak var Outter_2_3: UIView!
    
    
    @IBOutlet weak var Inner_2_1: UIView!
    @IBOutlet weak var Inner_2_2: UIView!
    @IBOutlet weak var Inner_2_3: UIView!
    
    
    @IBOutlet weak var Vertical_2_1: UIView!
    @IBOutlet weak var Vertical_2_2: UIView!
    
    
    
    
    
    
    @IBAction func ButtonTapped_2_1(_ sender: Any) {
        Outter_2_1.backgroundColor = UIColor.black
        Outter_2_2.backgroundColor = UIColor.lightGray
        Outter_2_3.backgroundColor = UIColor.lightGray
        
        Vertical_2_1.backgroundColor = UIColor.black
        Vertical_2_2.backgroundColor = UIColor.lightGray
        
        emotionDelegate_1?.EVC_TO_WCVC_Level(level: "낮음")
    }
    
    @IBAction func ButtonTapped_2_2(_ sender: Any) {
        Outter_2_1.backgroundColor = UIColor.lightGray
        Outter_2_2.backgroundColor = UIColor.black
        Outter_2_3.backgroundColor = UIColor.lightGray
        
        Vertical_2_1.backgroundColor = UIColor.black
        Vertical_2_2.backgroundColor = UIColor.lightGray
        
        emotionDelegate_1?.EVC_TO_WCVC_Level(level: "보통")
    }
    
    
    
    @IBAction func ButtonTapped_2_3(_ sender: Any) {
        Outter_2_1.backgroundColor = UIColor.lightGray
        Outter_2_2.backgroundColor = UIColor.lightGray
        Outter_2_3.backgroundColor = UIColor.black
        
        Vertical_2_1.backgroundColor = UIColor.lightGray
        Vertical_2_2.backgroundColor = UIColor.black
        
        emotionDelegate_1?.EVC_TO_WCVC_Level(level: "높음")
    }
    
}
protocol EmotionDelegate_1 {
    func EVC_To_WCVC_Type(type : String) -> Void
    func EVC_TO_WCVC_Level(level : String) -> Void
}
