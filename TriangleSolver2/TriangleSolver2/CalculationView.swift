//
//  CalculationView.swift
//  TriangleSolver
//
//  Created by Ammar on 2023-03-17.
//

import SwiftUI

struct CalculationView: View {
    @State private var edgeType = Edge.Hypotenuse
    @AppStorage("a") private var a = ""
    @AppStorage("b") private var b = ""
    @AppStorage("c") private var c = ""
    @AppStorage("aField") private var aField = ""
    @AppStorage("bField") private var bField = ""
    @AppStorage("cField") private var cField = ""
    @AppStorage("area") private var area = ""
    @AppStorage("perimeter") private var perimeter = ""
    @AppStorage("calulated") private var calculated = false
    @State private var invalidInput = false
    
    func calculateArea() {
        guard let valOne = Double(a), let valTwo = Double(b) else {
            invalidInput = true
            return
        }
        
        switch edgeType {
        case .Hypotenuse:
            // valOne = altitude; valTwo = base; valThree = hypotenuse
            let valThree = sqrt(pow(valOne, 2) + pow(valTwo, 2))
            c = "\(valThree)a"
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
        calculated = true
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Image("right_triangle")
                
                HStack {
                    Text("Choose the unknown edge")
                        .fontWeight(.semibold)
                    Picker("edge", selection: $edgeType) {
                        Text(Edge.Base.rawValue).tag(Edge.Base)
                        Text(Edge.Altitude.rawValue).tag(Edge.Altitude)
                        Text(Edge.Hypotenuse.rawValue).tag(Edge.Hypotenuse)
                    }
                    .pickerStyle(.wheel)
                }
                .padding(.leading)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Enter known length values")
                        .fontWeight(.semibold)
                    switch edgeType {
                    case .Hypotenuse:
                        TextField("Altitude Value", text: $a)
                            .textFieldStyle(.roundedBorder)
                        TextField("Base Value", text: $b)
                            .textFieldStyle(.roundedBorder)
                    case .Altitude:
                        TextField("Base Value", text: $a)
                            .textFieldStyle(.roundedBorder)
                        TextField("Hypotenuse Value", text: $b)
                            .textFieldStyle(.roundedBorder)
                    case .Base:
                        TextField("Altitude Value", text: $a)
                            .textFieldStyle(.roundedBorder)
                        TextField("Hypotenuse Value", text: $b)
                            .textFieldStyle(.roundedBorder)
                    }
                    HStack(alignment: .center) {
                        Button {
                            calculateValues()
                        } label: {
                            Text("Calculate")
                        }
                        .buttonStyle(.borderedProminent)
                        .frame(maxWidth: .infinity)
                        .tint(.green)
                            
                    }
                }
                .padding(.horizontal)
                
                if calculated {
                    VStack {
                        HStack {
                            Text("\(cField):")
                            Spacer()
                            Text("\(c)")
                        }
                        HStack {
                            Text("Area:")
                            Spacer()
                            Text("\(area)")
                        }
                        HStack {
                            Text("Perimeter:")
                            Spacer()
                            Text("\(perimeter)")
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle(Text("Triangle Calculator"))
            .alert(isPresented: $invalidInput) {
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
