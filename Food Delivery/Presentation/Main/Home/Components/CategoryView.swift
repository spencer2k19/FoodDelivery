//
//  CategoryView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 14/09/2023.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        Rectangle()
        .foregroundColor(.clear)
        .frame(width: 100, height: 150)
        .background(Color.theme.cardBackgroundColor)
        .cornerRadius(69)
        .shadow(color: Color(red: 0.12, green: 0.12, blue: 0.12).opacity(0.08), radius: 8, x: 0, y: 4)
       
        .overlay(VStack(spacing: 10,content: {
            
            Image("dessert")
                .resizable()
                .frame(width: 100, height: 90)
                .clipShape(Circle())
            
            Text("Vegetarian")
                .font(.custom("Satoshi-Medium", size: 14))
            Spacer().frame(height: 10)
            
        }).padding()
        
        )
       
            
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
            .previewLayout(.sizeThatFits)
    }
}
