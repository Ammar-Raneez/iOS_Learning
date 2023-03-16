//
//  BMIViewModel.swift
//  bmi-calc
//
//  Created by Ammar on 2023-03-16.
//

import Foundation

final class BMIViewModel: ObservableObject {
    @Published var bmi: Double?
    @Published var bmiInfo: String?
    @Published var alertItem: AlertItem?
    
    func calculateBMI(weightVal: String, heightVal: String) {
        guard let weight = Double(weightVal),
              let height = Double(heightVal) else {
            alertItem = AlertContext.invalidValues
            print("Guard failed")
            return
        }
        
        let tempBMI = weight / (pow(height, 2))
        
        if tempBMI > 30 {
            bmiInfo = "You are considered to be obese."
        } else if tempBMI > 25 {
            bmiInfo = "You are considered to be overweight."
        } else {
            bmiInfo = "You are healthy!"
        }
        
        bmi = tempBMI
    }
}
