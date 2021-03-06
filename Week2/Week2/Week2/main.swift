//
//  main.swift
//  Week2
//
//  Created by Jun on 2022/04/07.
//

import Foundation

var myLottoNumbers: Set<Int> = Set<Int>()
var lottoNumbers: Set<Int> = Set<Int>()

func makeRandomSixNumbers() -> Set<Int> {
    var randomSixNumbers: Set<Int> = Set<Int>()
    while randomSixNumbers.count < 6 {
        let randomNumber: Int = Int.random(in: 1...45)
        randomSixNumbers.insert(randomNumber)
    }
    return randomSixNumbers
}

func chooseAllNumbers() {
    myLottoNumbers = makeRandomSixNumbers()
    lottoNumbers = makeRandomSixNumbers()
}

func compare(mine: Set<Int>, thisWeek: Set<Int>) -> Set<Int> {
    let intersection: Set<Int> = myLottoNumbers.intersection(lottoNumbers)
    return intersection
}

func printNumbersWithoutBrackets(of someSet: Set<Int>) {
    for someSet in someSet {
        print(someSet, terminator: " ")
    }
}

func confirmTheWin(mine: Set<Int>, thisWeek: Set<Int>) {
    switch compare(mine: mine, thisWeek: thisWeek).isEmpty {
    case true:
        print("아쉽지만 겹치는 번호가 없습니다.")
    case false:
        print("축하합니다! 겹치는 번호는", terminator: " ")
        printNumbersWithoutBrackets(of: compare(mine: mine, thisWeek: thisWeek))
        print("입니다!")
    }
}

var round: Int = 0
var lottoIndicator: [Int: Set<Int>] = [:]

func generateLottoNumbers(mine: Set<Int>, thisWeek: Set<Int>) {
    chooseAllNumbers()
    confirmTheWin(mine: mine, thisWeek: thisWeek)
    round += 1
}

func generateLottoNumbersFiveTimes(mine: Set<Int>, thisWeek: Set<Int>) -> [Int: Set<Int>] {
    var indicator: [Int: Set<Int>] = [:]
    for _ in 1...5 {
        generateLottoNumbers(mine: mine, thisWeek: thisWeek)
        indicator[round] = lottoNumbers
    }
    return indicator
}

func showSecondRound() {
    var secondRound: [Int: Set<Int>]? = nil
    if let secondRound = lottoIndicator[2] {
        print("2회차의 로또 당첨 번호는", terminator: " ")
        printNumbersWithoutBrackets(of: lottoNumbers)
        print("입니다.")
    }
}

lottoIndicator = generateLottoNumbersFiveTimes(mine: myLottoNumbers, thisWeek: lottoNumbers)
showSecondRound()

