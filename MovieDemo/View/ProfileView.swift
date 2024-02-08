//
//  ProfileView.swift
//  MovieDemo
//
//  Created by aifara on 07/02/2024.
//

import SwiftUI

struct ProfileView: View {
    var isPremium: Bool = false // Set this to true if the user is premium
    
    var body: some View {
        NavigationView {
            VStack {
                AvatarView(isPremium: isPremium)
                    .padding(.vertical, 20)
                Text("Jane Doe")
                    .font(.title)
                    .padding(.bottom, 10)
                if isPremium {
                    Text("Premium Subscriber")
                        .foregroundColor(.green)
                        .padding(.bottom, 20)
                } else {
                    Text("Free Subscriber")
                        .foregroundColor(.red)
                        .padding(.bottom, 20)
                }
                Spacer()
            }
            .navigationBarTitle("Profile") // Setting navigation view title
            .navigationBarItems(trailing:
                Button(action: {
                    // Perform logout action
                }) {
                    Text("Logout")
                }
            )
        }
    }
}
struct AvatarView: View {
    var isPremium: Bool
    
    var body: some View {
        
      
                
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                    .overlay(
                        Circle().stroke(Color.yellow, lineWidth: 4)
                    )
                
                
            
           
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isPremium: true)
    }
}
