//
//  MealDetail().swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 17/3/24.
//

import SwiftUI

struct MealDetail: View {
    var meal: Meal
    @State private var isHeartFilled = false
    
    var body: some View {
        ZStack {
            if let url = URL(string: meal.strMealThumb) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .edgesIgnoringSafeArea(.all)
                    case .failure(let error):
                        Text("Error al cargar la imagen: \(error.localizedDescription)")
                    case .empty:
                        ProgressView()
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            
            VStack(alignment:.leading) {
                Text(meal.strMeal)
                    .foregroundStyle(.white.gradient)
                    .bold()
                    .font(.system(.extraLargeTitle, design: .rounded))
                    .padding()
                    .cornerRadius(8)
                
                Divider()
                
                HStack {
                    Button(action: { isHeartFilled.toggle(/*ingredients*/) }) {
                        Label("", systemImage: "carrot")
                    }.padding()
                    
                    Button(action: { isHeartFilled.toggle(/*measures*/) }) {
                        Label("", systemImage: "ruler")
                    }
                    
                    Button(action: { isHeartFilled.toggle(/*lets cook*/) }) {
                        Label("", systemImage: "play.circle.fill")
                    }.padding()
                }
          
            }
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
            .padding()
        }
        .toolbar {
            ToolbarItem {
                Button(action: { isHeartFilled.toggle() }) {
                    Label("", systemImage: isHeartFilled ? "heart.fill" : "heart")
                }.symbolEffect(.bounce.down, value: isHeartFilled)
            }
        }
    }
}

struct MealDetail_Preview: PreviewProvider {
    static var previews: some View {
        let sampleMeal = Meal(idMeal: "1", strMeal: "Walnut Roll Gužvara", strInstructions: "Sample Instructions", strMealThumb: "https://www.themealdb.com//images//media//meals//u9l7k81628771647.jpg", strTags: nil, strYoutube: "sample_youtube_url", strIngredient1: nil, strIngredient2: nil, strIngredient3: nil, strIngredient4: nil, strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: nil, strMeasure2: nil, strMeasure3: nil, strMeasure4: nil, strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil)
        
        MealDetail(meal: sampleMeal)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

