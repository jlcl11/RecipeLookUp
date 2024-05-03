//
//  MealDetail().swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 17/3/24.
//

import SwiftUI

struct MealDetail: View {
    @Environment(\.openWindow) private var openIngredientsWindow
    @State private var isHeartFilled = false
    @Environment(SwiftDataViewModel.self) var swiftDataViewModel
   
    var meal: Meal

    var body: some View {
        ZStack() {
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
                
                
                HStack {
                    Button(action: {
                        isHeartFilled.toggle()
                        swiftDataViewModel.handleMeal(meal: meal, isHeartFilled: isHeartFilled)
                        
                    }) {
                        Label("", systemImage: isHeartFilled ? "heart.fill" : "heart")
                        
                    }.symbolEffect(.bounce.down, value: isHeartFilled)
                        .padding()
                    
                    Button(action: {
                        openIngredientsWindow(id: "Ingredients", value: meal)
                    }) {
                        Label("", systemImage: "carrot")
                    }

                    
                    Button(action: {
                        openIngredientsWindow(id: "Instructions", value: meal)
                    }) {
                        Label("", systemImage: "play.circle")
                    }.padding()
                    
                    Button(action: {
                        openIngredientsWindow(id: "ImageZoomed", value: meal)
                    }) {
                        Label("", systemImage: "magnifyingglass")
                    }
                    .padding(.trailing)
                    
                }
          
            }
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .padding()
            .offset(x: 0, y: 200)
            
        }
        .onAppear {
            isHeartFilled = swiftDataViewModel.isMealFavorite(meal)
        }
    }
}
 
