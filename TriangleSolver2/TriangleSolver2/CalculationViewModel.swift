//
//  CalculationViewModel.swift
//  TriangleSolver2
//
//  Created by Ammar on 2023-03-17.
//

import Foundation

final class CalculationViewModel: ObservableObject {
    @Published var edgeType = Edge.Base
    
    static viewModel: CalculationViewModel
    
    private init() {
        CalculationViewModel.viewModel = CalculationViewModel()
    }
    
//    func getToEnterFields() -> [Edge] {
//        var otherEdges: [Edge] = []
//        switch edgeType {
//        case Edge.Base:
//            otherEdges.append(Edge.Altitude)
//            otherEdges.append(Edge.Hypotenuse)
//        case Edge.Altitude:
//            otherEdges.append(Edge.Base)
//            otherEdges.append(Edge.Hypotenuse)
//        default:
//            otherEdges.append(Edge.Altitude)
//            otherEdges.append(Edge.Base)
//
//        }
//
//        return otherEdges
//    }
}
