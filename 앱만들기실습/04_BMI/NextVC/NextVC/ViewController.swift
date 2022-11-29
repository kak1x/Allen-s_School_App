//
//  ViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        
        let firstVC = FirstViewController()
        
        firstVC.someString = "FirstViewController"
//        firstVC.mainLabel.text = "FirstViewController" 도 가능하지만, 잘 사용하지 않는다 -> 스토리보드로 작업시엔 오류가 발생하기 때문
//          -> 코드는 한번에 메모리에 올라가지만, 스토리보드로 만들면 코드와 스토리보드의 연결과정이 필요하기에 오류가 발생함
        
        firstVC.modalPresentationStyle = .fullScreen // 꽉 찬 화면으로 넘어가게 설정 -> 끌어내려서 뒤로가기 불가능
        
        present(firstVC, animated: true, completion: nil) // completion : 화면이 넘어가는게 끝나면 무엇을 할 것인지 -> 일반적으로 nil
        // UIViewController에 구현되어있는 present 메서드를 통해 다음으로 넘어간다
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동 (추천)
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        
//        let secondVC = SecondViewController()  // 이렇게 하면 스토리보드와 연결이 되지 않음
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController{
                                                            // 스토리보드에서 두번째 뷰컨에 secondVC 이름 추가해줘야함
            secondVC.someString = "SecondViewController"
//            secondVC.mainLabel.text = "아빠상어"  // 실행 안되고 에러 발생 -> 메인레이블이 nil이라는 에러 발생됨
            secondVC.modalPresentationStyle = .fullScreen
            present(secondVC, animated: true)
            
        }
        
//        let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
//        present(secondVC, animated: true)     // 실패하지 않는다면 이런 형식으로도 가능 (as!)
        
        
        
    }
    
    
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        if num > 5 {
            
        } else {
            performSegue(withIdentifier: "toThirdVC", sender: self) // 다음 화면으로 보내는 건 VC 이기때문에 self (nil도 상관없다는듯 하다?)
        } // 이렇게 하면 되기에 shouldPerformSegue가 구현되어있지 않다
        
        // 세그웨이 방식에서 데이터 전달하는건 조금 어렵다
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC" {
            
            let thirdVC = segue.destination as! ThirdViewController
            
            // 데이터 전달
            
            thirdVC.someString = "ThirdViewController"
            
    }
        
        if segue.identifier == "toFourthVC" {
            
            let fourthVC = segue.destination as! FourthViewController
            
            fourthVC.someString = "FourthViewController"
            
    }
        
    }
    
    var num = 3
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if num > 5 {
            return false
        } else {
            return true
        }
        // true 가 리턴될때만 실행됨
    }
    
}

