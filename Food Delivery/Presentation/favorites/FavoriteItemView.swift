//
//  FavoriteItemView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 25/09/2023.
//

import SwiftUI

struct FavoriteItemView: View {
    let favorite: Food
    
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
                     
                     FoodImageView(imageName: favorite.image ?? "")
                         .frame(width: 60,height: 60)
                         .scaledToFill()
                     
//                     Rectangle()
//                         .frame(width: 60, height: 60)
//                         .foregroundColor(.clear)
//                         .background(Color.theme.cardBackgroundColor)
//                         .cornerRadius(8)
//                         .shadow(color: Color(red: 0.12, green: 0.12, blue: 0.12).opacity(0.16), radius: 3.5, x: 0, y: 2)
//
//
//                         .overlay(
//                             Image("pizza")
//                                .resizable()
//                                .frame(width: 50, height: 50)
//                                .scaledToFill()
//                         )
                     
                     VStack(alignment: .leading, spacing: 10) {
                         Text(favorite.name ?? "")
                             .font(.custom("Satoshi-Bold", size: 16))
                         
                         
                         Text("$ \(favorite.price?.asNumberString() ?? "")")
                             .font(.custom("Satoshi-Bold", size: 12))
                             .foregroundColor(.theme.accent)
                         
                     }
                     Spacer()
                     
                     Image("blue_heart")
                         .renderingMode(.template)
                         .resizable()
                         .foregroundColor(.theme.accent)
                        
                         .frame(width: 24, height: 24)
                     
                 })
                 .frame(maxWidth: .infinity,alignment: .leading)
                 .padding(.horizontal)
             )
             .padding(.vertical,5)
             .padding(.horizontal,10)
    }
}

struct FavoriteItemView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteItemView(favorite: dev.favorite)
    }
}
