//
//  Food_DeliveryApp.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 11/09/2023.
//

import SwiftUI

@main
struct Food_DeliveryApp: App {
    @StateObject private var navRoute = NavRouteModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
               StartView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(navRoute)
           
        }
    }
}
