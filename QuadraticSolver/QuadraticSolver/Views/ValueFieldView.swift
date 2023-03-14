//
//  ValueFieldView.swift
//  QuadraticSolver
//
//  Created by Ammar on 2023-02-28.
//

import SwiftUI

struct ValueFieldView: View {
    @Binding var value: String
    var label: String
    var imageName: String
    
    var body: some View {
        Label {
            Text(label)
                .font(.title)
        } icon: {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 20, height: 20)
        }

        TextField(label, text: $value)
            .multilineTextAlignment(.center)
            .border(.primary)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 14)
            .keyboardType(.decimalPad)
    }
}
