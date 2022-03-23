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

// Try it Yourself: 에어컨 만들기

// 구조체와 클래스의 차이
// 1. 초기화
//  1) memberwise
/*class PersonF {
    var name: String
    var age: Int
}
*/
struct PersonG {
    var name: String
    var age: Int
}
// -> class는 init 메소드를 통해 기본값을 보장시켜줘야 에러가 나지 않는다.
//    반면에 struct는 memberwise라는 기능 때문에 에러가 나지 않는다.

//  2) deinit : class에서만 제공되는 메소드. struct과 class가 메모리 위에서 관리되는 방식이 다르기 때문이다.

// 2. 상속 : 상속은 class에서만 가능한 강력한 기능이다.

// 3. mutating
class PersonH {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func addOneToAge() {
        self.age += 1
    }
}

struct PersonI {
    var name: String
    var age: Int
    
    mutating func addOneToAge() {
        self.age += 1
    }
}
// 둘 다 age에 1을 더해주는 메소드이다. 하지만 struct는 프로퍼티를 변경하는 메소드를 생성할 때 func앞에 mutating을 붙여주어야 한다.

// 4. 값 타입(Value Type) vs 참조 타입(Reference Type)
class CameraA {
    var color = "Black"
}

struct CameraB {
    var color = "Black"
}

var myCameraA = CameraA()
var yourCameraA = myCameraA

var myCameraB = CameraB()
var yourCameraB = myCameraB


func printCameraColor() {
    let str = """
Camera A (my: \(myCameraA.color), yours: \(yourCameraA.color))
Camera B (my: \(myCameraB.color), yours: \(yourCameraB.color))
"""
    print(str)
}

printCameraColor()

print("----- myCamera 색을 변경합니다. -----")

myCameraA.color = "White"
myCameraB.color = "White"


printCameraColor()
/*
 Camera A (my: Black, yours: Black)
 Camera B (my: Black, yours: Black)
 ----- myCamera 색을 변경합니다. -----
 Camera A (my: White, yours: White)
 Camera B (my: White, yours: Black)
 */
// class는 참조 타입이고 struct는 값 타입(복사)이기 때문.

