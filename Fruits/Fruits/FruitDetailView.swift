//
//  FruitDetailView.swift
//  Fruits
//
//  Created by Ammar on 2023-03-01.
//

import SwiftUI

struct FruitDetailView: View {
    var fruit: FruitModel
    
    var body: some View {
        NavigationLink {
            FruitDetailView2()
        } label: {
            Text(fruit.name)
        }
    }
}

struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: MockData.fruit1)
    }
}
