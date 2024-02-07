//
//  MovieCardView.swift
//  MovieDemo
//
//  Created by aifara on 07/02/2024.
//

import SwiftUI

struct MovieCardView: View {
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        ZStack {
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(16)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 4)
                    
                
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .cornerRadius(16)
                    .shadow(radius: 4)
                
                Text(movie.title)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity)
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.posterURL)
        }
    }
}

struct MoviePosterCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movie: Movie.stubbedMovie)
    }
}
