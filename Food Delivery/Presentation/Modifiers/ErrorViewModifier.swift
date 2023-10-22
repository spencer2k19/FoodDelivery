//
//  ErrorViewModifier.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 17/10/2023.
//

import Foundation
import SwiftUI
import NavigationBackport

struct ErrorViewModifier: ViewModifier {
    
    @Binding var errorWrapper: ErrorWrapper?
    @EnvironmentObject private var navigator: PathNavigator
    
    init(errorWrapper: Binding<ErrorWrapper?>) {
        self._errorWrapper = errorWrapper
    }
    
    func body(content: Content) -> some View {
       content
                .alert(item: $errorWrapper, content: { errorWrapper  in
                    if let error = errorWrapper.error as? APIError {
                        if case .tokenExpired(_) = error {
                            return Alert(title: Text("Oops..."),
                                         message: Text("Your session has expired"),
                                         dismissButton: .default(Text("OK"),action: {
                                
                                AuthService.instance.logout()
                                navigator.popToRoot()
                            }))
                        } else {
                            return Alert(title: Text("Oops..."),
                                         message: Text(error.localizedDescription),
                                         dismissButton: .default(Text("OK")))
                        }
                        
                        
                        
                       
                    }  else {
                        return Alert(title: Text("Oops..."),
                                     message: Text("Something went wrong"),
                                     dismissButton: .default(Text("OK")))
                    }
                    
                })
        
        
        
        
       
    }
}


