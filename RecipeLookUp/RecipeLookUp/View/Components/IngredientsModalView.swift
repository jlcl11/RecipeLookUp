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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let meal = Meal(idMeal: "52958", strMeal: "Peanut Butter Cookies", strInstructions: "Preheat oven to 350°F (180°C).\r\nIn a large bowl, mix together the peanut butter, sugar, and egg.\r\nScoop out a spoonful of dough and roll it into a ball. Place the cookie balls onto a nonstick baking sheet.\r\nFor extra decoration and to make them cook more evenly, flatten the cookie balls by pressing a fork down on top of them, then press it down again at a 90° angle to make a criss-cross pattern.\r\nBake for 8-10 minutes or until the bottom of the cookies are golden brown.\r\nRemove from baking sheet and cool.\r\nEnjoy!", strMealThumb: "https://www.themealdb.com/images/media/meals/1544384070.jpg", strTags: "Breakfast,UnHealthy,BBQ", strYoutube: "", strCategory: nil, strIngredient1: "Peanut Butter", strIngredient2: "Sugar", strIngredient3: "Egg", strIngredient4: nil, strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: "1 cup ", strMeasure2: "1/2 cup ", strMeasure3: "1", strMeasure4: nil, strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil)
        
        return IngredientsModalView(meal: meal)
    }
}
