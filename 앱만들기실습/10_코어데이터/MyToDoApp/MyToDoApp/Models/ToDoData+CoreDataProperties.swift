//
//  ToDoData+CoreDataProperties.swift
//  MyToDoApp
//
//  Created by kaki on 2022/12/11.
//
//

import Foundation
import CoreData


extension ToDoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoData> {
        return NSFetchRequest<ToDoData>(entityName: "ToDoData")
    }
    // 확장에서 저장 속성 선언 불가 -> 아래는 저장 속성이 아닌 계산 속성으로 봐야함
    @NSManaged public var memoText: String?
    @NSManaged public var date: Date?
    @NSManaged public var color: Int64  // 색은 1, 2, 3, 4 를 선택할것
    
    var dateString: String? {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = self.date else { return "" }
        let savedDateString = myFormatter.string(from: date)
        return savedDateString
    }

}

extension ToDoData : Identifiable {

}
