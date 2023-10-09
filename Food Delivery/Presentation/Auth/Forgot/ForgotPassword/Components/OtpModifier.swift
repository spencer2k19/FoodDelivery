//
//  OtpModifier.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 09/10/2023.
//

import SwiftUI
import Combine

struct OtpModifier: ViewModifier {
    @Binding var pin: String
    var textLimit = 1
    
    func limitText(_ upper: Int) {
        if pin.count > upper {
            self.pin = String(pin.prefix(upper))
        }
    }
    
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .onReceive(Just(pin)) { _ in
                limitText(textLimit)
            }
            .frame(width: 75, height: 60)
            .background(Color.white.cornerRadius(16))
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(red: 0.09, green: 0.12, blue: 0.13).opacity(0.1), lineWidth: 2)
            )
    }
}

struct OtpModifier_Previews: PreviewProvider {
    static var previews: some View {
        TextField("", text: .constant("2"))
            .otpForm(pin: .constant("2"))
    }
}

extension View {
    func otpForm(pin: Binding<String>) -> some View {
        modifier(OtpModifier(pin: pin))
    }
}
