//
//  MealViewModel.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 17/3/24.
//

import Foundation

class MealViewModel: ObservableObject {
    static let shared = MealViewModel()

    @Published var meals: [Meal] = []
    @Published var categories: [Category] = []

    private init() {}

    func fetchAllMeals() {
            let alphabet = "abcdefghijklmnopqrstuvwxyz"
            var allMeals: [Meal] = []

            alphabet.forEach { letter in
                fetchMeals(forLetter: letter) { meals in
                    if let meals = meals {
                        allMeals.append(contentsOf: meals)
                        allMeals.sort { $0.strMeal < $1.strMeal } // Ordenar el array alfabéticamente
                        DispatchQueue.main.async {
                            self.meals = allMeals
                        }
                    }
                }
            }
        }

     func fetchCategories() {
           let urlString = "https://www.themealdb.com/api/json/v1/1/categories.php"
           guard let url = URL(string: urlString) else {
               print("Invalid URL")
               return
           }

           URLSession.shared.dataTask(with: url) { data, response, error in
               guard let data = data, error == nil else {
                   print("Error fetching categories: \(error?.localizedDescription ?? "Unknown error")")
                   return
               }

               do {
                   let decoder = JSONDecoder()
                   let decodedData = try decoder.decode([String: [Category]].self, from: data)
                   if let categories = decodedData["categories"] {
                       DispatchQueue.main.async {
                           self.categories = categories
                       }
                   }
               } catch {
                   print("Error decoding categories: \(error)")
               }
           }.resume()
       }
    
    private func fetchMeals(forLetter letter: Character, completion: @escaping ([Meal]?) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?f=\(letter)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching data for letter \(letter): \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode([String: [Meal]].self, from: data)
                if let meals = decodedData["meals"] {
                    completion(meals)
                } else {
                    completion(nil)
                }
            } catch {
                print("Error decoding data for letter \(letter): \(error)")
                completion(nil)
            }
        }.resume()
    }
}
