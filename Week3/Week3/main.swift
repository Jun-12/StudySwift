//
//  main.swift
//  Week3
//
//  Created by Jun on 2022/03/22.
//

import Foundation

struct Computer {
    var battery: Int = 100
    let manufacturer: String = "Apple"
    
    func saveData() {
        print("데이터를 저장합니다.")
    }
    
    func playVideo() {
        print("영상을 재생합니다.")
    }
}

var myComputer: Computer = Computer()
myComputer.battery = 80
myComputer.saveData()

var yagomComputer: Computer = Computer()
yagomComputer.battery = 30
yagomComputer.playVideo()

// 타입과 인스턴스 생성의 기본 형태
class PersonA {
    var name: String = "unkown"
    var age: Int = 0
    var nickName: String = "n"
}

let nicky: PersonA = PersonA()
nicky.name = "nicky"
nicky.age = 22
nicky.nickName = "nicky"

// 이니셜라이저
class PersonB {
    var name: String
    var age: Int
    var nickName: String
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}
let hana: PersonB = PersonB(name: "hana", age: 18, nickName: "h")

// 이니셜라이저 + 옵셔널
/*
 class PersonC {
    var name: String
    var age: Int
    var nickName: String?
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
*/

// 위의 코드 중 중복코드 줄이기 하면?
class PersonC {
    var name: String
    var age: Int
    var nickName: String?
    convenience init(name: String, age: Int, nickName: String) {
        self.init(name: name, age: age)
        self.nickName = nickName
    }
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
let jun: PersonC = PersonC(name: "jun", age: 29, nickName: "Dino")

// 이니셜라이저 + 암시적 추출 옵셔널
class Dog {
    var name: String
    var owner: PersonC!
    init(name: String) {
        self.name = name
    }
    func goOut() {
        print("\(name)가 \(owner.name)와 산책을 합니다.")
    }
}

let leo: Dog = Dog(name: "leo")
leo.owner = jun
leo.goOut()

// 실패가능한 이니셜라이저 init?
class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    convenience init?(name: String, age: Int, nickName: String) {
        self.init(name: name, age: age)
        self.nickName = nickName
    }
    init?(name: String, age: Int) {
        if (0...120).contains(age) == false {
            return nil
        }
        if name.count == 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}

// 디이니셜라이저 deinit
class PersonE {
    var name: String
    var pet: Dog?
    var child: PersonC
    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }
    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)을 인도합니다.")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE = PersonE(name: "donald", child: jun)
donald.pet = leo
// donald = nil
