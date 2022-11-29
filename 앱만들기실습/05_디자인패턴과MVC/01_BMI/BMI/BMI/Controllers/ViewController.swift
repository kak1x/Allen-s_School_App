//
//  ViewController.swift
//  BMI
//
//  Created by kaki on 2022/11/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var bmiManager = BMICalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
    }
    
    func makeUI() {
        
        heightTextField.delegate = self // VC에게 대리자 위임
        weightTextField.delegate = self
        
        mainLabel.text = "키와 몸무게를 입력해주세요"
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        heightTextField.placeholder = "cm단위로 입력해주세요"
        weightTextField.placeholder = "kg단위로 입력해주세요"
        
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        // BMI 결과값을 뽑아냄
        bmiManager.calculateBMI(height: heightTextField.text!, weight: weightTextField.text!)
    }
    
    // 화면 넘어가는건 기본 설정이므로, 별다른 설정이 필요 없으면 필요 없다
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야만 합니다!!"
            mainLabel.textColor = UIColor.red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해주세요"
        mainLabel.textColor = UIColor.black
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC" {
            
            let secondVC = segue.destination as! SecondViewController
            // 계산된 결과값을 다음 화면으로 전달
            secondVC.bmiNumber = self.bmiManager.getBMIResult()
            secondVC.bmiColor = bmiManager.getBackgroundColor()
            secondVC.adviceString = bmiManager.getBMIAdviceString()
            
        }
        // 다음화면으로 가기 전에 텍스트필드 비우기
        heightTextField.text = ""
        weightTextField.text = ""
        
    }
    
   
    
}
    
    // 텍스트필드를 사용할때는 델리게이트를 채택해야함 - 디테일하게 컨트롤하기 위함
    extension ViewController: UITextFieldDelegate {
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            
            if Int(string) != nil || string == "" {
                return true // 글자 입력을 허용
            }
            return false // 글자 입력 허용하지 않음
            
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // 두개의 텍스트필드를 모두 종료 (키보드 내려가기)
            if heightTextField.text != "", weightTextField.text != "" { // 자세한 범위의 조건문이 먼저
                weightTextField.resignFirstResponder() // 첫번째 응답자 역할을 해제시키겠다 (키보드 내림)
                return true
                // 두번째 텍스트필드로 넘어가도록
            } else if heightTextField.text != ""{ // 그 뒤에 넓은 범위의 조건문
                weightTextField.becomeFirstResponder() // 두번째 텍스트필드를 응답 객체로 설정하겠다 -> 키보드 넘김
                return true
            }
            return false
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // 유저의 터치가 일어나면
            heightTextField.resignFirstResponder()
            weightTextField.resignFirstResponder() // 키보드를 내리겠다
        }
        
    }
