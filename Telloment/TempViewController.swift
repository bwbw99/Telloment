//
//  TempViewController.swift
//  Telloment
//
//  Created by 최병욱 on 4/5/24.
//

import UIKit

class TempViewController:UIViewController{
    
    @IBOutlet weak var GrammarTextField: UITextField!
    
    
    @IBAction func GrammarButtonTapped(_ sender: Any) {
        
        GrammarTextField.text = "이 문장으로 변경"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
    
}
