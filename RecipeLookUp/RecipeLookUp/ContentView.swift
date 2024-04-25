//
//  ContentView.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 17/3/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    @Environment(SwiftDataViewModel.self) var swiftDataViewModel
    
    var body: some View {
        
        TabView {
            MyMeals()
                .tabItem {
                    Label("My meals", systemImage: "person.circle.fill")
                }
            
            DiscoverMeals()
                .tabItem {
                    Label("Discover", systemImage: "safari")
                }
            
        }
        .onAppear{
            swiftDataViewModel.getLikedMeals()
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
