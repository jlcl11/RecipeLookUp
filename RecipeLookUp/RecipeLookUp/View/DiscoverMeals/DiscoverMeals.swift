//
//  DiscoverMeals.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 17/3/24.
//

import SwiftUI

struct DiscoverMeals: View {
    
    var body: some View {
        
        NavigationSplitView {
            SideBarMenu()
        }
    detail: {
        VStack {
            Image(systemName: "fork.knife.circle")
                .resizable()
                .scaledToFit()
            Text("Discover some meals")
                .font(.extraLargeTitle)
                .bold()
                .foregroundStyle(.primary)
        }
        .padding()
        .frame(width: 600, height: 400)
    }
    }
}

#Preview {
    DiscoverMeals()
}
