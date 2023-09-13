//
//  MethodRowView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 13/09/2023.
//

import SwiftUI

struct MethodRowView<Content: View>: View {
    let imageName: String
    let conditionForSelected: Bool
    let callable: ()->Void
    @ViewBuilder let trailingView: Content
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .scaledToFit()
            
            Spacer().frame(width: 30)
            trailingView
            
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,50)
            .background(
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 90)
                    .background(Color.theme.background)
                    .cornerRadius(16)
                    .padding()
                    .shadow(color: Color(red: 0.05, green: 0.37, blue: 0.98).opacity(0.2), radius: 10, x: 0, y: 7)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 16)
                            .inset(by: 0.5)
                            .stroke( conditionForSelected ?  Color.theme.accent : Color.clear, lineWidth: 1)
                            .padding()
                    })
                
                
            )
            .onTapGesture {
                callable()
                
            }
    }
}


struct MethodRowView_Previews: PreviewProvider {
    static var previews: some View {
        MethodRowView(imageName: "cashapp", conditionForSelected: false) {
           
        } trailingView: {
            VStack(alignment: .leading) {
                Text("Cash Payment")
                    .foregroundColor(Color.theme.label)
                    .font(.custom("Satoshi-Regular", size: 15))
                
                Text("Default Method")
                    .font(.custom("Satoshi-Regular", size: 13))
                    .foregroundColor(Color(red: 0.58, green: 0.58, blue: 0.62))
                
                
            }
        }
    }
}
