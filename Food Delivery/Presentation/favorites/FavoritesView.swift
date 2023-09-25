//
//  FavoritesView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 25/09/2023.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var search: String = ""
    var body: some View {
        VStack {
            header
            
            TextField("Search...", text: $search)
                .frame(height: 54)
                .padding(.leading,60)
                .background(Color.theme.fieldBackground)
                .cornerRadius(50)
                .overlay(alignment: .leading) {
                    Image("search")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.theme.label)
                        .frame(width: 20, height: 20)
                        .padding(.leading,20)
                }
                
                .padding(.horizontal,20)
            
            
            Spacer().frame(height: 20)
            ScrollView {
                VStack(spacing: 20) {
                   FavoriteItemView()
                   FavoriteItemView()
                   FavoriteItemView()
                   FavoriteItemView()
                }
                .padding(.horizontal)
            }
            
        } .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}


extension FavoritesView {
    var header: some View {
        HStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 52, height: 52)
            
                .background(Color.theme.cardBackgroundColor)
                .cornerRadius(16)
                .shadow(color: Color(red: 0.05, green: 0.37, blue: 0.98).opacity(0.2), radius: 10, x: 0, y: 7)
                .overlay(
                    Image(systemName: "chevron.left")
                    
                )
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            Spacer().frame(width: 40)
            
            
            Text("Favorites")
                .font(.custom("Satoshi-Bold", size: 20))
            
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding()
            .navigationBarBackButtonHidden()
    }
}
