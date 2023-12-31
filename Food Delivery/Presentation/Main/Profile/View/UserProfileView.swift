//
//  UserProfileView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 25/09/2023.
//

import SwiftUI
import NavigationBackport

struct UserProfileView: View {
    @Environment(\.colorScheme) private var colorScheme
    @StateObject private var vm = UserProfileViewModel()
    @EnvironmentObject private var navigator: PathNavigator
    @State private var showLogoutAlert:Bool = false
    
    var contentCardColor: Color {
        return colorScheme == .dark ? Color(red: 0.09, green: 0.12, blue: 0.13)
        : Color.white
    }
    
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geometry in
                imageBackground(geometry: geometry)
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        
                        HStack {
                            category
                            
                            Spacer()
                            
                            Button {
                                showLogoutAlert.toggle()
                            } label: {
                                Text("Logout")
                                    .font(.custom("Satoshi-Regular", size: 14))
                            }

                            
                            
                            
                            
                        }
                        
                        
                        
                        Text("\(vm.user?.firstName ?? "") \(vm.user?.lastName ?? "")")
                            .font(.custom("Satoshi-Bold", size: 17))
                        
                        HStack {
                            
                            Text("\(vm.user?.email ?? "")")
                                .font(.custom("Satoshi-Light", size: 17))
                            
                            Spacer()
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color(red: 0.05, green: 0.37, blue: 0.98).opacity(0.25))
                                .overlay(
                                    Image(systemName: "pencil.line")
                                        .foregroundColor(.theme.accent)
                                )
                            
                            
                            
                        }.accentColor(.theme.label)
                        
                        
                        HStack {
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.black)
                                .overlay(Image(systemName: "dollarsign").foregroundColor(.white)
                                )
                            
                            Spacer().frame(width: 20)
                            
                            Text("You have 4 vouchers")
                                .font(.custom("Satoshi-Bold", size: 16))
                        }
                        .padding(.vertical,18)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding()
                        .background(Color.theme.cardBackgroundColor)
                        .cornerRadius(16)
                        .shadow(color: Color(red: 0.05, green: 0.37, blue: 0.98).opacity(0.2), radius: 10, x: 0, y: 7)
                        
                        
                        Spacer().frame(height: 30)
                        
                        HStack {
                            Text("Favorite")
                                .font(.custom("Satoshi-Bold", size: 17))
                            
                            Spacer()
                            Button {
                                navigator.push(Destination.favorites)
                            } label: {
                                Text("See all")
                                    .font(.custom("Satoshi-Regular", size: 17))
                                    .foregroundColor(.theme.accent)
                            }
                            
                        }
                        
                        if vm.isBusy {
                            Group {
                                ProgressView()
                                    .frame(maxWidth: .infinity,alignment: .center)
                                    .padding(.top,20)
                                Spacer(minLength: 400)
                            }
                        } else {
                            Group {
                                
                                ForEach(vm.favorites) { favorite in
                                    FavoriteItemView(favorite: favorite)
                                }
                                
                                Spacer(minLength: 400)
                            }
                        }
                        
                        
                        
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(contentCardColor)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .offset(CGSize(width: 0, height: 300))
                }
            }.alert(isPresented: $showLogoutAlert) {
                Alert(title: Text("Logout"),
                      message: Text("Are you sure you want to logout ?"),
                     
                      primaryButton: .destructive(Text("Yes"),action: {
                    vm.logout()
                    navigator.popToRoot()
                }), secondaryButton: .cancel(Text("No")))
            }
            
        }
       

    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}

extension UserProfileView {
    func imageBackground(geometry: GeometryProxy) -> some View {
        return  Image("background_profile")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: geometry.size.width,maxHeight: geometry.size.height)
            .clipped()
            .ignoresSafeArea()
    }
    
    var category: some View {
        Text("Popular")
            .font(.custom("Satoshi-Regular", size: 14))
            .foregroundColor(.white)
            .padding(.horizontal,10)
            .padding(.vertical,5)
            .background(
                RoundedRectangle(cornerRadius: 32)
                    .fill(Color.theme.accent) )
            .padding()
            .offset(x: -20)
    }
}
