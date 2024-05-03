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
                        if let ingredient = getValue(forKey: "strIngredient\(index)", meal: meal),
                           let measure = getValue(forKey: "strMeasure\(index)", meal: meal),
                           !ingredient.isEmpty && !measure.isEmpty {
                            Text("• \(ingredient) - \(measure)")
                                .font(.body)
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .padding()
    }
    
    // Función auxiliar para obtener el valor de una propiedad de la comida
    private func getValue(forKey key: String, meal: Meal) -> String? {
        switch key {
        case "strIngredient1": return meal.strIngredient1
        case "strIngredient2": return meal.strIngredient2
        case "strIngredient3": return meal.strIngredient3
        case "strIngredient4": return meal.strIngredient4
        case "strIngredient5": return meal.strIngredient5
        case "strIngredient6": return meal.strIngredient6
        case "strIngredient7": return meal.strIngredient7
        case "strIngredient8": return meal.strIngredient8
        case "strIngredient9": return meal.strIngredient9
        case "strIngredient10": return meal.strIngredient10
        case "strIngredient11": return meal.strIngredient11
        case "strIngredient12": return meal.strIngredient12
        case "strIngredient13": return meal.strIngredient13
        case "strIngredient14": return meal.strIngredient14
        case "strIngredient15": return meal.strIngredient15
        case "strIngredient16": return meal.strIngredient16
        case "strIngredient17": return meal.strIngredient17
        case "strIngredient18": return meal.strIngredient18
        case "strIngredient19": return meal.strIngredient19
        case "strIngredient20": return meal.strIngredient20
        case "strMeasure1": return meal.strMeasure1
        case "strMeasure2": return meal.strMeasure2
        case "strMeasure3": return meal.strMeasure3
        case "strMeasure4": return meal.strMeasure4
        case "strMeasure5": return meal.strMeasure5
        case "strMeasure6": return meal.strMeasure6
        case "strMeasure7": return meal.strMeasure7
        case "strMeasure8": return meal.strMeasure8
        case "strMeasure9": return meal.strMeasure9
        case "strMeasure10": return meal.strMeasure10
        case "strMeasure11": return meal.strMeasure11
        case "strMeasure12": return meal.strMeasure12
        case "strMeasure13": return meal.strMeasure13
        case "strMeasure14": return meal.strMeasure14
        case "strMeasure15": return meal.strMeasure15
        case "strMeasure16": return meal.strMeasure16
        case "strMeasure17": return meal.strMeasure17
        case "strMeasure18": return meal.strMeasure18
        case "strMeasure19": return meal.strMeasure19
        case "strMeasure20": return meal.strMeasure20
        default: return nil
        }
    }
}

