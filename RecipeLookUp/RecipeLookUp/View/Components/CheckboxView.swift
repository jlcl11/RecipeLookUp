//
//  CheckboxView.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 19/3/24.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var checked: Bool
    
    var body: some View {
        Button(action: {
            self.checked.toggle()
        }) {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 20, height: 20)
        }
    }
}

