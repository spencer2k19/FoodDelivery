//
//  StartView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 27/09/2023.
//

import SwiftUI
import NavigationBackport

struct StartView: View {
    @State private var showLogin: Bool = false
    @EnvironmentObject private var navigator: PathNavigator
    
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Image("intro_burger")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .scaledToFill()
                    .opacity(0.7)
                    .offset(x: -70)
                    .ignoresSafeArea()
               
                
                
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(maxWidth:.infinity, maxHeight: .infinity)
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.09, green: 0.15, blue: 0.16), location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.09, green: 0.15, blue: 0.16).opacity(0), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0.5, y: 1),
                                endPoint: UnitPoint(x: 0.5, y: 0.36)
                            )
                        )
                        .ignoresSafeArea()
                
                
                VStack(alignment: .leading,spacing: 15) {
                    Spacer()
                    Text("Brand")
                        .font(.custom("Satoshi-Bold", size: 20))
                        .foregroundColor(.white)
                    
                    Text("Savor the convenience of restaurant-quality meals, delivered promptly.")
                        .font(.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(.white)
                        .frame(maxWidth: 300,alignment: .leading)
                    
                    
                    Spacer().frame(height: 5)
                    
                    Button {
                        navigator.push(Destination.login)
                    } label: {
                        Text("NEXT")
                            .font(.custom("Satoshi-Bold", size: 17))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical,15)
                            .background(Color.white)
                           
                            .cornerRadius(50)
                            .padding(.trailing,80)
                           
                            
                    }

                    
                }.frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal,20)
                    .padding(.bottom,40)
                
                NavigationLink(destination: LoginView(), isActive: $showLogin) {
                    EmptyView()
                }
                
            }
        }
        
       
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
