//
//  Week3_Step1.swift
//  Week3
//
//  Created by Jun on 2022/04/14.
//

import Foundation

class Person {
    var name: String
    var age: Int
    var money: Int
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    func buySomething(toBuy things: String) {
        print("\(name)(\(age))가 \(things)을 구입합니다. 그가 가진 돈은 총 \(money)입니다.")
    }
}

struct CoffeeShop {
    var salesRevenue: Int
    enum coffee {
        case latte, americano, moka, milk, tea
    }
    var menu: [CoffeeShop.coffee: Int]
    var pickUpTable: String
    
    func takeOrder(orderPerson: Person) {
        print("\(orderPerson.name)손님께서 주문하신 상품은 \(menu)입니다. 주문하신 \(menu)를 만들기 시작합니다.")
    }
    func makeCoffee() {
        print("\(coffee.self) 제조중...")
    }
}
