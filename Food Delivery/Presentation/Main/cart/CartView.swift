//
//  CartView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 27/10/2023.
//

import SwiftUI
import NavigationBackport

enum ActiveAlert {
    case orderConfirmAlert, successOrder
}

struct CartView: View {
    @StateObject private var vm = CartViewModel()
    @EnvironmentObject private var navigator:PathNavigator
    @State private var comments = ""
    @State private var showAlert: Bool = false
    @State private var activeAlert: ActiveAlert = .orderConfirmAlert
    
    
    var body: some View {
        VStack {
            header
            
            ScrollView(.vertical,showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(vm.savedFoods) { savedFood in
                        FoodCartItemView(food: savedFood,
                                         provider: vm.providers[savedFood.restaurantId] ?? "..."
                        ) {
                            try? vm.addQuantity(for: savedFood.id)
                        } reduceQuantityCallable: {
                            try? vm.reduceQuantity(for: savedFood.id)
                        }
                        
                    }
                }.padding(.horizontal)
                
                Spacer().frame(height: 20)
                
                VStack(alignment: .leading) {
                    Text("Leave a comment")
                        .font(.custom("Satoshi-Medium", size: 17))
                    
                    TextField("Comments", text: $comments)
                        .frame(height: 80)
                        .padding()
                        .background(Color.theme.fieldBackground)
                        .cornerRadius(12)
                    
                }.frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal)
                
                Spacer().frame(height: 20)
                
                Text("Total: \(vm.total.asNumberString()) $")
                    .font(.custom("Satoshi-Bold", size: 17))
                
                Spacer().frame(height: 30)
                Button {
                    activeAlert = .orderConfirmAlert
                    showAlert.toggle()
                } label: {
                    
                    if vm.isBusy {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .theme.fieldBackground))
                            .frame(width: 200)
                            .padding(.vertical,20)
                            .background(Color.theme.accent)
                            .cornerRadius(16)
                        
                    } else {
                        Text("Place my order")
                            .font(.custom("Satoshi-Bold", size: 16))
                            .foregroundColor(.white)
                            .padding(.horizontal,50)
                            .padding(.vertical,20)
                            .background(Color.theme.accent)
                            .cornerRadius(16)
                    }
                    
                }
                .disabled(vm.isBusy)
                
                Spacer().frame(height: 30)
                
            }
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
            .navigationBarBackButtonHidden()
            .onError($vm.errorWrapper)
            .alert(isPresented: $showAlert) {
                switch activeAlert {
                case .orderConfirmAlert:
                    return Alert(title: Text("Order"),
                                 message: Text("Confirm this order ?"),
                                 
                                 primaryButton: .default(Text("Yes"),action: {
                               showAlert = false
                               Task {
                                   do {
                                       try await vm.addOrder(comments:comments)
                                       activeAlert = .successOrder
                                       showAlert = true
                                   } catch let error {
                                       print("Error occured: \(error)")
                                   }
                                   
                                   
                               }
                               
                           }), secondaryButton: .cancel(Text("No")))
                case .successOrder:
                    return Alert(
                        title: Text("Success"),
                        message: Text("Your action was successful."),
                        dismissButton: .default(Text("OK"),action: {
                            navigator.popTo(Destination.home)
                        })
                    )
                }
                
            }
           
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}


extension CartView {
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
            
            
            Text("My cart")
                .font(.custom("Satoshi-Bold", size: 20))
            
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding()
    }
}
