//
//  ContentViewViewModel.swift
//  QuadraticSolver
//
//  Created by Ammar on 2023-02-28.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
    var a = ""
    var b = ""
    var c = ""

    @Published var x1 = 0.0
    @Published var x2 = 0.0
    @Published var alertItem: AlertItem?
    
    func solveForX() {
        x1 = 0
        x2 = 0
        
        guard let doublea = Double(a), let doubleb = Double(b), let doublec = Double(c) else {
            print("Couldn't cast values. Check textfield")
            alertItem = AlertContext.invalidInput
            return
        }

        let rootTerm = getRootTerm(doublea, doubleb, doublec)
        if rootTerm < 0 {
            print("Complex roots are not handled by this application")
            alertItem = AlertContext.imaginaryNumber
            return
        }

        let sqrtTerm = sqrt(rootTerm)

        x1 = (-doubleb + sqrtTerm) / 2 * doublea
        x2 = (-doubleb - sqrtTerm) / 2 * doublea
    }
    
    func getRootTerm(_ a: Double, _ b: Double, _ c: Double) -> Double {
        pow(b, 2) - 4 * a * c
    }
}
