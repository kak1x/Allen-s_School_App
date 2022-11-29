//
//  ViewController.swift
//  MyFirstApp
//
//  Created by a1ois on 2022/09/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var myButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        mainLabel.text = "안녕하세요"
//        mainLabel.backgroundColor = UIColor.yellow
        mainLabel.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) // #colorLiteral(
        mainLabel.textColor = #colorLiteral(red: 0, green: 0.7535250783, blue: 0.5840696692, alpha: 1)
        myButton.backgroundColor = UIColor.yellow
        myButton.setTitleColor(.black, for: .normal)
    
        
        
    }
    
    

}

