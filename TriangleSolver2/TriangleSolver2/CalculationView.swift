//
//  CalculationView.swift
//  TriangleSolver
//
//  Created by Ammar on 2023-03-17.
//

import SwiftUI

struct CalculationView: View {
    @StateObject var viewModel = CalculationViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Image("right_triangle")
                
                HStack {
                    Text("Choose the unknown edge")
                        .fontWeight(.semibold)
                    Picker("edge", selection: $viewModel.edgeType) {
                        Text(Edge.Base.rawValue).tag(Edge.Base)
                        Text(Edge.Altitude.rawValue).tag(Edge.Altitude)
                        Text(Edge.Hypotenuse.rawValue).tag(Edge.Hypotenuse)
                    }
                    .pickerStyle(.wheel)
                    .onChange(of: viewModel.edgeType) { _ in
                        viewModel.calculated = false
                        viewModel.a = ""
                        viewModel.b = ""
                        viewModel.c = ""
                    }
                }
                .padding(.leading)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Enter known length values")
                        .fontWeight(.semibold)
                    switch viewModel.edgeType {
                    case .Hypotenuse:
                        TextField("Altitude Value", text: $viewModel.a)
                            .textFieldStyle(.roundedBorder)
                        TextField("Base Value", text: $viewModel.b)
                            .textFieldStyle(.roundedBorder)
                    case .Altitude:
                        TextField("Base Value", text: $viewModel.a)
                            .textFieldStyle(.roundedBorder)
                        TextField("Hypotenuse Value", text: $viewModel.b)
                            .textFieldStyle(.roundedBorder)
                    case .Base:
                        TextField("Altitude Value", text: $viewModel.a)
                            .textFieldStyle(.roundedBorder)
                        TextField("Hypotenuse Value", text: $viewModel.b)
                            .textFieldStyle(.roundedBorder)
                    }
                    HStack(alignment: .center) {
                        Button {
                            viewModel.calculateValues()
                        } label: {
                            Text("Calculate")
                        }
                        .buttonStyle(.borderedProminent)
                        .frame(maxWidth: .infinity)
                        .tint(.green)
                            
                    }
                }
                .padding(.horizontal)
                
                if viewModel.calculated {
                    VStack {
                        HStack {
                            Text("\(viewModel.cField):")
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
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle(Text("Triangle Calculator"))
            .alert(isPresented: $viewModel.invalidInput) {
                Alert(title: Text("Invalid Input"), message: Text("Please check your input values"), dismissButton: .default(Text("Ok")))
            }
        }
    }
}

struct CalculationView_Previews: PreviewProvider {
    static var previews: some View {
        CalculationView()
    }
}
