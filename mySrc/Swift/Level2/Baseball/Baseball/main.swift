//
//  main.swift
//  Baseball
//
//  Created by TaeHyeonLee on 2017. 10. 11..
//  Copyright © 2017년 ChocOZerO. All rights reserved.
//

import Foundation

print("Hello, World!")


func getComputerNum() -> Array<Int> {
    var computer: Array<Int> = []
    while computer.count < 3 {
        let newNum = (Int)(arc4random_uniform(9) + 1)
        if !computer.contains(newNum) {
            computer.append(newNum)
        }
    }
    print(computer)
    return computer
}

var computer: Array<Int> = getComputerNum()
var result: Dictionary<String, Int> = Dictionary<String, Int>()

func countResult(computer: Array<Int>, guessNum: Array<Int>) -> Dictionary<String, Int> {
    var vResult: Dictionary<String, Int> = Dictionary<String, Int>()
    vResult["strike"] = 0
    vResult["ball"] = 0
    
    for i in 0...(computer.count-1) {
        let num = guessNum[i]
        if num == computer[i] {
            vResult["strike"] = vResult["strike"]! + 1
        } else if computer.contains(num) {
            vResult["ball"] = vResult["ball"]! + 1
        }
    }
    return vResult
}

func printResult(result: Dictionary<String, Int>) {
    var strResult: String = ""
    let strike: Int = result["strike"]!
    let ball: Int = result["ball"]!
    
    if strike > 0 {
        strResult += String(strike) + " 스트라이크 "
    }
    if ball > 0 {
        strResult += String(ball) + " 볼"
    }
    if strike == 0 && ball == 0 {
        strResult += "낫싱"
    }
    print(strResult)
}

print("숫자야구게임")

while result["strike"] != 3 {
    print("1부터 9사이의 숫자로 이루어진 세자리 숫자를 입력해주세요.")
    let strGuessNum : String? = readLine()
    if strGuessNum?.count != 3 {
        continue
    }
    let strArrGuessNum = strGuessNum?.characters
    var guessNum : Array<Int> = [0, 0, 0]
    var i : Int = 0
    for num in strArrGuessNum! {
        guessNum[i] = Int(String(num))!
        i += 1
    }
    result["strike"] = 0
    result["ball"] = 0
    result = countResult(computer: computer, guessNum: guessNum)
    printResult(result: result)
}
print("성공! 축하드립니다!")

