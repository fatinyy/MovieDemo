//
//  ContentView.swift
//  MovieDemo
//
//  Created by aifara on 07/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            MovieListView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
            }
            .tag(0)
    
             MovieUpcomingListView()
                .tabItem {
                    VStack {
                        Image(systemName: "flame")
                        Text("New & Hot")
                    }
            }
            .tag(1)
        
            ProfileView()
               .tabItem {
                   VStack {
                       Image(systemName: "person.crop.circle")
                       Text("Profile")
                   }
           }
           .tag(2)
            
       
        }
        .environment(\.colorScheme, .dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
