//
//  FoodCartItemView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 27/10/2023.
//

import SwiftUI






struct FoodCartItemView: View {
    let food: FoodEntity
    var currentQuantity: Int = 0
    
    init(entity: FoodEntity) {
        food = entity
        currentQuantity = Int(entity.quantity)
    }
   
    
    var body: some View {
        HStack {
            FoodImageView(imageName: food.image ?? "")
                .frame(width: 70, height: 70)
                .clipShape(RoundedCorner(radius: 10))
            
            Spacer().frame(width: 20)
            
            VStack(alignment: .leading,spacing: 5) {
                Text(food.name ?? "")
                    .font(.custom("Satoshi-Bold", size: 17))
                HStack {
                    Text("Provider:")
                      .font(Font.custom("Satoshi-Regular", size: 15))
                      .foregroundColor(Color(red: 0.63, green: 0.63, blue: 0.63))
                    
                    Text("King Food")
                        .font(.custom("Satoshi-Regular", size: 15))
                        .foregroundColor(.theme.red)
                }
                
                HStack {
                    Text("\(food.quantity) x \(food.price.asNumberString()) \(food.currency ?? "")")
                        .font(.custom("Satoshi-Regular", size: 15))
                    Spacer()
                    Image(systemName: "minus.circle")
                        .onTapGesture {
                            
                        }
                    Text("\(currentQuantity)")
                    Image(systemName: "plus.circle")
                        .onTapGesture {
                            
                        }
                    
                }
            }
            
            
            
            
            
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding()
        .background(Color.theme.cardBackgroundColor)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        
    }
}

struct FoodCartItemView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Food cart item view")
    }
}
