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
    @State private var bmi: Double = 0.0;
    
    var body: some View {
        VStack {
            Text("BMI Calculator")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text("Weight")
            TextField("Enter Your Weight", text: self.$weightTextField)
            Text("Height")
            TextField("Enter Your Height", text: self.$heightTextField)
            Button {
                guard let weight = Double(self.heightTextField),
                      let height = Double(self.weightTextField) else {
                    print("Guard failed")
                    return
                }
                self.bmi = weight / (pow(height, 2))
                print(bmi)
            } label: {
                Text("Calculate BMI")
                    .font(Font.headline)
                    .foregroundColor(Color.white)
                    .padding(15)
                    .background(Color.cyan)
                    .cornerRadius(10)
            }
            Text("Your BMI: \(self.bmi)").font(.headline)
        
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
