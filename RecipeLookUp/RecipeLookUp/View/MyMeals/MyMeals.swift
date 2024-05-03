//
//  MyMeals.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 17/3/24.
//

import SwiftUI

struct MyMeals: View {
    @Environment(SwiftDataViewModel.self) var swiftDataViewModel

    var body: some View {
        NavigationStack {
            
            
            if swiftDataViewModel.likedMeals.isEmpty {
                Text("You haven't liked any meal yet")
            } else {
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 4), spacing: 12) {
                        ForEach(Array(swiftDataViewModel.likedMeals.sorted(by: { $0.strMeal < $1.strMeal }))) { meal in
                            MealPreview(meal: meal).padding(.bottom)
                                 
                        }
                    }
                    .padding()
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarLeading) {
                            VStack(alignment:.leading) {
                                Text("My Meals")
                                    .font(.extraLargeTitle)
                                    .bold()
                         
                            }
                        }
                    }.padding(.horizontal)
                }
            }
        }
    }
}



#Preview {
    MyMeals()
}
