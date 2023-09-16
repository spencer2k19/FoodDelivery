//
//  Food_DeliveryApp.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 11/09/2023.
//

import SwiftUI

@main
struct Food_DeliveryApp: App {
    @State private var isActive : Bool = false
    @StateObject private var navRoute = NavRouteModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView(isActive: $isActive)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environment(\.rootPresentationMode, $isActive)
            .environmentObject(navRoute)
           
        }
    }
}
