//
//  LoginView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 11/09/2023.
//

import SwiftUI
import NavigationBackport

struct LoginView: View {
    
    @State private var isChecked: Bool = false
    var service = AuthService.instance
    

    
    
    @EnvironmentObject var navigator: PathNavigator
    @StateObject private var vm = LoginViewModel()
    
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
                
                NBNavigationLink(value: Destination.forgotPassword) {
                    Text("Forgot password ?")
                        .font(.custom("Satoshi-Regular", size: 17))
                        .foregroundColor(Color.theme.accent)
                }
                
                
                
                Spacer().frame(height: 30)
                HStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 100,height: 2)
                        .background(Color(red: 0.929, green: 0.93, blue: 0.93))
                    
                    
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
        .navigationBarBackButtonHidden()
        .onError($vm.errorWrapper)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(NavRouteModel())
    }
}

extension LoginView {
    private var contentFields: some View {
        VStack(alignment: .leading) {
            
            Text("Email")
                .font(.custom("Satoshi-Bold", size: 17))
            
            emailFieldView
            
            if !vm.errorMsgForEmail.isEmpty {
                Text(vm.errorMsgForEmail)
                    .font(.custom("Satoshi-Regular", size: 15))
                    .foregroundColor(.theme.red)
            }
            Spacer().frame(height:20)
            
            Text("Password")
                .font(.custom("Satoshi-Bold", size: 17))
            
           
            
            passwordFieldVew
            if !vm.errorMsgForPassword.isEmpty {
                Text(vm.errorMsgForPassword)
                    .font(.custom("Satoshi-Regular", size: 15))
                    .foregroundColor(.theme.red)
            }
            
            
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    
    private func login() {
        Task {
            try? await vm.login(onSuccess: {
                navigator.push(Destination.home)
                
            })
           
        }
    }
    
    private var emailFieldView: some View {
        TextField("Enter email", text: $vm.email)
            .padding()
            .background(Color.theme.fieldBackground)
            .cornerRadius(12)
            .overlay( RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke( !vm.errorMsgForEmail.isEmpty ? Color.theme.red :  Color(red: 0.09, green: 0.12, blue: 0.13).opacity(0.1),lineWidth: 1))
        
    }
    
    private var passwordFieldVew: some View {
        SecureField("Enter password", text: $vm.password)
            .padding()
            .background(Color.theme.fieldBackground)
            .cornerRadius(12)
            .overlay (
                RoundedRectangle(cornerRadius: 12)
                    .inset(by: 0.5)
                    .stroke(!vm.errorMsgForPassword.isEmpty ? Color.theme.red :  Color(red: 0.09, green: 0.12, blue: 0.13).opacity(0.1),lineWidth: 1)
            )
    }
    
    private var signInBtn: some View {
        Button {
            //hide keyboard
           
                UIApplication.shared.endEditing()
                login()
            
            
        } label: {
            if vm.isBusy {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.accent)
                    .cornerRadius(12)
                    .padding()
                
            } else {
                Text("SIGN IN")
                    .foregroundColor(.white)
                    .font(.custom("Satoshi-Bold", size: 17))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.accent)
                    .cornerRadius(12)
                    .padding()
                    
            }
            
            
        }.disabled(vm.isBusy)
       
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
            .overlay (
                RoundedRectangle(cornerRadius: 16)
                    .inset(by: 1)
                    .stroke(Color.theme.strokeBtnColor, lineWidth: 1)
            )
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
            .overlay (
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.theme.strokeBtnColor,lineWidth: 1)
            )
        }
    }
    
    private var footerContent: some View {
        HStack {
            Text("Don't have an account ?")
                .font(.custom("Satoshi-Regular", size: 16))
            
            Button {
                navigator.push(Destination.register)
            } label: {
                Text("Sign up")
                    .font(.custom("Satoshi-Regular", size: 17))
                    .foregroundColor(Color.theme.accent)
            }
            
            
            
            
            
        }
    }
}
