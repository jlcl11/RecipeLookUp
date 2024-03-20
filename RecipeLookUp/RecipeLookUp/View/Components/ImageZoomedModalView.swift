//
//  ImageZoomedModalView.swift
//  RecipeLookUp
//
//  Created by José Luis Corral on 20/3/24.
//

import SwiftUI

struct ImageZoomedModalView: View {
    let imageString: String
    
    var body: some View {
        if let url = URL(string: imageString) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                case .failure(let error):
                    Text("Error al cargar la imagen: \(error.localizedDescription)")
                case .empty:
                    ProgressView()
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    ImageZoomedModalView(imageString: "")
}
