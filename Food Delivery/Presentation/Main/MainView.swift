//
//  MainView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 16/09/2023.
//

import SwiftUI

struct MainView: View {
    static let identifier = "main"
    @State private var tabBarAppearance: UITabBarAppearance?
   
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 0.58, green: 0.59, blue: 0.62, alpha: 1)
        
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            Text("Notifs")
            
                .tabItem {
                    Image(systemName: "bell")
                }
            
             Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                }
            
            Text("More")
                .tabItem {
                    Image(systemName: "ellipsis.bubble")
                }
            
            
        }
        .accentColor(Color.theme.selectedTabColor)
        .navigationBarBackButtonHidden()
       
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
