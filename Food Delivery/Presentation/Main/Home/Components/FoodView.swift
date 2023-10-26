//
//  FoodView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 14/09/2023.
//

import SwiftUI

struct FoodView: View {
    let food: Food
    var callableForCart: () -> Void = {}
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.theme.cardBackgroundColor)
                .frame(width: 220, height: 290)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.12), radius: 16, x: 0, y: 20)
                .overlay(
                    ZStack(content: {
                      
                        FoodImageView(imageName: food.image ?? "")
                           
                                .frame(width: 170, height: 170)
                                .overlay(
                                    
                                    Circle()
                                       
                                        .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
                                        .frame(width: 32, height: 32)
                                        .overlay(
                                            Image("heart")
                                                .resizable()
                                                .frame(width: 16, height: 16)
                                        )
                                        .padding(.top,30)
                                    
                                    ,alignment: .topTrailing
                                        
                                )
                                .offset(y: -80)
                        
                        
                        VStack(spacing: 5) {
                            Text(food.name ?? "")
                                .font(.custom("Satoshi-Bold", size: 16))
                            
                            HStack {
                                Text(food.shortDescription ?? "")
                                    .font(.custom("Satoshi-Regular", size: 12))
                                    .foregroundColor(Color(red: 0.58, green: 0.59, blue: 0.62))
                                
                                Image("custom_cheese")
                                    .resizable()
                                    .frame(width: 11, height: 11)
                            }
                            
                            
                            HStack(alignment: .bottom, spacing: 2) {
                                Text(food.currency ?? "")
                                    .font(.custom("Satoshi-Bold", size: 12))
                                    .padding(.bottom,2)
                                
                                Text(food.price?.asNumberString() ?? "")
                                    .font(.custom("Satoshi-Bold", size: 16))
                            }
                            
                            
                          
                            Spacer()
                            
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
                            .onTapGesture {
                                callableForCart()
                            }
                            
                        }.padding(.top,150)
                           
                        
                        
                        
                    })
                )
        }.frame(height: 320)
            .padding(.vertical)
          
        
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(food: dev.food)
    }
}
