//
//  ViewController.swift
//  TextFieldProject
//
//  Created by a1ois on 2022/11/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self // self = ViewController (대리자)
        
        setUp()
    }
    
    func setUp() {
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        
        textField.becomeFirstResponder() // textField가 First 응답 개체가 됨 -> 자동으로 키보드가 올라옴
    }
    
    // 화면의 탭을 감지하는 메서드 - 빈 곳 터치시 키보드가 내려감 - UIView의 메서드 재정의
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // = textField.resignFirstResponder()
    }
    
    // 텍스트필드의 입력을 시작할때 호출이 되는 메서드 (시작하지 말지의 여부 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function) // 함수의 이름을 출력
        return true
    }
    
    // 텍스트필드의 입력이 시작된 시점을 알려주는 메서드
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력을 시작했다.")
    }
    
    // 텍스트필드가 깔끔하게 없앨지 말지를 허락하는 메서드
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 글자 내용이 한글자 한글자 입력되거나 지워질때 호출이 되어 그것을 허락할지 말지 허락 여부를 판단
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(#function)
//        print(string) // 한글자씩 입력될때마다 그 글자를 출력함 (print(string)) (지우면 빈칸 출력)
//        return true
        
//        let maxLength = 10
//        let currentString: NSString = (textField.text ?? "") as NSString
//        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
//        return newString.length <= maxLength
        
        // 입력되고 있는 글자가 "숫자"인 경우 입력을 허용하지 않는 논리
        if Int(string) != nil {
            return false
        } else {
            // 20글자 이상 입력되는 것을 막는 코드
            guard let text = textField.text else {return true}
            let newLength = text.count + string.count - range.length
            return newLength <= 20
        }
    }
    
    // 텍스트필드의 엔터키가 눌러지면 다음 동작을 허락할것인지 말것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        } else {
            return true
        }
    }

    // 텍스트필드의 입력이 끝날때 호출 (끝날지 말지를 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 입력이 실제로 끝났을때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력을 끝냈다.")
        textField.text = ""
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
    
}

