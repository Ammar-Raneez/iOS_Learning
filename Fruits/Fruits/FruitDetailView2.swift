//
//  FruitDetailView2.swift
//  Fruits
//
//  Created by Ammar on 2023-03-01.
//

import SwiftUI

struct FruitDetailView2: View {
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.fruits) { fruit in
                    Text(fruit.name)
                }
            }
            .navigationTitle("Fruit Detail View 2")
        }
    }
}

struct FruitDetailView2_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView2()
    }
}
