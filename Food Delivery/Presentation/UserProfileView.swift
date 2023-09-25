//
//  UserProfileView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 25/09/2023.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var showFavoritesView: Bool = false
    
    var contentCardColor: Color {
        return colorScheme == .dark ? Color(red: 0.09, green: 0.12, blue: 0.13)
        : Color.white
    }
    
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geometry in
                imageBackground(geometry: geometry)
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        
                        category
                        Text("Muhammad Dominguez")
                            .font(.custom("Satoshi-Bold", size: 17))
                        
                        HStack {
                            
                            Text("Muhamed_dominguez@yahoo.com")
                                .font(.custom("Satoshi-Light", size: 17))
                            
                            Spacer()
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.theme.legerBlue)
                                .overlay(
                                    Image(systemName: "pencil.line")
                                        .foregroundColor(.theme.accent)
                                )
                            
                            
                            
                        }.accentColor(.theme.label)
                        
                        
                        HStack {
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.theme.background)
                                .overlay(Image(systemName: "dollarsign").foregroundColor(.white)
                                )
                            
                            Spacer().frame(width: 20)
                            
                            Text("You have 4 vouchers")
                                .font(.custom("Satoshi-Bold", size: 16))
                        }
                        .padding(.vertical,18)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding()
                        .background(Color.theme.cardBackgroundColor)
                        .cornerRadius(16)
                        .shadow(color: Color(red: 0.05, green: 0.37, blue: 0.98).opacity(0.2), radius: 10, x: 0, y: 7)
                        
                        
                        Spacer().frame(height: 30)
                        
                        HStack {
                            Text("Favorite")
                                .font(.custom("Satoshi-Bold", size: 17))
                            
                            Spacer()
                            Button {
                                showFavoritesView = true
                            } label: {
                                Text("See all")
                                    .font(.custom("Satoshi-Regular", size: 17))
                                    .foregroundColor(.theme.accent)
                            }

                        }
                        
                        Group {
                            FavoriteItemView()
                            FavoriteItemView()
                            FavoriteItemView()
                           
                            NavigationLink(destination: FavoritesView(), isActive: $showFavoritesView) {
                                EmptyView()
                            }
                            
                            
                            Spacer(minLength: 400)
                        }
                      
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(contentCardColor)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .offset(CGSize(width: 0, height: 300))
                }
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}

extension UserProfileView {
    func imageBackground(geometry: GeometryProxy) -> some View {
        return  Image("background_profile")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: geometry.size.width,maxHeight: geometry.size.height)
            .clipped()
            .ignoresSafeArea()
    }
    
    var category: some View {
        Text("Popular")
            .font(.custom("Satoshi-Regular", size: 14))
            .foregroundColor(.white)
            .padding(.horizontal,10)
            .padding(.vertical,5)
            .background(
                RoundedRectangle(cornerRadius: 32)
                    .fill(Color.theme.accent) )
            .padding()
            .offset(x: -20)
    }
}
