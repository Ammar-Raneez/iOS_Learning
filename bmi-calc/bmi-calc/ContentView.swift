//
//  ContentView.swift
//  bmi-calc
//
//  Created by Ammar on 2023-02-10.
//

import SwiftUI

struct ContentView: View {
    @State private var weightTextField: String = "";
    @State private var heightTextField: String = "";
    @StateObject private var viewModel = BMIViewModel()
    
    var body: some View {
        VStack(spacing: 50) {
            Text("BMI Calculator")
                .font(.largeTitle)
                .fontWeight(.semibold)
            VStack(spacing: 20) {
                FieldValueView(heading: "Weight", value: $weightTextField)
                FieldValueView(heading: "Height", value: $heightTextField)
            }
            Button {                
                viewModel.calculateBMI(weightVal: weightTextField, heightVal: heightTextField)
            } label: {
                Text("Calculate BMI")
                    .frame(maxWidth: .infinity)
                    .font(Font.headline)
                    .foregroundColor(Color.white)
                    .padding(15)
                    .background(Color.cyan)
                    .cornerRadius(10)
            }
            if let thisBmi = viewModel.bmi {
                Text("Your BMI: \(thisBmi, specifier: "%.2f")").font(.headline)
            }
        
        }
        .padding()
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title, message: alert.description, dismissButton: alert.dismissButton)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
