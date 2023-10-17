//
//  ErrorViewModifier.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 17/10/2023.
//

import Foundation
import SwiftUI

struct ErrorViewModifier: ViewModifier {
    
    @Binding var errorWrapper: ErrorWrapper?
    
    init(errorWrapper: Binding<ErrorWrapper?>) {
        self._errorWrapper = errorWrapper
    }
    
    func body(content: Content) -> some View {
        content
            .alert(item: $errorWrapper, content: { errorWrapper  in
                if let error = errorWrapper.error as? APIError {
                    return Alert(title: Text("Oops..."),
                                 message: Text(error.localizedDescription),
                                 dismissButton: .default(Text("OK")))
                }  else {
                    return Alert(title: Text("Oops..."),
                                 message: Text("Something went wrong"),
                                 dismissButton: .default(Text("OK")))
                }
                
            })
    }
}


