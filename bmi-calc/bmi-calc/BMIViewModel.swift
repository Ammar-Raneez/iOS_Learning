//
//  BMIViewModel.swift
//  bmi-calc
//
//  Created by Ammar on 2023-03-16.
//

import Foundation

final class BMIViewModel: ObservableObject {
    @Published var bmi: Double?;
    
    func calculateBMI(weightVal: String, heightVal: String) {
        guard let weight = Double(weightVal),
              let height = Double(heightVal) else {
            print("Guard failed")
            return
        }
        
        self.bmi = weight / (pow(height, 2))
    }
}
