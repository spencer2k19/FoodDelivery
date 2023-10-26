//
//  HomeView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 14/09/2023.
//

import SwiftUI
import NavigationBackport

struct HomeView: View {
    @State private var search: String = ""
    @State private var selectedPage = 0
    @StateObject private var vm =  HomeViewModel()
    @State private var loadingData = false
    @EnvironmentObject private var navigator: PathNavigator
    
    
    
    var body: some View {
        ZStack(alignment: .top) {
            HStack(alignment: .top) {
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
                                navigator.push(Destination.notifications)
                            }
                        
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
                
                
                
                
            }
            
            
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .leading,spacing: 20) {
                    Text("Categories")
                        .font(.custom("Satoshi-Bold", size: 18))
                    
                    
                    if vm.isBusyForObject(for: vm.keyForCategory) {
                        loadingView
                    } else {
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(vm.categories) { category in
                                    CategoryView(category: category)
                                }
                                
                            }
                            .padding(.vertical,10)
                        }
                    }
                    
                    
                    
                    Text("Populate this week")
                        .font(.custom("Satoshi-Bold", size: 18))
                    
                    
                    if (vm.isBusyForObject(for: vm.keyForFoods)) {
                        
                        loadingView
                    } else {
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(vm.foods) { food in
                                    FoodView(food: food)
                                }
                            }
                            .padding(.vertical,10)
                        }
                    }
                    
                    
                    TabView(selection: $selectedPage) {
                        ForEach(0..<10) { i in
                            ZStack(alignment: .topTrailing) {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .background(
                                        LinearGradient(stops: [
                                            Gradient.Stop(color: Color(red: 0.28, green: 0.52, blue: 0.99), location: 0.00),
                                            Gradient.Stop(color: Color(red: 0.05, green: 0.37, blue: 0.98), location: 1.00),
                                            
                                            
                                        ], startPoint: UnitPoint(x: 0.37, y: 0.08),
                                                       endPoint: UnitPoint(x: 0.7, y: 0.97)
                                                      )
                                        .cornerRadius(12)
                                        .shadow(color: Color(red: 0.12, green: 0.12, blue: 0.12).opacity(0.24), radius: 3.5, x: 0, y: 2)
                                    )
                                
                                
                                Image("pizza_hut")
                                    .resizable()
                                    .frame(width: 200, height: 150)
                                    .cornerRadius(10, corners: [.topRight])
                                    .scaledToFill()
                                    .clipped()
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("50% OFF")
                                            .underline()
                                            .foregroundColor(.white)
                                            .font(.custom("Satoshi-Black", size: 18))
                                        
                                        Text("ON")
                                            .foregroundColor(.white)
                                            .font(.custom("Satoshi-Black", size: 18))
                                    }
                                    
                                    
                                    Text("PIZZA HUT")
                                        .foregroundColor(.white)
                                        .font(.custom("Satoshi-Black", size: 18))
                                }
                                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomLeading)
                                .padding()
                                
                            }
                        }
                        .padding(.all, 10)
                    }
                    
                    
                    .frame(height: 200)
                    
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    
                    HStack(spacing: 10) {
                        ForEach(0..<10) { i in
                            Circle()
                                .frame(width: 7, height: 7)
                                .foregroundColor(i == selectedPage ? .black : Color(red: 0.24, green: 0.30, blue: 0.34, opacity: 0.1))
                            
                        }
                    }
                    .frame(maxWidth: .infinity,alignment:.center)
                    
                    
                    
                    
                    Text("Popular restaurants")
                        .font(.custom("Satoshi-Bold", size: 18))
                    
                    if vm.isBusyForObject(for: vm.keyForRestaurants) {
                        loadingView
                    } else {
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(vm.restaurants) { restaurant in
                                  RestaurantView(restaurant: restaurant)
                                    .onTapGesture {
                                            navigator.push(Destination.restaurantDetails(restaurant: restaurant))
                                        }
                                    
                                }
                                
                            }
                            .padding(.bottom,20)
                        }
                    }
                    
                    
                    
                    
                }
                
                
                
            }
            .padding(.top,80)
            
            
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        .onError($vm.errorWrapper)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewLayout(.sizeThatFits)
    }
    
}

extension HomeView {
    var loadingView: some View {
        ProgressView()
            .frame(height: 50)
            .frame(maxWidth: .infinity,alignment: .center)
    }
}
