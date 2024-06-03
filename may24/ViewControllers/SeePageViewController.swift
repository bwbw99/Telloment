//
//  SeePageViewController.swift
//  may24
//
//  Created by 최병욱 on 6/3/24.
//

import UIKit

class SeePageViewController:UIViewController{
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var InnerScrollView: UIView!
    
    @IBOutlet weak var PageTitle: UILabel!
    @IBOutlet weak var ContentTextView: UITextView!
    @IBOutlet weak var Heart: UILabel!
    
    @IBOutlet weak var PlayImage: UIImageView!
    @IBOutlet weak var PauseImage: UIImageView!
    @IBOutlet weak var PlayButton: UIButton!
    @IBOutlet weak var PauseButton: UIButton!
    
    @IBOutlet weak var EmotionType: UILabel!
    @IBOutlet weak var EmotionLevel: UILabel!
    
    
    
    @IBOutlet weak var TotalHeight: NSLayoutConstraint!
    
    //API 통신 부분
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TotalHeight.constant = ContentTextView.frame.size.height + 300
        
    }
    
    
    @IBAction func PlayButtonTapped(_ sender: UIButton) {
        PlayImage.isHidden = true
        PlayButton.isHidden = true
        PauseImage.isHidden = false
        PauseButton.isHidden = false
    }
    
    
    @IBAction func PauseButtonTapped(_ sender: UIButton) {
        PlayImage.isHidden = false
        PlayButton.isHidden = false
        PauseImage.isHidden = true
        PauseButton.isHidden = true
    }
    
    
}
