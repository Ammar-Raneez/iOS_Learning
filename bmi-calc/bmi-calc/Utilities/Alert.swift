//
//  Alert.swift
//  bmi-calc
//
//  Created by Ammar on 2023-03-16.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let description: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidValues = AlertItem(title: Text("Invalid Input"), description: Text("Please make sure that the values you have entered are numbers :)"), dismissButton: .default(Text("OK")))
}
