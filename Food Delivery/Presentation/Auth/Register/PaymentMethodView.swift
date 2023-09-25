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
    @State private var showCreditCardView: Bool = false
    
    
    let fromLogin: Bool
    
    
    
    var body: some View {
        ScrollView {
            header
            Text("A payment method is a way to transfer money or complete a financial transaction")
                .font(.custom("Satoshi-Regular", size: 18))
                .padding()
            
            Spacer().frame(height: 60)
            
            paypalMethod
            Spacer().frame(height: 90)
            mastercardMethod
            Spacer().frame(height: 70)
            addCardButton
            
            Group {
                Text("Other methods")
                    .font(.custom("Satoshi-Bold", size: 18))
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                Spacer().frame(height: 40)
                cashappMethod
                Spacer().frame(height: 40)
                nextBtn
                NavigationLink(destination: AddCreditCardView(), isActive: $showCreditCardView) {
                    EmptyView()
                }
                
            }
        }
        
        .navigationBarBackButtonHidden()
        
    }
}

struct PaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodView(fromLogin: true)
    }
}

extension PaymentMethodView {
    
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
            
            
            Text("Payment Method")
                .font(.custom("Satoshi-Bold", size: 20))
            
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding()
    }
    
    var paypalMethod: some View {
        MethodRowView(imageName: "paypal", conditionForSelected: methodPaymentChoice == 0) {
            methodPaymentChoice = 0
        } trailingView: {
            Text("Example@example.com")
                .foregroundColor(Color.theme.label)
                .font(.custom("Satoshi-Regular", size: 17))
        }
    }
    
    var mastercardMethod: some View {
        MethodRowView(imageName: "mastercard", conditionForSelected: methodPaymentChoice == 1) {
            methodPaymentChoice = 1
        } trailingView: {
            VStack(alignment: .leading) {
                Text("****  ****  **** 5928")
                    .foregroundColor(Color.theme.label)
                    .font(.custom("Satoshi-Regular", size: 15))
                
                Text("Express 03/27")
                    .font(.custom("Satoshi-Regular", size: 13))
                    .foregroundColor(Color(red: 0.58, green: 0.58, blue: 0.62))
                
                
            }
        }
    }
    
    
    var addCardButton: some View {
        Button {
            
        } label: {
            Text("ADD CART +")
                .font(.custom("Satoshi-Bold", size: 17))
                .padding(.vertical,20)
                .frame(maxWidth: .infinity)
                .background(Color.theme.legerBlue)
                .cornerRadius(50)
                .padding()
        }
    }
    
    var cashappMethod: some View {
        MethodRowView(imageName: "cashapp", conditionForSelected: methodPaymentChoice == 2) {
            methodPaymentChoice = 2
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
    
    var nextBtn: some View {
        Button {
            if fromLogin {
                showCreditCardView = true
            }
        } label: {
            Text("NEXT")
                .font(.custom("Satoshi-Bold", size: 17))
                .foregroundColor(.white)
                .padding(.vertical,20)
                .frame(maxWidth: .infinity)
                .background(Color.theme.accent)
                .cornerRadius(50)
                .padding()
        }
    }
    
    
}



