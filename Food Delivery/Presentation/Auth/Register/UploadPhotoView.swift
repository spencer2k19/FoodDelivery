//
//  UploadPhotoView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 13/09/2023.
//

import SwiftUI

struct UploadPhotoView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var locationViewTag: String? = nil
    
    
    var body: some View {
        
        VStack() {
            header
            Text("Uploading a photo to save data involves transferring an image file to a storage location")
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
                        Image("photo_camera")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35,height: 35)
                            .foregroundColor(Color.theme.accent)
                        Text("Take Photo")
                            .font(.custom("Satoshi-Medium", size: 18))
                        
                    })
                    
                )
            
            Spacer().frame(height: 30)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 300, height: 150)
                .background(Color.theme.cardBackgroundColor)
                .cornerRadius(16)
                .shadow(color: Color(red: 0.05, green: 0.37, blue: 0.98).opacity(0.2), radius: 10, x: 0, y: 7)
                .overlay(
                    VStack(spacing: 15,content: {
                        Image("upload")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35,height: 35)
                            .foregroundColor(Color.theme.accent)
                        Text("Upload your file")
                            .font(.custom("Satoshi-Medium", size: 18))
                        
                    })
                    
                )
            Spacer()
            nextBtn
            NavigationLink(destination: LocationView(), tag: "location", selection: $locationViewTag) {
                EmptyView()
            }
            
            
            
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
            .navigationBarBackButtonHidden()
        
    }
}

struct UploadPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPhotoView()
    }
}

extension UploadPhotoView {
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
            
            
            Text("Upload your photo")
                .font(.custom("Satoshi-Bold", size: 20))
            
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding()
    }
    
    
    var nextBtn: some View {
        Button {
            locationViewTag = "location"
        } label: {
            Text("NEXT")
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
