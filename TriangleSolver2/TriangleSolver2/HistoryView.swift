//
//  HistoryView.swift
//  TriangleSolver
//
//  Created by Ammar on 2023-03-17.
//

import SwiftUI

struct HistoryView: View {
    @AppStorage("aField") private var aField = ""
    @AppStorage("bField") private var bField = ""
    @AppStorage("cField") private var cField = ""
    @AppStorage("a") private var a = ""
    @AppStorage("b") private var b = ""
    @AppStorage("c") private var c = ""
    @AppStorage("area") private var area = ""
    @AppStorage("perimeter") private var perimeter = ""
    @AppStorage("calulated") private var calculated = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                HStack {
                    Text(aField)
                    Spacer()
                    Text("\(a)")
                }
                HStack {
                    Text(bField)
                    Spacer()
                    Text("\(b)")
                }
                HStack {
                    Text(cField)
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
            .navigationTitle(Text("Last Calculation"))
            
            Spacer()
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
