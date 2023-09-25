//
//  NotificationsView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 16/09/2023.
//

import SwiftUI

struct NotificationsView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var searchField: String = ""
    @State private var showOrderDetails:Bool = false
    var callableOnClick: () ->Void {
        return {
            self.showOrderDetails = true
        }
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
            
            Spacer().frame(height: 30)
            NotificationItemView(callable: callableOnClick)
            NotificationItemView(callable: callableOnClick)
            NotificationItemView(callable: callableOnClick)
            
            
            NavigationLink(destination: OrderDetailsView(), isActive: $showOrderDetails) {
                EmptyView()
            }
            
          
            
            
        }.padding(.horizontal)
            .navigationBarBackButtonHidden()
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}


extension NotificationsView {
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
            
            
            Text("Notifications")
                .font(.custom("Satoshi-Bold", size: 20))
            
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding()
    }
}
