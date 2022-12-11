//
//  ToDoCell.swift
//  MyToDoApp
//
//  Created by kaki on 2022/12/11.
//

import UIKit

// ☘️ 기존에 사용하던 방법
//protocol UpdateButtonProtocol: AnyObject {
//    func updateButtonTapped(cell: ToDoCell)
//}

final class ToDoCell: UITableViewCell {

    @IBOutlet weak var backgoundView: UIView!
    
    @IBOutlet weak var toDoTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    
    // ☘️ 기존에 사용하던 방법
//    weak var delegate: UpdateButtonProtocol?
    
    // ToDoData를 전달받을 변수 (전달받으면 ==> 표시하는 메서드 실행) ⭐️
    var toDoData: ToDoData? {
        didSet {
            configureUIwithData()
        }
    }
    
    // (델리게이트 대신에) 실행하고 싶은 클로저 저장
    // 뷰컨트롤러에 있는 클로저 저장할 예정 (셀(자신)을 전달)
    var updateButtonPressed: (ToDoCell) -> Void = { (sender) in } // 옵셔널로 선언하면 바인딩도 해줘야하기에 기본적인 타입을 만들어서 할당해둔 것( = { (sender) in } - 별 의미 없음)
    
    
    // 스토리보드의 생성자
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    // 기본 UI
    func configureUI() {
        backgoundView.clipsToBounds = true
        backgoundView.layer.cornerRadius = 8
        
        updateButton.clipsToBounds = true
        updateButton.layer.cornerRadius = 10
    }
    
    // 데이터를 가지고 적절한 UI 표시하기
    func configureUIwithData() {
        toDoTextLabel.text = toDoData?.memoText
        dateTextLabel.text = toDoData?.dateString
        guard let colorNum = toDoData?.color else { return }
        let color = MyColor(rawValue: colorNum) ?? .red
        updateButton.backgroundColor = color.buttonColor
        backgoundView.backgroundColor = color.backgoundColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func updateButtonTapped(_ sender: UIButton) {
        // 뷰컨트롤러에서 전달받은 클로저를 실행 (내 자신 ToDoCell을 전달하면서) ⭐️
        updateButtonPressed(self)
        
        // ☘️ 기존에 사용하던 방법
//        delegate?.updateButtonTapped(cell: self)
    }
}
