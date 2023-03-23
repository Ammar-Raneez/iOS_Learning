//
//  CalculationViewModel.swift
//  TriangleSolver2
//
//  Created by Ammar on 2023-03-23.
//

import SwiftUI

final class CalculationViewModel: ObservableObject {
    @Published var edgeType = Edge.Hypotenuse
    @Published var invalidInput = false
    
    @AppStorage("a") var a = ""
    @AppStorage("aField") var aField = ""
    @AppStorage("b") var b = ""
    @AppStorage("bField") var bField = ""
    @AppStorage("c") var c = ""
    @AppStorage("cField") var cField = ""

    @AppStorage("area") var area = ""
    @AppStorage("perimeter") var perimeter = ""
    @AppStorage("calculated") var calculated = false
    
    func calculateArea() {
        guard let valOne = Double(a), let valTwo = Double(b) else {
            invalidInput = true
            return
        }
        
        switch edgeType {
        case .Hypotenuse:
            // valOne = altitude; valTwo = base; valThree = hypotenuse
            let valThree = sqrt(pow(valOne, 2) + pow(valTwo, 2))
            c = "\(valThree)"
            aField = Edge.Altitude.rawValue
            bField = Edge.Base.rawValue
            cField = Edge.Hypotenuse.rawValue
            area = "\((valOne * valTwo) / 2)"
        case .Base:
            // valOne = altitude; valTwo = hypotenuse; valThree = base
            let valThree = sqrt(pow(valTwo, 2) - pow(valOne, 2))
            c = "\(valThree)"
            aField = Edge.Altitude.rawValue
            bField = Edge.Hypotenuse.rawValue
            cField = Edge.Base.rawValue
            area = "\((valOne * valThree) / 2)"
        case .Altitude:
            // valOne = base; valTwo = hypotenuse; valThree = altitude
            let valThree = sqrt(pow(valTwo, 2) - pow(valOne, 2))
            c = "\(valThree)"
            aField = Edge.Base.rawValue
            bField = Edge.Hypotenuse.rawValue
            cField = Edge.Altitude.rawValue
            area = "\((valThree * valOne) / 2)"
        }
    }
    
    func calculatePerimeter() {
        guard let valOne = Double(a), let valTwo = Double(b), let valThree = Double(c) else {
            return
        }

        switch edgeType {
        case .Hypotenuse:
            // valOne = altitude; valTwo = base; valThree = hypotenuse
            perimeter = "\(valOne + valTwo + sqrt(pow(valOne, 2) + pow(valTwo, 2)))"
        case .Base:
            // valOne = altitude; valTwo = hypotenuse; valThree = base
            perimeter = "\(valOne + valThree + sqrt(pow(valOne, 2) + pow(valThree, 2)))"
        case .Altitude:
            // valOne = base; valTwo = hypotenuse; valThree = altitude
            perimeter = "\(valThree + valOne + sqrt(pow(valThree, 2) + pow(valOne, 2)))"
        }
    }
    
    func calculateValues() {
        calculated = false
        invalidInput = false
        calculateArea()
        calculatePerimeter()
        if !invalidInput {
            calculated = true
        }
    }
}
