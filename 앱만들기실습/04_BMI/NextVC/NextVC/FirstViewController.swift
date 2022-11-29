//
//  FirstViewController.swift
//  NextVC
//
//  Created by kaki on 2022/11/28.
//

import UIKit

class FirstViewController: UIViewController {

    let mainLabel = UILabel()
//    let backButton = UIButton(type: .custom)
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        // 백 버튼 눌렸을때 어떤걸 실행할지 설정
        
        return button
    }() // 클로저의 실행문으로 버튼 설정
    
    var someString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        makeAutoLayout()
    }
    
    
    func setUp() {
        
//        mainLabel.text = "FirstViewController"
        mainLabel.text = someString // 전 화면(VC) 에서 전달받은 문자열을 표시해주는 법
        mainLabel.font = UIFont.systemFont(ofSize: 22)
        view.addSubview(mainLabel) // 메모리에 올린 메인레이블을 화면에 표시
        
//        backButton.setTitle("Back", for: .normal)
//        backButton.setTitleColor(.white, for: .normal)
//        backButton.backgroundColor = UIColor.blue
//        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
//        // 백 버튼 눌렸을때 어떤걸 실행할지 설정
        view.addSubview(backButton)
        
        view.backgroundColor = .gray
        
    }
    
    
    func makeAutoLayout() {
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    @objc func backButtonTapped() {
        
        dismiss(animated: true, completion: nil) // 다시 전 화면으로 돌아가는 메서드
        
    }

   

}
