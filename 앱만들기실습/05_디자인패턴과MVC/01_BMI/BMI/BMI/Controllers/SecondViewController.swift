//
//  SecondViewController.swift
//  BMI
//
//  Created by kaki on 2022/11/29.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
//    var bmiNumber: Double?
//    var adviceString: String?
//    var bmiColor: UIColor?
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    func makeUI() {
        
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .gray
        
        backButton.setTitle("다시 계산하기", for: .normal)
        
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        
        guard let bmi1 = bmi?.value else { return }
        bmiNumberLabel.text = String(bmi1)
        
        adviceLabel.text = bmi?.advice    // String? 타입이므로 벗겨줄 필요 없음
        bmiNumberLabel.backgroundColor = bmi?.matchColor       // UIColor? 타입이므로 벗겨줄 필요 없음
        
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
