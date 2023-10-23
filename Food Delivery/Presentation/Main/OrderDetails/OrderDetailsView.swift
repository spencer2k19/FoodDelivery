//
//  OrderDetailsView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 16/09/2023.
//

import SwiftUI
import NavigationBackport

struct OrderDetailsView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var searchField: String = ""
    @EnvironmentObject private var navigator: PathNavigator
    let order: Order
    
    
    
    var orderColor: Color {
        return colorScheme == .dark ? Color.white.opacity(0.6) : Color(red: 0.09, green: 0.12, blue: 0.13).opacity(0.6)
    }
    
    var statusColor: Color {
        if order.orderStatus?.lowercased() == "process" {
            return Color.theme.green
        } else if order.orderStatus?.lowercased() == "completed" {
            return Color.theme.accent
        } else {
            return Color.theme.red
        }
    }
    
    var priceTotalOrder: Double {
        var total = 0.0
        
        order.foods?.forEach({ foodOrder in
            let quantity = Double(foodOrder.quantity ?? 0)
            
            total += quantity * (foodOrder.foodsID?.price ?? 0)
        })
        return total
    }
    
    init(with order: Order) {
        self.order = order
    }
    
    
    
    var body: some View {
        ScrollView {
            header
            TextField("Search...", text: $searchField)
                .frame(maxWidth: .infinity)
                .padding(.leading,50)
                .padding(.vertical)
                .background(Color.theme.fieldBackground)
                .cornerRadius(50)
                .overlay(
                    Image("search")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.theme.label)
                        .frame(width: 22, height: 22).padding(),
                    
                    alignment: .leading
                    
                )
                .overlay(
                    Image("filter")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.theme.label)
                        .frame(width: 22, height: 22).padding(),
                    alignment: .trailing)
            
            Spacer().frame(height: 30)
            
            ForEach(order.foods ?? []) { food in
               OrderDetailItemView(food: food)
            }
            
            Spacer().frame(height: 30)
            
            VStack {
                HStack {
                    Text("Status")
                        .font(.custom("Satoshi-Medium", size: 15))
                        .foregroundColor(orderColor)
                    Spacer()
                    Text("\(order.orderStatus?.uppercased() ?? "")")
                        .font(.custom("Satoshi-Medium", size: 15))
                        .foregroundColor(statusColor)
                    
                    
                }
                
                Divider()
                
//                HStack {
//                    Text("Discount")
//                        .font(.custom("Satoshi-Medium", size: 15))
//                        .foregroundColor(orderColor)
//                    Spacer()
//                    Text("- USD 1.20")
//                        .font(.custom("Satoshi-Medium", size: 15))
//                        .foregroundColor(.theme.accent)
//
//
//                }
//
//                Divider()
                HStack {
                    Text("Total")
                        .font(.custom("Satoshi-Medium", size: 15))
                        .foregroundColor(orderColor)
                    Spacer()
                    Text("USD \(priceTotalOrder.asNumberString())")
                        .font(.custom("Satoshi-Bold", size: 15))
                    
                    
                }
                
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.all,20)
            .background(
                Color.theme.fieldBackground
            )
            
            .cornerRadius(12)
            
            Group {
                Spacer().frame(height: 30)
                
//                Button {
//
//                } label: {
//                    Text("Place my order")
//                        .font(.custom("Satoshi-Bold", size: 16))
//                        .foregroundColor(.white)
//                        .padding(.horizontal,50)
//                        .padding(.vertical,20)
//                        .background(Color.theme.accent)
//                        .cornerRadius(16)
//                }
                
               
            }
       
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
    }
}

struct OrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailsView(with: dev.order)
    }
}

extension OrderDetailsView {
    
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
                    navigator.pop()
                }
            Spacer().frame(width: 40)
            
            
            Text("Order Details")
                .font(.custom("Satoshi-Bold", size: 20))
            
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding()
    }
}
