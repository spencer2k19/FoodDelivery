//
//  FoodGridItemView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 26/09/2023.
//

import SwiftUI

struct FoodGridItemView: View {
    let food: Food
    var body: some View {
        
        ZStack {
            VStack {
                VStack(spacing: 5) {
                    Text(food.name)
                        .font(.custom("Satoshi-Bold", size: 16))
                    
                    HStack {
                        Text(food.description)
                            .font(.custom("Satoshi-Regular", size: 12))
                            .foregroundColor(Color(red: 0.58, green: 0.59, blue: 0.62))
                        
                        Image("custom_cheese")
                            .resizable()
                            .frame(width: 11, height: 11)
                    }
                    
                    
                    HStack(alignment: .bottom, spacing: 2) {
                        Text("$")
                            .font(.custom("Satoshi-Bold", size: 12))
                            .padding(.bottom,2)
                        
                        Text(food.price)
                            .font(.custom("Satoshi-Bold", size: 16))
                    }
                    
                    Spacer().frame(height: 10)
                    HStack {
                        
                        Image("shopping")
                            .resizable()
                            .frame(width: 16, height: 16)
                        
                        Spacer().frame(width: 20)
                        Text("ADD TO CART")
                            .foregroundColor(.white)
                            .font(.custom("Satoshi-Regular", size: 14))
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(Color.theme.accent)
                    .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                    
                }.padding(.top,90)
            }
            .background(Color.theme.cardBackgroundColor)
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.12), radius: 18, x: 0, y: 20)
            
            .overlay(
                Image(food.imageName)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .overlay(
                        Circle()
                        
                            .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
                            .frame(width: 32, height: 32)
                            .overlay(
                                Image("heart")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                            )
                            .padding(.top,10)
                        
                        ,alignment: .topTrailing
                    )
                    .offset(y: -50)
                ,alignment: .top)
            .frame(maxWidth: .infinity)
            
            
            
        }.padding(.top,60)
        
        
        
        
    }
}

struct FoodGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodGridItemView(food: dev.food)
    }
}
