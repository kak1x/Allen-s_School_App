//
//  ViewController.swift
//  FirstNewApp
//
//  Created by a1ois on 2022/11/18.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        // 슬라이더의 가운데 설정
        slider.value = 0.5
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 밸류값을 가지고 메인레이블의 텍스트를 셋팅
//        let seconds = Int(sender.value * 60) // 나머지는 버림, sender = slider
//        //print(seconds)
//        mainLabel.text = "\(seconds) 초"
//        number = seconds
        number = Int(sender.value * 60) // 나머지는 버림, sender = slider
        mainLabel.text = "\(number) 초"
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈때마다 무언가를 실행
        // how to run a function after some time in swift
        // how to execute a function every second in swift
        timer?.invalidate()   // just in case you had existing `Timer`, `invalidate` it before we lose our reference to it
        
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSometingAfter1Second), userInfo: nil, repeats: true) // targer: self -> self = ViewController 인스턴스
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            // do something here - 반복하고 싶은 코드
            if number > 0 {
                number -= 1
                // 슬라이더도 줄여야됨
                slider.value = Float(number) / Float(60)
                // 레이블 표시도 다시 해줘야 됨
                mainLabel.text = "\(number) 초"
            } else {
                number = 0
                mainLabel.text = "초를 선택하세요"
                // 타이머의 반복을 멈춰야함
                timer?.invalidate()
                // 소리를 나게 해야됨
                // how to play a system sound in swift
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
        }
        
        
    }
    
//    @objc func doSometingAfter1Second() {
//        if number > 0 {
//            number -= 1
//            // 슬라이더도 줄여야됨
//            slider.value = Float(number) / Float(60)
//            // 레이블 표시도 다시 해줘야 됨
//            mainLabel.text = "\(number) 초"
//        } else {
//            number = 0
//            mainLabel.text = "초를 선택하세요"
//            // 타이머의 반복을 멈춰야함
//            timer?.invalidate()
//            // 소리를 나게 해야됨
//            // how to play a system sound in swift
//            AudioServicesPlayAlertSound(SystemSoundID(1322))
//        }
//
//    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 셋팅
        mainLabel.text = "초를 선택하세요"
        // 슬라이더의 가운데 설정
        slider.setValue(0.5, animated: true)
        number = 0
        timer?.invalidate()
        
        
    }
    
}

