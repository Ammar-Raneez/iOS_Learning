//
//  ContentView.swift
//  Fruits
//
//  Created by Ammar on 2023-03-01.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    // On refresh, refreshes the ViewModel and View. But StateObject refreshes only the View
    // Apart from that it is the same
    // @ObservedObject var viewModel = ContentViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.fruits) { fruit in
                    NavigationLink {
                        FruitDetailView(fruit: fruit)
                    } label: {
                        HStack {
                            Text(fruit.name)
                                .font(.title3)
                                .fontWeight(.semibold)
                            Spacer()
                            Text(fruit.price)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        }
                    }

                }
                .onDelete { indexSet in
                    viewModel.deleteFruit(index: indexSet)
                }
            }
//            .onAppear {
//                viewModel.getFruits()
//            }
            .navigationTitle("Fruits")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.addFruit()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
        // Place environment objects in root navigation stack
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
