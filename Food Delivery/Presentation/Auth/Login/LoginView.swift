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
                .font(.title3)
                .fontWeight(.bold)
            
            
            contentFields
            
            Toggle("Remember me", isOn: $isChecked)
                .padding()
                .font(.headline)
            
            Group {
                
                signInBtn
                
                
                Button("Forgot password") {
                    
                }
                Spacer().frame(height: 30)
                
                HStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 100,height: 2)
                        .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                    
                    
                    Text(" or continue with ")
                    
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
                .font(.system(size: 17))
                .fontWeight(.semibold)
            
            
            emailFieldView
            
            Spacer().frame(height:20)
            
            Text("Password")
                .font(.system(size: 18))
                .fontWeight(.semibold)
            
            passwordFieldVew
            
            
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    private var emailFieldView: some View {
        TextField("Enter email", text: $emailField)
            .padding()
            .background(Color(cgColor: CGColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)))
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .inset(by: 0.5)
                    .stroke(Color(cgColor: CGColor(red: 0.09, green: 0.12, blue: 0.13, alpha: 1)).opacity(0.1),lineWidth: 1)
            }
    }
    
    private var passwordFieldVew: some View {
        SecureField("Enter password", text: $passwordField)
            .padding()
            .background(Color(cgColor: CGColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)))
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
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
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
                    .foregroundColor(Color(red: 0.09, green: 0.12, blue: 0.13))
                    .fontWeight(.semibold)
                
                
            }
            .padding(.horizontal,20)
            .padding()
            .cornerRadius(16)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(cgColor: CGColor(red: 0.09, green: 0.12, blue: 0.13, alpha: 1)).opacity(0.1),lineWidth: 1)
            }
            
            
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
                    .foregroundColor(Color(red: 0.09, green: 0.12, blue: 0.13))
                    .fontWeight(.semibold)
                
                
            }
            .padding(.horizontal,20)
            .padding()
            .cornerRadius(16)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(cgColor: CGColor(red: 0.09, green: 0.12, blue: 0.13, alpha: 1)).opacity(0.1),lineWidth: 1)
            }
            
            
        }
    }
    
    private var footerContent: some View {
        HStack {
            Text("Don't have an account ?")
                .font(.body)
            
            NavigationLink(destination: RegisterView()) {
                Text("Sign up")
            }
            
        }
    }
}
