//
//  Constants.swift
//  MusicApp
//
//  Created by kaki on 2022/12/10.
//

import UIKit


// MARK: - Name Space 만들기

// 데이터 영역에 저장 (열거형, 구조체 다 가능 - 전역 변수로 선언 가능)
// 사용하게될 API 문자열 묶음
public enum MusicApi {
    static let reqeustUrl = "https://itunes.apple.com/search?" // 데이터 영역에 저장되므로 저장 속성도 사용 가능해짐
    static let mediaParam = "media=music"
    // 구조체와 다르게 private init 선언해주지 않아도 된다는 장점이 있음
}

// 사용하게될 Cell 문자열 묶음
public struct Cell {
    static let musicCellIdentifier = "MusicCell"
    private init() {}
}

// 컬렉션뷰 구성을 위한 설정
public struct CVCell {
    static let spacingWidth: CGFloat = 1
    static let cellColumns: CGFloat = 3
    private init() {}
}
