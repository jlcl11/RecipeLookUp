//
//  ContentView.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 17/3/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
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
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
