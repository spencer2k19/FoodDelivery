//
//  ResendPasswordView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 10/10/2023.
//

import SwiftUI
import NavigationBackport

struct ResendPasswordView: View {
    @EnvironmentObject private var navigator: PathNavigator
    @State private var password:String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            header
            Spacer().frame(height: 30)
            Text("Password")
                .font(.custom("Satoshi-Bold", size: 15))
            
            passwordFieldView
            
            Spacer().frame(height: 30)
            
            Text("Confirm password")
                .font(.custom("Satoshi-Bold", size: 15))
            
            passwordFieldView
            Spacer()
            saveBtn
            
        }
        .padding()
        .navigationBarBackButtonHidden()
        
        
    }
}

struct ResendPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResendPasswordView()
    }
}

extension ResendPasswordView {
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
            
            
            Text("Resent password")
                .font(.custom("Satoshi-Bold", size: 20))
            
            
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            
        
    }
    
    
    private var passwordFieldView: some View {
        TextField("Enter password", text: $password)
            .padding()
            .background(Color.theme.fieldBackground)
            .cornerRadius(12)
            .overlay( RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(Color(red: 0.09, green: 0.12, blue: 0.13),lineWidth: 1).opacity(0.1))
        
    }
    
    private var confirmPasswordFieldView: some View {
        TextField("Confirm password", text: $confirmPassword)
            .padding()
            .background(Color.theme.fieldBackground)
            .cornerRadius(12)
            .overlay( RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(Color(red: 0.09, green: 0.12, blue: 0.13),lineWidth: 1).opacity(0.1))
        
    }
    
    private var saveBtn: some View {
        Button {
            navigator.push(Destination.congratsForgotPassword)
        } label: {
            Text("SAVE")
                .foregroundColor(.white)
                .font(.custom("Satoshi-Bold", size: 17))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.theme.accent)
                .cornerRadius(50)
                .padding()
        }
    }
}
