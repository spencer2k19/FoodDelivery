//
//  OrderDetailItemView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 16/09/2023.
//

import SwiftUI

struct OrderDetailItemView: View {
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
                     Rectangle()
                         .frame(width: 60, height: 60)
                         .foregroundColor(.clear)
                         .background(Color.theme.cardBackgroundColor)
                         .cornerRadius(8)
                         .shadow(color: Color(red: 0.12, green: 0.12, blue: 0.12).opacity(0.16), radius: 3.5, x: 0, y: 2)
                     
                            
                         .overlay(
                             Image("pizza")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .scaledToFill()
                         )
                     
                     VStack(alignment: .leading, spacing: 10) {
                         Text("Pizza pepperoni")
                             .font(.custom("Satoshi-Bold", size: 16))
                         
                         
                         Text("$ 8.98")
                             .font(.custom("Satoshi-Bold", size: 12))
                             .foregroundColor(.theme.accent)
                         
                     }
                     
                 })
                 .frame(maxWidth: .infinity,alignment: .leading)
                 .padding(.horizontal)
             )
             .padding(.vertical,5)
             .padding(.horizontal,10)
    }
}

struct OrderDetailItemView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailItemView()
    }
}
