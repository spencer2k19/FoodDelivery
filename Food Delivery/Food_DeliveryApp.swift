//
//  Food_DeliveryApp.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 11/09/2023.
//

import SwiftUI
import NavigationBackport
import Combine



@main
struct Food_DeliveryApp: App {
    @State var path = NBNavigationPath()
    
    
    var body: some Scene {
        WindowGroup {
            
            ZStack(content: {
                
                    NBNavigationStack(path: $path) {
                        IntroView()
                        
                            .nbNavigationDestination(for: Destination.self) { destination in
                                switch destination {
                                case .start:
                                    StartView()
                                case .login:
                                    LoginView()
                                case .register:
                                    RegisterView()
                                case .bio:
                                    BioView()
                                case .payment(let fromLogin):
                                    PaymentMethodView(fromLogin: fromLogin)
                                case .addCreditCard:
                                    AddCreditCardView()
                                case .uploadPhoto:
                                    UploadPhotoView()
                                case .location:
                                    LocationView()
                                case .home:
                                        MainView()
                                case .notifications:
                                    NotificationsView()
                                case .orderDetails(let order):
                                    OrderDetailsView(with: order)
                                case .deliverAddress:
                                    DeliveryView()
                                case .restaurantDetails(let restaurant):
                                    RestaurantDetailsView(restaurant: restaurant)
                                case .testimonials(let restaurantId):
                                    TestimonialsView(restaurant: restaurantId)
                                case .favorites:
                                    FavoritesView()
                                case .popularMenu(let restaurantId):
                                    PopularMenuView(restaurantId: restaurantId)
                                case .forgotPassword:
                                    ForgotPasswordView()
                               
                                case .resendPassword:
                                    ResendPasswordView()
                                case .congratsForgotPassword:
                                    CongratsForgotPasswordView()
                                
                            }
                    }}
                
            })
            
        }
    }
}
