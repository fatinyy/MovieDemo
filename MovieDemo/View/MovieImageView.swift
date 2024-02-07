//
//  MovieImageView.swift
//  MovieDemo
//
//  Created by aifara on 07/02/2024.
//



import SwiftUI

struct MovieImageView: View {
    
    let title: String
    let movies: [Movie]
    
    init(title: String, movies: [Movie]) {
        self.title = title
        self.movies = movies
    }
    
    
    private var splitArray: [[Movie]] {
        var result: [[Movie]] = []
        
        var list1: [Movie] = []
        var list2: [Movie] = []
        
        movies.forEach { photo in
            let index = movies.firstIndex {$0.id == photo.id }
            
            if let index = index {
                if index % 2 == 0  {
                    list1.append(photo)
                } else {
                    list2.append(photo)
                }
            }
        }
        result.append(list1)
        result.append(list2)
        return result
        
    }
    
    var body: some View {
        VStack(alignment: .leading ,spacing: 10) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
                .background(Color.black)

            HStack(alignment: .top) {
                LazyVStack(spacing: 8) {
                    ForEach(splitArray[0]) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)){
                            MovieCardView(movie: movie)
                        }.buttonStyle(PlainButtonStyle())
                            .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                            .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                           
                    }
                }
                
                LazyVStack(spacing: 8) {
                    ForEach(splitArray[1]) { movie in
                        
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)){
                            MovieCardView(movie: movie)
                        }.buttonStyle(PlainButtonStyle())
                            .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                            .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                            
                    }
                }
                
        
            }
            .background(Color.black)
        }
        .background(Color.black)
    }
}

struct MovieImageView_Previews: PreviewProvider {
    static var previews: some View {
        MovieImageView(title: "Now Playing", movies: Movie.stubbedMovies)
    }
}
