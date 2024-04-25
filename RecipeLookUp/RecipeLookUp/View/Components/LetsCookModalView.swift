//
//  LetsCookModalView.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 19/3/24.
//

import SwiftUI

struct LetsCookModalView: View {
    let recipeSteps: String
    @State private var completedSteps: [Bool]

    init(recipeSteps: String) {
        self.recipeSteps = recipeSteps
        _completedSteps = State(initialValue: Array(repeating: false, count: LetsCookModalView.getStepsCount(recipeSteps: recipeSteps)))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Recipe instructions")
                .font(.title)
                .fontWeight(.bold)
                .padding(10)
            
            Divider()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(getSteps().indices, id: \.self) { index in
                        HStack {
                            CheckBoxView(checked: $completedSteps[index])
                            Text(getSteps()[index])
                                .strikethrough(completedSteps[index])
                                .foregroundColor(completedSteps[index] ? .gray : .primary)
                                .padding(.leading, 5)
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    private func getSteps() -> [String] {
        let steps = recipeSteps.components(separatedBy: "\r\n")
        return steps.filter { !$0.isEmpty }
    }

    static func getStepsCount(recipeSteps: String) -> Int {
        let steps = recipeSteps.components(separatedBy: "\r\n")
        return steps.filter { !$0.isEmpty }.count
    }
}

 
