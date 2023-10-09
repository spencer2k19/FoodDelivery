//
//  OrdersView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 06/10/2023.
//

import SwiftUI

struct OrdersView: View {
    @State private var search: String = ""
    @StateObject private var vm = OrdersViewModel()
    
    
    var body: some View {
        VStack {
            HStack(spacing: 30) {
                Image("food_logo")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                Text("Order History")
                    .font(.custom("Satoshi-Bold", size: 20))
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
            
            
            TextField("Search...", text: $search)
                .frame(height: 54)
                .padding(.leading,60)
                .background(Color.theme.fieldBackground)
                .cornerRadius(50)
                .overlay (
                    Image("search")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.theme.label)
                        .frame(width: 20, height: 20)
                        .padding(.leading,20)
                    , alignment: .leading)
                .overlay (
                    Image("filter")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.theme.label)
                        .frame(width: 20, height: 20)
                        .padding(.trailing,20)
                    , alignment: .trailing)
            
            Spacer().frame(height: 20)
            
            if vm.isBusy {
                ProgressView()
                
            } else {
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(vm.orders) { order in
                            OrderItemView(order: order)
                        }
                    }
                    .padding(.horizontal,5)
                }
            }
            
            
           
        }
        .frame(maxHeight: .infinity,alignment: .top)
        .padding()
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
