//
//  OrderItemView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 06/10/2023.
//

import Foundation

import SwiftUI

struct OrderItemView: View {
    let order: Order
    var onClick: () -> Void
    
    
    var statusColor: Color {
        if order.orderStatus?.lowercased() == "process" {
            return Color.theme.green
        } else if order.orderStatus?.lowercased() == "completed" {
            return Color.theme.accent
        } else {
            return Color.theme.red
        }
    }
    
    
    var priceOrder: Double {
        var total = 0.0
        
        order.foods?.forEach({ foodOrder in
            let quantity = Double(foodOrder.quantity ?? 0)
            
            total += quantity * (foodOrder.foodsID?.price ?? 0)
        })
        return total
    }
    
    
    
    var body: some View {
        HStack(spacing: 15) {
            
            if let logo = order.foods?.first?.foodsID?.restaurant?.logo {
               FoodImageView(imageName: logo)
                    .frame(width: 60, height: 60)
                    .scaledToFit()
            }
            
          
            
            
            Spacer().frame(width: 0)
            
            VStack(alignment: .leading, spacing: 10) {
                if let restaurantName = order.foods?.first?.foodsID?.restaurant?.name {
                    
                    Text(restaurantName)
                        .font(.custom("Satoshi-Bold", size: 16))
                }
                
                
                Text(Date(dateString: order.dateCreated ?? "").asTimeString())
                    .font(.custom("Satoshi-Regular", size: 14))
                
                Text("$ \(priceOrder.asNumberString())")
                    .font(.custom("Satoshi-Bold", size: 14))
                    .foregroundColor(.theme.accent)
                
                
            }
            
            Spacer()
            
            Text(order.orderStatus ?? "")
                .font(.custom("Satoshi-Regular", size: 12))
                .foregroundColor(.white)
                .padding(.vertical,4)
                .frame(width: 80)
                .background(statusColor)
                .cornerRadius(16)
            
            
        }
        .padding(.horizontal,20)
        .padding(.vertical,10)
        .background(Color.theme.cardBackgroundColor)
        .cornerRadius(16)
        .shadow(color: Color(red: 0.05, green: 0.37, blue: 0.98).opacity(0.2), radius: 10, x: 0, y: 7)
       
        .padding(.vertical,10)
        .onTapGesture {
            onClick()
        }
        
    }
}

struct OrderItemView_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemView(order: dev.order, onClick: {
            
        })
    }
}
