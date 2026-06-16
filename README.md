<p align="center">
  <img width="1500" alt="RecipeLookUp on Vision Pro" src="https://github.com/jlcl11/RecipeLookUp/assets/92518378/90c42e81-71cd-42fc-b88f-08979d634d04" />
</p>

<h1 align="center">
  <br>
  RecipeLookUp 🥽
  <br>
</h1>

<h3 align="center">Cooking, reimagined for spatial computing.</h3>

<p align="center">
  <strong>visionOS</strong> &nbsp;·&nbsp; <strong>SwiftUI</strong> &nbsp;·&nbsp; <strong>SwiftData</strong> &nbsp;·&nbsp; <strong>TheMealDB API</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/visionOS_1.0%2B-000000?style=for-the-badge&logo=apple&logoColor=white" alt="visionOS 1.0+">
  <img src="https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=swift&logoColor=white" alt="Swift">
  <img src="https://img.shields.io/badge/SwiftUI-007AFF?style=for-the-badge&logo=swift&logoColor=white" alt="SwiftUI">
  <img src="https://img.shields.io/badge/SwiftData-FF9500?style=for-the-badge&logo=swift&logoColor=white" alt="SwiftData">
  <img src="https://img.shields.io/badge/Spatial_Computing-AF52DE?style=for-the-badge&logo=apple&logoColor=white" alt="Spatial Computing">
</p>

---

## What is RecipeLookUp

RecipeLookUp is a recipe discovery app built natively for **Apple Vision Pro**. It explores how an everyday task like browsing a recipe collection translates into spatial computing — windows, volumes, ornaments, hover effects and depth-aware layouts — while staying lightweight and offline-friendly.

Recipes are fetched from [TheMealDB](https://www.themealdb.com/) and stored locally with SwiftData so favourites survive between sessions and load instantly the next time you put the headset on.

---

## Features

| | |
|---|---|
| **Browse** | Search recipes by name, ingredient or category. Results render as cards laid out in a volumetric grid optimised for visionOS focus interactions. |
| **Inspect** | Open a recipe to see ingredients, steps and the source video — each piece in its own panel using `Window` and `Ornament` patterns. |
| **Save** | One-tap save into a local library backed by SwiftData. Works offline once a recipe has been viewed. |
| **Spatial UI** | Hover effects, glass materials, depth and parallax — built using native visionOS controls, no UIKit shims. |

---

## Architecture

```
RecipeLookUp/
  App/                    visionOS scene definitions (Window + Volume)
  Views/                  SwiftUI screens tuned for visionOS focus model
    Components/           Cards, panels, ornaments
  ViewModels/             @Observable state holders
  Models/                 Meal, Ingredient, Category (Codable + SwiftData)
  Networking/             URLSession async REST client for TheMealDB
  Persistence/            ModelContainer setup + favourites store
```

- **SwiftUI** for declarative UI tuned to visionOS interaction patterns
- **SwiftData** for local persistence of favourites
- **async/await** networking with `URLSession`
- **MVVM** with `@Observable` view models

---

## Quick Start

**Requirements:** Xcode 15+ · visionOS 1.0+ (Apple Vision Pro device or Simulator) · macOS Sonoma or newer

```bash
git clone https://github.com/jlcl11/RecipeLookUp.git
cd RecipeLookUp
open RecipeLookUp.xcodeproj
```

Build for "Apple Vision Pro" or the visionOS Simulator and run.

---

## Tech Stack

| Technology | Role |
|---|---|
| **SwiftUI on visionOS** | Native spatial UI — windows, volumes, ornaments, hover effects |
| **SwiftData** | Local persistence of saved recipes |
| **URLSession + async/await** | REST client for TheMealDB (no third-party deps) |
| **@Observable** | Reactive state management |
| **MVVM** | Clean separation of view, view-model and data layers |

---

## Data Source

Recipes come from the free [TheMealDB](https://www.themealdb.com/) API: meals, categories, ingredients and source videos. Attribution to TheMealDB is shown inside the app.

---

<p align="center">
  Built by <a href="https://github.com/jlcl11">Jose Luis Corral Lopez</a> · A portfolio look at SwiftUI on visionOS
</p>
