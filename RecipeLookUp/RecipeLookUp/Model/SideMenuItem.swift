//
//  SideMenuItem.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 17/3/24.
//

import Foundation

struct SideMenuItems: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var icon: String
}

let sideMenuItems: [ SideMenuItems] = [
    SideMenuItems(name: "All Meals", icon: "fork.knife.circle"),
    SideMenuItems(name: "Per category", icon: "birthday.cake"),
    SideMenuItems(name: "Alphabetic order", icon: "a.circle"),
    SideMenuItems(name: "Random meal", icon: "arrow.2.squarepath")]
