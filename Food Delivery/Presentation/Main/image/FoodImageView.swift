//
//  FoodImageView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 19/10/2023.
//

import SwiftUI

struct FoodImageView: View {
    @StateObject private var vm:FoodImageViewModel
    
    
    init(imageName: String) {
        _vm = StateObject(wrappedValue: FoodImageViewModel(imageName: imageName))
    }
    
    
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                
            } else if vm.isBusy {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .resizable()
                    .foregroundColor(.black)
            }
        }
    }
}

struct FoodImageView_Previews: PreviewProvider {
    static var previews: some View {
        FoodImageView(imageName: "c036980b-67ec-43be-a3ec-2c78affa6ea3")
    }
}
