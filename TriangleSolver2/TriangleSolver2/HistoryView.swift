//
//  HistoryView.swift
//  TriangleSolver
//
//  Created by Ammar on 2023-03-17.
//

import SwiftUI

struct HistoryView: View {
    @StateObject var viewModel = CalculationViewModel()

    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                if viewModel.calculated {
                    HStack {
                        Text(viewModel.aField)
                        Spacer()
                        Text("\(viewModel.a)")
                    }
                    HStack {
                        Text(viewModel.bField)
                        Spacer()
                        Text("\(viewModel.b)")
                    }
                    HStack {
                        Text(viewModel.cField)
                        Spacer()
                        Text("\(viewModel.c)")
                    }
                    HStack {
                        Text("Area:")
                        Spacer()
                        Text("\(viewModel.area)")
                    }
                    HStack {
                        Text("Perimeter:")
                        Spacer()
                        Text("\(viewModel.perimeter)")
                    }
                    
                    Spacer()
                } else {
                    HStack(alignment: .center) {
                        Text("No calculated history available")
                            .font(.title)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle(Text("Last Calculation"))
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
