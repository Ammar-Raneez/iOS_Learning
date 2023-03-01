//
//  MockData.swift
//  Fruits
//
//  Created by Ammar on 2023-03-01.
//

import Foundation

struct MockData {
    static let fruit1 = FruitModel(name: "🍎 Apple", price: "$1.00")
    static let fruit2 = FruitModel(name: "🍇 Grape", price: "$2.00")
    static let fruit3 = FruitModel(name: "🍌 Banana", price: "$3.00")
    static let fruit4 = FruitModel(name: "🍊 Orange", price: "$4.00")
    static let fruit5 = FruitModel(name: "🍉 Watermelon", price: "$1.50")
    static let moreFruits = [
        FruitModel(name: "🍓 Strawberry", price: "$6.50"),
        FruitModel(name: "🍒 Cherry", price: "$5.50"),
        FruitModel(name: "🍍 Pineapple", price: "$7.50")
    ]
}
