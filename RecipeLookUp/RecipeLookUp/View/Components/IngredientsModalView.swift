//
//  IngredientsModalView.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 19/3/24.
//

import SwiftUI

struct IngredientsModalView: View {
    let meal: Meal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Ingredientes")
                .font(.title)
                .fontWeight(.bold)
                .padding(10)
            
            Divider()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(1...20, id: \.self) { index in
                        if let ingredient = self.getIngredient(at: index), !ingredient.isEmpty,
                           let measure = self.getMeasure(at: index), !measure.isEmpty {
                            Text("• \(measure) \(ingredient)")
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    private func getIngredient(at index: Int) -> String? {
        let mirror = Mirror(reflecting: meal)
        let ingredient = mirror.children.first { $0.label == "strIngredient\(index)" }?.value as? String
        return ingredient
    }
    
    private func getMeasure(at index: Int) -> String? {
        let mirror = Mirror(reflecting: meal)
        let measure = mirror.children.first { $0.label == "strMeasure\(index)" }?.value as? String
        return measure
    }
}
