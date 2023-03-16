//
//  FieldValueView.swift
//  bmi-calc
//
//  Created by Ammar on 2023-03-16.
//

import SwiftUI

struct FieldValueView: View {
    var heading: String
    @Binding var value: String
    
    var body: some View {
        Text(heading)
            .frame(maxWidth: .infinity, alignment: .leading)
        TextField("Enter Your \(heading)", text: $value)
            .border(.primary)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.decimalPad)
    }
}

struct FieldValueView_Previews: PreviewProvider {
    static var previews: some View {
        FieldValueView(heading: "Height", value: .constant("20"))
    }
}
