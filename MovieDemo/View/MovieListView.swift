//
//  MovieListView.swift
//  MovieDemo
//
//  Created by aifara on 07/02/2024.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var popularState = MovieListState()
    
    var body: some View {
        

        NavigationView {
            List {
               
        
                Group {
                    if popularState.movies != nil {
                       MovieImageView(title: "Popular Now", movies: popularState.movies!)
                        
                    } else {
                        LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                            self.popularState.loadMovies(with: .popular)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                
          
                
            }
            .navigationBarTitle("Flix")
            .environment(\.colorScheme, .dark)
         
        }

        .onAppear {
            self.popularState.loadMovies(with: .popular)
       
        }
        
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}


