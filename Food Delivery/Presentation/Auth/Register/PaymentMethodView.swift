//
//  PaymentMethodView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 12/09/2023.
//

import SwiftUI

struct PaymentMethodView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var methodPaymentChoice:Int = 0
    
    
    var body: some View {
        ScrollView {
            
            HStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 52, height: 52)
                
                    .background(Color.theme.background)
                    .cornerRadius(16)
                    .shadow(color: Color(red: 0.05, green: 0.37, blue: 0.98).opacity(0.2), radius: 10, x: 0, y: 7)
                    .overlay(
                        Image(systemName: "chevron.left")
                        
                    )
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Spacer().frame(width: 40)
                
                
                Text("Payment Method")
                    .font(.custom("Satoshi-Bold", size: 20))
                
                
            }.frame(maxWidth: .infinity,alignment: .leading)
                .padding()
            
            
            Text("A payment method is a way to transfer money or complete a financial transaction")
                .font(.custom("Satoshi-Regular", size: 18))
                .padding()
            
            Spacer().frame(height: 60)
            
            
            HStack {
                Image("paypal")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .scaledToFit()
                
                Spacer().frame(width: 30)
                
                Text("Example@example.com")
                    .foregroundColor(Color.theme.label)
                    .font(.custom("Satoshi-Regular", size: 17))
                
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
                            .stroke( methodPaymentChoice == 0 ?  Color.theme.accent : Color.clear, lineWidth: 1)
                            .padding()
                        })
                       
                    
                )
                .onTapGesture {
                    methodPaymentChoice = 0
                }
                
            Spacer().frame(height: 90)
            
            HStack {
                Image("mastercard")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFit()
                
                Spacer().frame(width: 30)
                
                VStack(alignment: .leading) {
                    Text("****  ****  **** 5928")
                        .foregroundColor(Color.theme.label)
                        .font(.custom("Satoshi-Regular", size: 15))
                    
                    Text("Express 03/27")
                        .font(.custom("Satoshi-Regular", size: 13))
                        .foregroundColor(Color(red: 0.58, green: 0.58, blue: 0.62))
                    
                    
                }
                
                
                
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
                            .stroke(methodPaymentChoice == 1 ?  Color.theme.accent : Color.clear, lineWidth: 1)
                            .padding()
                        })
                       
                    
                ).onTapGesture {
                    methodPaymentChoice = 1
                }
            
            
            
            
            
        }
       
        .navigationBarBackButtonHidden()
    }
}

struct PaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodView()
    }
}
