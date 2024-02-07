//
//  MovieUpcomingListView.swift
//  MovieDemo
//
//  Created by aifara on 07/02/2024.
//


import SwiftUI

struct MovieUpcomingListView: View {
    
    @ObservedObject private var upcomingState = MovieListState()
    
    var body: some View {
        

        NavigationView {
            List {
               
        
                Group {
                    if upcomingState .movies != nil {
                       MovieImageView(title: "Hot & New !", movies: upcomingState.movies!)
                        
                    } else {
                        LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
                            self.upcomingState.loadMovies(with: .upcoming)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                
          
                
            }
            .navigationBarTitle("Flix")
            .environment(\.colorScheme, .dark)
         
        }

        .onAppear {
            self.upcomingState.loadMovies(with: .upcoming)
       
        }
        
    }
}

struct MovieUpcomingListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieUpcomingListView()
    }
}


