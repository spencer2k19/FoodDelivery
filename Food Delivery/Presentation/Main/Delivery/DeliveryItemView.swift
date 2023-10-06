//
//  DeliveryItemView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 17/09/2023.
//

import SwiftUI

struct DeliveryItemView: View {
    let conditionForSelected: Bool
    let callable: ()->Void
    
    
    var body: some View {
        Rectangle()
             .foregroundColor(.clear)
             .padding()
             .frame(height: 100)
             .background(Color.theme.cardBackgroundColor)
             .cornerRadius(20)
             .shadow(color: Color(red: 0.05, green: 0.37, blue: 0.98).opacity(0.2), radius: 10, x: 0, y: 7)
             .overlay(
                 HStack(spacing: 20,content: {
                     Circle()
                         .frame(width: 70, height: 70)
                         .foregroundColor(.theme.legerBlue)
                         .shadow(color: Color(red: 0.12, green: 0.12, blue: 0.12).opacity(0.16), radius: 3.5, x: 0, y: 2)
                     
                            
                         .overlay(
                             Image("location")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .scaledToFill()
                         )
                     
                     Spacer().frame(width: 2)
                     VStack(alignment: .leading, spacing: 10) {
                         Text("Home")
                             .font(.custom("Satoshi-Regular", size: 14))
                         
                         
                         Text("Artur Liste St.109")
                             .font(.custom("Satoshi-Bold", size: 16))
                         
                     }
                     
                 })
                 
                 .frame(maxWidth: .infinity,alignment: .leading)
                 
                 .padding(.horizontal)
                 
             )
             .padding(.vertical,5)
             .padding(.horizontal,10)
             .overlay(
                 RoundedRectangle(cornerRadius: 16)
                     .inset(by: 0.5)
                     .stroke( conditionForSelected ?  Color.theme.accent : Color.clear, lineWidth: 1)
                     .padding(.vertical,5)
                     .padding(.horizontal,10)
             )
             .onTapGesture {
                 callable()
                 
             }
    }
}

struct DeliveryItemView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryItemView(conditionForSelected: true, callable: {
            
        })
    }
}
