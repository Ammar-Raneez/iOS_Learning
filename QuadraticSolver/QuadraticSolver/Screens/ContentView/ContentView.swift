//
//  ContentView.swift
//  QuadraticSolver
//  Starter project code
//  Created by Philip Trwoga on 09/02/2023.
//

import SwiftUI


struct ContentView: View {
    //state vars for a,b,c,x1, and x2
    @AppStorage("aVal") private var a = ""
    @AppStorage("bVal") private var b = ""
    @AppStorage("cVal") private var c = ""
    
    @StateObject private var contentViewModel = ContentViewModel()
    
    //data persistence
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("Quadratic Solver")
                    .font(.system(size: 36))
                
                Text("The quadratic form is:")
                    .font(.subheadline)
                
                Image("quadraticForm")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400)

                ValueFieldView(
                    value: $a,
                    label: "Enter the first term",
                    imageName: "a.circle.fill"
                )
                
                ValueFieldView(
                    value: $b,
                    label: "Enter the second term",
                    imageName: "b.circle.fill"
                )

                ValueFieldView(
                    value: $c,
                    label: "Enter the third term",
                    imageName: "c.circle.fill"
                )

                Button {
                    btnTapped()
                } label: {
                    Text("Solve for x")
                }

                Text("x = \(contentViewModel.x1.formatTwoDP()) x = \(contentViewModel.x2.formatTwoDP())")
            }
        }.alert(item: $contentViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
    
    func btnTapped() {
        contentViewModel.a = a
        contentViewModel.b = b
        contentViewModel.c = c
        contentViewModel.solveForX()
        if contentViewModel.alertItem == nil {
            a = ""
            b = ""
            c = ""
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
