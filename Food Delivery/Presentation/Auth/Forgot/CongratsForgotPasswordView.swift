//
//  CongratsForgotPasswordView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 10/10/2023.
//

import SwiftUI
import NavigationBackport

struct CongratsForgotPasswordView: View {
    @EnvironmentObject private var navigator: PathNavigator
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("splash_background")
                    .resizable()
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .scaledToFit()
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 20) {
                Circle()
                    .fill(Color.theme.accent)
                    .frame(width: 120, height: 120)
                    .overlay(
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    )
                Text("Congrats")
                    .font(.custom("Satoshi-Bold", size: 27))
                    .foregroundColor(.theme.accent)
                
                Text("Password reset successful")
                    .font(.custom("Satoshi-Regular", size: 18))
               
            }
            
              Button {
                    navigator.popTo(Destination.login)
                } label: {
                    Text("NEXT")
                        .foregroundColor(.white)
                        .font(.custom("Satoshi-Bold", size: 17))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.theme.accent)
                        .cornerRadius(50)
                        .padding()
                }
            
            .frame(maxHeight: .infinity,alignment: .bottom)
        }.navigationBarBackButtonHidden()
    }
}

struct CongratsForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CongratsForgotPasswordView()
    }
}
