//
//  ForgotPasswordView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 09/10/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var pinOne: String = ""
    @State private var pinTwo: String = ""
    @State private var pinThree: String = ""
    @State private var pinFour: String = ""
    
    var pinTwoResponder: Bool { return pinOne.count == 1 }
    var pinThreeResponder: Bool { return pinTwo.count == 1 }
    var pinFourResponder: Bool { return pinThree.count == 1 }
    
    @StateObject var viewModel = ForgotPasswordViewModel()
    @State var isFocused = false
    
    let textBoxWidth = UIScreen.main.bounds.width / 8
    let textBoxHeight = UIScreen.main.bounds.width / 8
    let spaceBetweenBoxes: CGFloat = 10
    let paddingOfBox: CGFloat = 1
    var textFieldOriginalWidth: CGFloat {
        (textBoxWidth*6)+(spaceBetweenBoxes*3)+((paddingOfBox*2)*3)
    }
    
    
    
    
    var body: some View {
        VStack {
            header
            Spacer()
            Text("Code has been send to +6282******39")
                .font(.custom("Satoshi-Bold", size: 15))
            Spacer().frame(height: 10)
            
            ZStack {
                
                HStack (spacing: spaceBetweenBoxes){
                    
                    otpText(text: viewModel.otp1)
                    otpText(text: viewModel.otp2)
                    otpText(text: viewModel.otp3)
                    otpText(text: viewModel.otp4)
                   
                }
                
                
                TextField("", text: $viewModel.otpField)
                .frame(width: isFocused ? 0 : textFieldOriginalWidth, height: textBoxHeight)
                .disabled(viewModel.isTextFieldDisabled)
                .textContentType(.oneTimeCode)
                .foregroundColor(.clear)
                .accentColor(.clear)
                .background(Color.clear)
                .keyboardType(.numberPad)
            }
            Spacer().frame(height: 10)
            Text("Resend code in 56 s")
                .font(.custom("Satoshi-Light", size: 14))
            
            Spacer()
            
            Button {
                
            } label: {
                Text("SAVE")
                    .font(.custom("Satoshi-Bold", size: 18))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.theme.accent)
                    .cornerRadius(50)
                    .padding()
                
            }
            
            
        }
        .navigationBarBackButtonHidden()
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    
    static var previews: some View {
        ForgotPasswordView()
    }
}

extension ForgotPasswordView {
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
            
            
            Text("Forgot password")
                .font(.custom("Satoshi-Bold", size: 20))
            
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding()
    }
    
    
    private func otpText(text: String) -> some View {
        
        return Text(text)
            .font(.title)
            .frame(width: textBoxWidth, height: textBoxHeight)
            .background(VStack{
              Spacer()
              RoundedRectangle(cornerRadius: 1)
                  .frame(height: 0.5)
             })
            .padding(paddingOfBox)
    }
}
