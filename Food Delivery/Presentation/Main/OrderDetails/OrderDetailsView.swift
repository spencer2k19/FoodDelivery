//
//  OrderDetailsView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 16/09/2023.
//

import SwiftUI
import NavigationBackport

struct OrderDetailsView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var searchField: String = ""
    @EnvironmentObject private var navigator: PathNavigator
    
    var orderColor: Color {
        return colorScheme == .dark ? Color.white.opacity(0.6) : Color(red: 0.09, green: 0.12, blue: 0.13).opacity(0.6)
    }
    
    
    
    
    var body: some View {
        ScrollView {
            header
            TextField("Search...", text: $searchField)
                .frame(maxWidth: .infinity)
                .padding(.leading,50)
                .padding(.vertical)
                .background(Color.theme.fieldBackground)
                .cornerRadius(50)
                .overlay(
                    Image("search")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.theme.label)
                        .frame(width: 22, height: 22).padding(),
                    
                    alignment: .leading
                    
                )
                .overlay(
                    Image("filter")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.theme.label)
                        .frame(width: 22, height: 22).padding(),
                    alignment: .trailing)
            
            Spacer().frame(height: 30)
            
            OrderDetailItemView()
            OrderDetailItemView()
            OrderDetailItemView()
            
            Spacer().frame(height: 30)
            
            VStack {
                HStack {
                    Text("Basket total")
                        .font(.custom("Satoshi-Medium", size: 15))
                        .foregroundColor(orderColor)
                    Spacer()
                    Text("+ USD 44.88")
                        .font(.custom("Satoshi-Medium", size: 15))
                    
                    
                }
                
                Divider()
                
                HStack {
                    Text("Discount")
                        .font(.custom("Satoshi-Medium", size: 15))
                        .foregroundColor(orderColor)
                    Spacer()
                    Text("- USD 1.20")
                        .font(.custom("Satoshi-Medium", size: 15))
                        .foregroundColor(.theme.accent)
                    
                    
                }
                
                Divider()
                HStack {
                    Text("Total")
                        .font(.custom("Satoshi-Medium", size: 15))
                        .foregroundColor(orderColor)
                    Spacer()
                    Text("USD 43.68")
                        .font(.custom("Satoshi-Bold", size: 15))
                    
                    
                }
                
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.all,20)
            .background(
                Color.theme.fieldBackground
            )
            
            .cornerRadius(12)
            
            Group {
                Spacer().frame(height: 30)
                
                Button {
                    navigator.push(Destination.deliverAddress)
                } label: {
                    Text("Place my order")
                        .font(.custom("Satoshi-Bold", size: 16))
                        .foregroundColor(.white)
                        .padding(.horizontal,50)
                        .padding(.vertical,20)
                        .background(Color.theme.accent)
                        .cornerRadius(16)
                }
                
               
            }
       
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
    }
}

struct OrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailsView()
    }
}

extension OrderDetailsView {
    
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
                    navigator.pop()
                }
            Spacer().frame(width: 40)
            
            
            Text("Order Details")
                .font(.custom("Satoshi-Bold", size: 20))
            
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding()
    }
}
