//
//  MealsByCategory.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 17/3/24.
//

import SwiftUI

import SwiftUI

struct MealsByCategory: View {
    @StateObject var mealViewModel = MealViewModel.shared
    
    var body: some View {
        VStack {
            Text("Categories")
                .font(.extraLargeTitle)
                .padding()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<mealViewModel.categories.count, id: \.self) { index in
                        if index % 4 == 0 {
                            HStack(spacing: 20) {
                                ForEach(index..<min(index + 4, mealViewModel.categories.count), id: \.self) { categoryIndex in
                                    CategoryView(category: mealViewModel.categories[categoryIndex])
                                }
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            mealViewModel.fetchCategories()
        }
    }
}

struct CategoryView: View {
    let category: Category
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: category.strCategoryThumb)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 150)
                        .cornerRadius(10)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                case .empty:
                    ProgressView()
                @unknown default:
                    EmptyView()
                }
            }
            
            Text(category.strCategory)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
        }
        .padding(10)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct MealsByCategory_Previews: PreviewProvider {
    static var previews: some View {
        MealsByCategory()
    }
}

