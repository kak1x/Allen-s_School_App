//
//  main.swift
//  RandomBingo
//
//  Created by a1ois on 2022/09/08.
//

import Foundation

var computerChoice = Int.random(in: 1...100)

var myChoice: Int = 0

while true {
    
    var userInput = readLine()
    
    if let input = userInput {
        
        if let number = Int(input) {
            
            myChoice = number
            
        }
        
    }
    
    if computerChoice > myChoice {
        print("Up")
    } else if computerChoice < myChoice {
        print("Down")
    } else {
        print("Bingo")
        break
    }
    
}
