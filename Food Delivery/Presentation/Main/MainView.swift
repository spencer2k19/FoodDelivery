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
                    Image(uiImage: UIImage(named: "house")!)
                       
                }
            
            OrdersView()
                .tabItem {
                    Image(uiImage: UIImage(named: "commerce")!)
                }
            
             UserProfileView()
                .tabItem {
                    Image(uiImage: UIImage(named: "user")!)
                }
            
            Text("More")
                .tabItem {
                    Image(uiImage: UIImage(named: "chat")!)
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
