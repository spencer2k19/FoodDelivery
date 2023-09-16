//
//  LocationView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 13/09/2023.
//

import SwiftUI

struct LocationView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.rootPresentationMode) var rootPresentationMode
    
    
    var body: some View {
        VStack {
            header
            Text("On your Android phone or tablet, touch and hold the Google app icon")
                .font(.custom("Satoshi-Regular", size: 18))
                .padding()
            
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 300, height: 150)
                .background(Color.theme.cardBackgroundColor)
                .cornerRadius(16)
                .shadow(color: Color(red: 0.05, green: 0.37, blue: 0.98).opacity(0.2), radius: 10, x: 0, y: 7)
                .overlay(
                    VStack(spacing: 15,content: {
                        Image("location")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35,height: 35)
                            .foregroundColor(Color.theme.accent)
                        Text("Set Location")
                            .font(.custom("Satoshi-Medium", size: 18))
                        
                    })
                    
                )
            
            Spacer()
            nextBtn
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
            .navigationBarBackButtonHidden()
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

extension LocationView {
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
            
            
            Text("Set Your Location")
                .font(.custom("Satoshi-Bold", size: 20))
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding()
    }
    
    
    var nextBtn: some View {
        Button {
            rootPresentationMode.wrappedValue.dismiss()
        } label: {
            Text("VALIDATE")
                .font(.custom("Satoshi-Bold", size: 17))
                .foregroundColor(.white)
                .padding(.vertical,20)
                .frame(maxWidth: .infinity)
                .background(Color.theme.accent)
                .cornerRadius(50)
                .padding()
        }
    }
}
