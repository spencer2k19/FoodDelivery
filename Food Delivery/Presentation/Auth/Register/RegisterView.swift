//
//  RegisterView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 11/09/2023.
//

import SwiftUI

struct RegisterView: View {
    @State private var emailField: String = ""
    @State private var passwordField: String = ""
    @State private var confirmPasswordField: String = ""
    
    
    
    var body: some View {
        ScrollView {
            Image("food_logo")
                .resizable()
                .frame(width: 120, height: 120)
            
            Text("Sign up your account")
                .font(.system(size: 18))
                .foregroundColor(Color(red: 0.09, green: 0.12, blue: 0.13))
                .fontWeight(.semibold)
            
            VStack(alignment: .leading) {
                Text("Email")
                    .font(.system(size: 18))
                    .foregroundColor(Color(red: 0.09, green: 0.12, blue: 0.13))
                    .fontWeight(.semibold)
                
                TextField("Enter email", text: $emailField)
                    .padding()
                    .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                    .cornerRadius(12)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.09, green: 0.12, blue: 0.13).opacity(0.1), lineWidth: 1)

                    }
                
                Spacer().frame(height: 20)
                
                
                Text("Password")
                    .font(.system(size: 18))
                    .foregroundColor(Color(red: 0.09, green: 0.12, blue: 0.13))
                    .fontWeight(.semibold)
                
                SecureField("Enter password", text: $passwordField)
                    .padding()
                    .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                    .cornerRadius(12)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.09, green: 0.12, blue: 0.13).opacity(0.1), lineWidth: 1)

                    }
                
                
                Spacer().frame(height: 20)
                
                
                Text("Repeat password")
                    .font(.system(size: 18))
                    .foregroundColor(Color(red: 0.09, green: 0.12, blue: 0.13))
                    .fontWeight(.semibold)
                
                SecureField("Confirm", text: $confirmPasswordField)
                    .padding()
                    .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                    .cornerRadius(12)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.09, green: 0.12, blue: 0.13).opacity(0.1), lineWidth: 1)

                    }
                
                
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding()
            
            Button {
                
            } label: {
                Text("NEXT")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(50)
                    .padding()
                
            }
            
            Spacer().frame(height: 20)
            
            HStack {
                Button {
                    
                } label: {
                    HStack {
                        Image("facebook_icon")
                            .resizable()
                            .frame(width: 18,height: 18)
                            .scaledToFit()
                        Text("Facebook")
                            .font(.system(size: 18))
                            .foregroundColor(Color.black)
                            .fontWeight(.semibold)
                           
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(red: 0.09, green: 0.12, blue: 0.13).opacity(0.1),lineWidth: 1)
                    }
                }
                
                Spacer().frame(width: 20)
                
                Button {
                    
                } label: {
                    HStack {
                        Image("google_icon")
                            .resizable()
                            .frame(width: 18,height: 18)
                            .scaledToFit()
                        Text("Google")
                            .font(.system(size: 18))
                            .foregroundColor(Color.black)
                            .fontWeight(.semibold)
                           
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(red: 0.09, green: 0.12, blue: 0.13).opacity(0.1),lineWidth: 1)
                    }
                }

            }
            .frame(maxWidth: .infinity)
            
            Spacer().frame(height: 20)
            
            HStack {
                Text("Already have an account ?")
                Button("Sign in") {
                    
                }
            }
            
            
            

            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
