//
//  RestaurantView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 15/09/2023.
//

import SwiftUI

struct RestaurantView: View {
    let restaurant: Restaurant
    
    var body: some View {
        Rectangle()
            .foregroundColor(.theme.cardBackgroundColor)
            .frame(width: 150, height: 150)
            .cornerRadius(16)
            .shadow(color: Color(red: 0.12, green: 0.12, blue: 0.12).opacity(0.08), radius: 8, x: 0, y: 4)
            .overlay(
                VStack(spacing: 10,content: {
                    FoodImageView(imageName: restaurant.logo ?? "")
                        .frame(width: 70, height: 70)
                        .scaledToFit()
                    
                    Text(restaurant.name ?? "")
                        .font(.custom("Satoshi-Bold", size: 15))
                    
                    Text("15mins")
                        .font(.custom("Satoshi-Regular", size: 13))
                        .foregroundColor(Color(red: 0.58, green: 0.59, blue: 0.62))
                })
            )

    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView(restaurant: dev.restaurant)
    }
}
