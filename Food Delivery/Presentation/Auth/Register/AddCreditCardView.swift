//
//  AddCreditCardView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 13/09/2023.
//

import SwiftUI

struct AddCreditCardView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var fullname: String = ""
    @State private var cardNumber: String = ""
    @State private var expireIn: String = ""
    @State private var cvv: String = ""
    @State private var showUploadView: Bool = false
    
    
    var body: some View {
        ScrollView {
            header
            
            VStack(alignment: .leading,spacing: 20) {
                Text("Full Name")
                    .font(.custom("Satoshi-Bold", size: 18))
                
                fullNameField
                
                Spacer().frame(height: 10)
                
                Text("Card Number")
                    .font(.custom("Satoshi-Bold", size: 18))
                cardNumberField
                Spacer().frame(height: 10)
                
                scanBtn
                Spacer().frame(height: 10)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Expires")
                            .font(.custom("Satoshi-Bold", size: 18))
                        
                        expiresInField
                    }
                    Spacer().frame(width: 15)
                    VStack(alignment: .leading) {
                        Text("CVV")
                            .font(.custom("Satoshi-Bold", size: 18))
                        cvvField
                    }
                    
                    
                }
                
                
                Group {
                    Spacer().frame(height: 10)
                    HStack(spacing: 30) {
                        Image("mastercard")
                            .resizable()
                            .frame(width: 50, height: 40)
                            .scaledToFit()
                        
                        Image("visa")
                            .resizable()
                            .frame(width: 80, height: 30)
                            .scaledToFill()
                        
                        Image("paypal")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .scaledToFit()
                    }
                    
                    Spacer().frame(height: 20)
                    nextBtn
                    NavigationLink(destination: UploadPhotoView(), isActive: $showUploadView) {
                        EmptyView()
                    }
                    
                    
                }
                
                
                
                
                
                
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .navigationBarBackButtonHidden()
        
    }
}

struct AddCreditCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddCreditCardView()
        
    }
}

extension AddCreditCardView {
    
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
            
            
            Text("Add Credit Card")
                .font(.custom("Satoshi-Bold", size: 20))
            
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding()
           
    }
    
    
    var nextBtn: some View {
        Button {
            showUploadView = true
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
    
    var fullNameField: some View {
        TextField("Enter fullname", text: $fullname)
            .textContentType(.name)
            .padding(.all,20)
            .keyboardType(.default)
            .background(Color.theme.fieldBackground)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .inset(by: 0.5)
                    .stroke(Color.theme.strokeBtnColor, lineWidth: 1)
                
            }
    }
    
    var cardNumberField: some View {
        TextField("Enter card Number", text: $cardNumber)
            .textContentType(.name)
            .padding(.all,20)
            .keyboardType(.numberPad)
            .background(Color.theme.fieldBackground)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .inset(by: 0.5)
                    .stroke(Color.theme.strokeBtnColor, lineWidth: 1)
                
            }
    }
    
    var scanBtn: some View {
        Button {
            
        } label: {
            
            HStack {
                
                Image("eye_scanner")
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Spacer().frame(width: 20)
                Text("SCAN CARD")
                    .foregroundColor(.white)
                    .font(.custom("Satoshi-Bold", size: 17))
                
                
            }
            
            .padding(.horizontal, 30)
            .padding(.vertical, 20)
            .background(Color.theme.accent)
            .cornerRadius(50)
        }
    }
    
    var expiresInField: some View {
        TextField("10/27/2025", text: $expireIn)
            .textContentType(.name)
            .padding(.all,20)
            .keyboardType(.default)
            .background(Color.theme.fieldBackground)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .inset(by: 0.5)
                    .stroke(Color.theme.strokeBtnColor, lineWidth: 1)
                
            }
    }
    
    var cvvField: some View {
        SecureField("***", text: $cvv)
            .textContentType(.name)
            .padding(.all,20)
            .keyboardType(.numberPad)
            .background(Color.theme.fieldBackground)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .inset(by: 0.5)
                    .stroke(Color.theme.strokeBtnColor, lineWidth: 1)
                
            }
    }
}
