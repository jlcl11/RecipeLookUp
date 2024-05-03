//
//  CategoryView.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 15/4/24.
//

import SwiftUI

struct CategoryView: View {
    let category: Category
    let meals: [Meal]
    
    var body: some View {
        NavigationLink(destination: CategoryDisplayView(category: category, allMeals: meals )) {
            VStack {
                AsyncImage(url: URL(string: category.strCategoryThumb)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
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
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5), lineWidth: 1))
                .frame(width: 150, height: 150)
                
                Text(category.strCategory)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
            }
            .padding(10)
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5), lineWidth: 1))
        }
        .buttonStyle(PlainButtonStyle())
        .padding(10)
    }
}

