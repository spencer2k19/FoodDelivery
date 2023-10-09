//
//  Food_DeliveryApp.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 11/09/2023.
//

import SwiftUI
import NavigationBackport

@main
struct Food_DeliveryApp: App {
   
    var body: some Scene {
        WindowGroup {
            NBNavigationStack {
               StartView()
                    .nbNavigationDestination(for: Destination.self, destination: { destination in
                        switch destination {
                        case .login:
                            LoginView()
                        case .register:
                            RegisterView()
                            
                        default:
                            LoginView()
                        }
                    })
            }
           
           
        }
    }
}
