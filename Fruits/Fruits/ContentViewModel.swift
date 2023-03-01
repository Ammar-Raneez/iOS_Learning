//
//  ContentViewModel.swift
//  Fruits
//
//  Created by Ammar on 2023-03-01.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var fruits: [FruitModel] = []
    
    init() {
        getFruits()
    }
    
    func addFruit() {
        fruits.append(MockData.moreFruits.randomElement() ?? MockData.fruit1)
    }

    func getFruits() {
        fruits.append(MockData.fruit1)
        fruits.append(MockData.fruit2)
        fruits.append(MockData.fruit3)
        fruits.append(MockData.fruit4)
        fruits.append(MockData.fruit5)
    }
    
    func deleteFruit(index: IndexSet) {
        fruits.remove(atOffsets: index)
    }
}
