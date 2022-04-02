//
//  main.swift
//  Week1
//
//  Created by Jun on 2022/03/13.
//

import Foundation

var blankOrReturn = ""
func makeStarsOfOneRow(numberOfStars: Int) {
    for count in 1...numberOfStars {
        if count == numberOfStars {
            blankOrReturn = "\n"
        } else if count == 1 {
            blankOrReturn = ""
        }
        print("*", terminator: blankOrReturn)
    }
}
func makeStick() {
    for count in 1...4 {
        print("    | |")
    }
}

for rowOfIceCream in 1...8 {
   makeStarsOfOneRow(numberOfStars: 11)
}
makeStick()

