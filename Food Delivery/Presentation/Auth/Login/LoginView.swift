//
//  LoginView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 11/09/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var emailField: String = ""
    @State private var passwordField: String = ""
    @State private var isChecked: Bool = false
        
    var body: some View {
        ScrollView {
            
            Image("food_logo")
                .resizable()
                .frame(width: 120,height: 120)
            
            
            Text("Sign in your account")
                .font(.custom("Satoshi-Bold", size: 18))
            
            
            
            
            
            contentFields
            
            Toggle("Remember me", isOn: $isChecked)
                .padding()
                .font(.headline)
            
            Group {
                
                signInBtn
                
                
                Button {
                    
                } label: {
                    Text("Forgot password ?")
                        .font(.custom("Satoshi", size: 17))
                        .foregroundColor(Color.theme.accent)
                }
                
                Spacer().frame(height: 30)
                
                HStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 100,height: 2)
                        .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                    
                    
                    Text(" or continue with ")
                        .font(.custom("Satoshi", size: 17))
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 100,height: 2)
                        .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                }
                
                Spacer().frame(height: 20)
                
                HStack(spacing: 10) {
                    facebookBtn
                    googleBtn
                    
                    
                    
                }
                
                Spacer().frame(height: 30)
                footerContent

                
            }
            
            
            
            
        }
        
        
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView {
    private var contentFields: some View {
        VStack(alignment: .leading) {
            
            Text("Email")
                .font(.custom("Satoshi-Bold", size: 17))
            
            emailFieldView
            
            Spacer().frame(height:20)
            
            Text("Password")
                .font(.custom("Satoshi-Bold", size: 17))
            
            passwordFieldVew
            
            
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    private var emailFieldView: some View {
        TextField("Enter email", text: $emailField)
            .padding()
            .background(Color.theme.fieldBackground)
            .cornerRadius(12)
            .overlay( RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(Color(red: 0.09, green: 0.12, blue: 0.13),lineWidth: 1).opacity(0.1))
            
    }
    
    private var passwordFieldVew: some View {
        SecureField("Enter password", text: $passwordField)
            .padding()
            .background(Color.theme.fieldBackground)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .inset(by: 0.5)
                    .stroke(Color(cgColor: CGColor(red: 0.09, green: 0.12, blue: 0.13, alpha: 1)).opacity(0.1),lineWidth: 1)
            }
    }
    
    private var signInBtn: some View {
        Button {
            
        } label: {
            Text("SIGN IN")
                .foregroundColor(.white)
                .font(.custom("Satoshi-Bold", size: 17))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.theme.accent)
                .cornerRadius(12)
                .padding()
        }
    }
    
    private var facebookBtn: some View {
        Button {
            
        } label: {
            HStack {
                Image("facebook_icon")
                    .resizable()
                    .frame(width: 18, height: 18)
                
                Text("Facebook")
                    
                    .font(.custom("Satoshi-Medium", size: 17))
                
                
            }
            .padding(.horizontal,20)
            .padding()
            .background(Color.theme.background)
            .cornerRadius(16)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .inset(by: 1)
                    .stroke(Color.theme.strokeBtnColor, lineWidth: 1)
            }
            .foregroundColor(Color.theme.label)
            
            
            
        }
    }
    
    
    private var googleBtn: some View {
        Button {
            
        } label: {
            HStack {
                Image("google_icon")
                    .resizable()
                    .frame(width: 18, height: 18)
                
                Text("Google")
                    .font(.custom("Satoshi-Medium", size: 17))
                    .fontWeight(.semibold)
                
                
            }
            .padding(.horizontal,20)
            .padding()
            .cornerRadius(16)
            .foregroundColor(Color.theme.label)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.theme.strokeBtnColor,lineWidth: 1)
            }
            
            
        }
    }
    
    private var footerContent: some View {
        HStack {
            Text("Don't have an account ?")
                .font(.custom("Satoshi-Regular", size: 16))
            
            
//            Button {
//                showRegisterView = true
//            } label: {
//                Text("Sign up")
//                    .font(.custom("Satoshi-Regular", size: 17))
//                    .foregroundColor(Color.theme.accent)
//            }

            
            NavigationLink(destination: RegisterView()) {
                Text("Sign up")
                    .font(.custom("Satoshi-Regular", size: 17))
            }
            .foregroundColor(Color.theme.accent)
            
        }
    }
}
