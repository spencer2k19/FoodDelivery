//
//  PopularMenuView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 26/09/2023.
//

import SwiftUI

struct PopularMenuView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var search: String = ""
    @State private var showNotification: Bool = false
    @StateObject private var vm = PopularMenuViewModel()
    
    let columns = [
        GridItem(.flexible(),spacing: 20),
        GridItem(.flexible()),
        
    ]
    
    
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
                            .onTapGesture {
                                showNotification = true
                            }
                        
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
                            FoodGridItemView(food: popularFood)
                        }
                    }.padding(.horizontal,10)
                }
            }
            
           
        }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
    }
}

struct PopularMenuView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMenuView()
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
                    presentationMode.wrappedValue.dismiss()
                }
            Spacer().frame(width: 40)
            
            
            Text("Popular Menu")
                .font(.custom("Satoshi-Bold", size: 20))
            
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding()
            .navigationBarBackButtonHidden()
    }
}
