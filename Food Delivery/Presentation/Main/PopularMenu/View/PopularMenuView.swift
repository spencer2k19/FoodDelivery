//
//  PopularMenuView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 26/09/2023.
//

import SwiftUI
import NavigationBackport

struct PopularMenuView: View {
    @State private var search: String = ""
    @StateObject private var vm:PopularMenuViewModel
    @EnvironmentObject private var navigator: PathNavigator
    
    let columns = [
        GridItem(.flexible(),spacing: 20),
        GridItem(.flexible()),
        
    ]
    
    init(restaurantId: Int) {
        _vm = StateObject(wrappedValue: PopularMenuViewModel(restaurantId: restaurantId))
    }
    
    
    var body: some View {
        VStack {
            header
            HStack(alignment: .top) {
                TextField("Search...", text: $search)
                    .frame(height: 54)
                    .padding(.leading,60)
                    .background(Color.theme.fieldBackground)
                    .cornerRadius(50)
                    .overlay(
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
                
                Circle()
                    .foregroundColor(Color.theme.fieldBackground)
                    .frame(width: 54, height: 54)
                    .overlay(
                        Image("notification")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.theme.label)
                            .frame(width: 20, height: 20)
                           
                        
                    )
                
                Circle()
                    .foregroundColor(Color.theme.fieldBackground)
                    .frame(width: 54, height: 54)
                    .overlay(
                        ZStack(content: {
                            Image(systemName: "cart")
                                .foregroundColor(.theme.label)
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    navigator.push(Destination.cart)
                                }
                            
                            
                            if !vm.savedFoods.isEmpty {
                                Circle()
                                    .foregroundColor(Color.theme.red)
                                    .frame(width: 20, height: 20,alignment: .trailing)
                                    .overlay(
                                        Text("\(vm.savedFoods.count)")
                                            .font(.custom("Satoshi-Bold", size: 16))
                                            .foregroundColor(.white),
                                        alignment: .center
                                    )
                                
                                    .frame(maxWidth: .infinity,
                                           maxHeight: .infinity
                                           ,alignment: .topTrailing)
                            }
                        })
                    )
            }.padding(.horizontal)
           
            Spacer().frame(height: 20)
            if vm.isBusy {
                ProgressView()
                    .padding(.top,20)
             } else {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns,spacing: 10) {
                        ForEach(vm.popularFoods) { popularFood in
                            FoodGridItemView(food: popularFood) {
                                Task {
                                    try? await vm.addFood(food: popularFood)
                                }
                            }
                        }
                    }.padding(.horizontal,10)
                }
            }
            
           
        }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
    }
}

struct PopularMenuView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMenuView(restaurantId: 1)
    }
}


extension PopularMenuView {
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
            
            
            Text("Popular Menu")
                .font(.custom("Satoshi-Bold", size: 20))
            
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding()
            .navigationBarBackButtonHidden()
    }
}
