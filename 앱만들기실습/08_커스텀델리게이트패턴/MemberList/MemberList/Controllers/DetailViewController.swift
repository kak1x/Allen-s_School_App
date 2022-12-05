//
//  DetailViewController.swift
//  MemberList
//
//  Created by kaki on 2022/12/05.
//

import UIKit

final class DetailViewController: UIViewController {

    private let detailView = DetailView()
    
    var member: Member?
    
    override func loadView() { // 뷰디드로드보다 먼저 호출되는 로드뷰를 통해 뷰 교체
        // 로드뷰는 super. 필요없음 : 완전히 재정의를 하는 부분이고 내부적인 매커니즘도 없기에
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonAction()
        setupData()
    }
    
    private func setupData() {
        detailView.member = member
    }
    
    // 뷰에 있는 버튼의 타겟 설정
    func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func saveButtonTapped() {
        print("버튼이 눌림")
    }
    

    

}
