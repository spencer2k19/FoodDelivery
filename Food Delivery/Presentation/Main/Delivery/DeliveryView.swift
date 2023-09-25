//
//  DeliveryView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 17/09/2023.
//

import SwiftUI

struct DeliveryView: View {
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.colorScheme) private var colorScheme
    @State private var deliveryPlaceIndex:Int = -1
    @State private var showPaymentView: Bool = false
    
    
    var orderColor: Color {
        return colorScheme == .dark ? Color.white.opacity(0.6) : Color(red: 0.09, green: 0.12, blue: 0.13).opacity(0.6)
    }
   
    
    var body: some View {
        VStack {
            header
            
            ScrollView(showsIndicators: false) {
                DeliveryItemView(conditionForSelected: deliveryPlaceIndex == 0) {
                    deliveryPlaceIndex = 0
                }
                
                DeliveryItemView(conditionForSelected: deliveryPlaceIndex == 1) {
                    deliveryPlaceIndex = 1
                }
               
               
            }
            
          
            
            Spacer()
            
            
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
            
            
            Spacer().frame(height: 30)
            
            Button {
                showPaymentView = true
            } label: {
                Text("NEXT")
                    .font(.custom("Satoshi-Bold", size: 16))
                    .foregroundColor(.white)
                    .padding(.horizontal,50)
                    .padding(.vertical,20)
                    .background(Color.theme.accent)
                    .cornerRadius(16)
            }
            
            NavigationLink(destination: PaymentMethodView(fromLogin: false), isActive: $showPaymentView) {
                EmptyView()
            }
            
            
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
    }
}

struct DeliveryView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryView()
    }
}

extension DeliveryView {
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
            
            
            Text("Deliver to")
                .font(.custom("Satoshi-Bold", size: 20))
            
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding()
    }
}
