//
//  IntroView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 17/10/2023.
//

import SwiftUI
import NavigationBackport

struct IntroView: View {
    @StateObject private var vm = IntroViewModel()
    @EnvironmentObject private var navigator: PathNavigator

    
    
    var body: some View {
        
        ZStack {
            Image("splash_background")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .scaledToFill()
                .ignoresSafeArea()
            
            
            Image("food_logo")
                .resizable()
                .frame(width: 120, height: 120)
        }.onAppear {
            Task {
                try await vm.startup()
                if vm.isUserLogged() {
                    navigator.push(Destination.home)
                } else {
                    navigator.push(Destination.start)
                }
            }
        }
     
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
