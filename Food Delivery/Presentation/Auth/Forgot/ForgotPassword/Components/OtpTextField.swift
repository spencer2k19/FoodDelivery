//
//  OtpTextField.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 09/10/2023.
//

import SwiftUI

struct OtpTextField: UIViewRepresentable {
    @Binding var text: String
    var nextResponder: Bool?
    
    
    func makeUIView(context: Context) ->  UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.textContentType = .oneTimeCode
        return textField
    }
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: OtpTextField
        
        init(_ parent: OtpTextField) {
            self.parent = parent
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
            let value = parent.text
            if let next = parent.nextResponder {
                if parent.text.count == 1 && next {
                    textField.resignFirstResponder()
                }
            }
        }
        
        
    }
    
    
}

struct OtpTextField_Previews: PreviewProvider {
    static var previews: some View {
        OtpTextField(text: .constant("2"))
    }
}
