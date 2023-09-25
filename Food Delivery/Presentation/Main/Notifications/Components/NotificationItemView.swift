//
//  NotificationItemView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 16/09/2023.
//

import SwiftUI

struct NotificationItemView: View {
    let callable: () -> Void
    
    
    var body: some View {
       Rectangle()
            .foregroundColor(.clear)
            .padding()
            .frame(height: 90)
            .background(Color.theme.cardBackgroundColor)
            .cornerRadius(20)
            .shadow(color: Color(red: 0.05, green: 0.37, blue: 0.98).opacity(0.2), radius: 10, x: 0, y: 7)
            .overlay(
                HStack(spacing: 20,content: {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.theme.accent)
                        .overlay(
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                        )
                    
                    VStack(alignment: .leading) {
                        Text("Your order is completed!")
                            .font(.custom("Satoshi-Bold", size: 16))
                        
                        
                        Text("20:00")
                            .font(.custom("Satoshi-Regular", size: 12))
                    }
                    
                })
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)
            )
            .padding(.vertical)
            .padding(.horizontal,10)
            .onTapGesture {
                callable()
            }
    }
}

struct NotificationItemView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationItemView {
            
        }
    }
}
