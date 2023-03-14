//
//  Alert.swift
//  QuadraticSolver
//
//  Created by Ammar on 2023-02-28.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidInput = AlertItem(title: Text("Invalid Input"), message: Text("Values you have entered is not valid. please check."), dismissButton: .default(Text("Ok")))

    static let imaginaryNumber = AlertItem(title: Text("Not Supported"), message: Text("Sorry... Looks like the roots are imaginary numbers. This functionality is not supported currently."), dismissButton: .default(Text("Ok")))
}
