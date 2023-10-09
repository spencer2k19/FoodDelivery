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
    
    
    var statusColor: Color {
        if order.status.lowercased() == "proccess" {
            return Color.theme.green
        } else if order.status.lowercased() == "completed" {
            return Color.theme.accent
        } else {
            return Color.theme.red
        }
    }
    
    var body: some View {
        HStack(spacing: 15) {
            Image(order.restaurantLogo)
                .resizable()
                .frame(width: 60, height: 60)
                .scaledToFit()
            
            
            Spacer().frame(width: 0)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(order.restaurantName)
                    .font(.custom("Satoshi-Bold", size: 16))
                
                Text("21:30")
                    .font(.custom("Satoshi-Regular", size: 14))
                
                Text("$ 45.50")
                    .font(.custom("Satoshi-Bold", size: 14))
                    .foregroundColor(.theme.accent)
                
                
            }
            
            Spacer()
            
            Text(order.status)
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
        
    }
}

struct OrderItemView_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemView(order: dev.order)
    }
}
