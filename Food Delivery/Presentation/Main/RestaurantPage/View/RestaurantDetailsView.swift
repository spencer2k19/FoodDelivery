//
//  RestaurantView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 23/09/2023.
//

import SwiftUI
import NavigationBackport

struct RestaurantDetailsView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var showFullDescription: Bool = false
    @StateObject private var vm:RestaurantPageViewModel
    @EnvironmentObject private var navigator: PathNavigator
    
    let restaurant: Restaurant
    
    
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
        _vm = StateObject(wrappedValue: RestaurantPageViewModel(restaurantId: restaurant.id ?? 0))
    }
    
    

    var circleContentColor: Color {
        return colorScheme == .light ? Color(red: 0.09, green: 0.12, blue: 0.13).opacity(0.1)
        : .white.opacity(0.05)
    }
    
    var circleBlueContentColor: Color {
        return Color(red: 0.05, green: 0.37, blue: 0.98).opacity(0.25)
    }
    
    
    
    var body: some View {
        ZStack(alignment: .top) {
            
            GeometryReader { geometry in
                imageBackground(geometry: geometry)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        category
                        
                        Text(restaurant.name ?? "")
                            .font(.custom("Satoshi-Bold", size: 17))
                        
                        HStack {
                            Circle()
                                .frame(width: 34, height: 34)
                                .foregroundColor(circleContentColor)
                                .overlay(
                                    Image("location")
                                        .resizable()
                                        .renderingMode(.template)
                                        .foregroundColor(.theme.label)
                                        .frame(width: 18, height: 18)
                                )
                            
//                            Text(restaurant.distance)
//                                .font(.custom("Satoshi-Regular", size: 15))
                            Spacer().frame(width: 20)
                            
                            
                            Circle()
                                .frame(width: 34, height: 34)
                                .foregroundColor(circleContentColor)
                                .overlay(
                                    Image("star")
                                        .resizable()
                                        .renderingMode(.template)
                                        .foregroundColor(.theme.label)
                                        .frame(width: 18, height: 18)
                                )
                            
                            Text("\(Int(restaurant.rating ?? 0.0)) rating")
                                .font(.custom("Satoshi-Regular", size: 15))
                        }
                        
                        textDescription
                        Spacer().frame(height: 20)
                        
                        HStack {
                            Text("Popular this week")
                                .font(.custom("Satoshi-Bold", size: 17))
                            
                            Spacer()
                            Button("See all") {
                                navigator.push(Destination.popularMenu(restaurantId: restaurant.id ?? 0))
                            }
                        }
                        if vm.isBusy {
                            ProgressView()
                                .frame(height: 50)
                                .frame(maxWidth: geometry.size.width, alignment: .center)
                        } else {
                            foods
                        }
                       
                        HStack {
                            Text("Testimonials")
                                .font(.custom("Satoshi-Bold", size: 17))
                            
                            Spacer()
                            Button("See all") {
                                navigator.push(Destination.testimonials(restaurantId: restaurant.id ?? 0))
                            }
                        }
                        
                        if vm.isBusyForObject(for: vm.keyForTestimonials) {
                            ProgressView()
                                .frame(height: 50)
                                .frame(maxWidth: geometry.size.width, alignment: .center)
                        } else {
                            VStack {
                                ForEach(vm.testimonials) { testimonial in
                                    TestimonialItemView(testimonial: testimonial)
                                }
                            }
                        }
                        
                        
                        

                        Spacer(minLength: 400)
                        
                        
                    }
                    .padding(.horizontal,20)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .background(Color.theme.background)
                    .cornerRadius(30,corners: [.topLeft, .topRight])
                    .offset(CGSize(width: 0, height: 300))
                }
            }
        }
       
    }
    
}

struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailsView(restaurant: dev.restaurant)
            
    }
}

extension RestaurantDetailsView {
    func imageBackground(geometry: GeometryProxy) -> some View {
        return  Image("restaurant_page")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: geometry.size.width,maxHeight: geometry.size.height)
            .clipped()
            .ignoresSafeArea()
    }
    
    var category: some View {
        HStack {
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
            Spacer()
            
            Circle()
                .frame(width: 34, height: 34)
                .foregroundColor(circleBlueContentColor)
                .overlay(
                    Image("location")
                        .resizable()
                        .frame(width: 18, height: 18)
                )
            
            Spacer().frame(width: 10)
            
            Circle()
                .frame(width: 34, height: 34)
                .foregroundColor(circleBlueContentColor)
                .overlay(
                    Image("blue_heart")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.theme.accent)
                        .frame(width: 18, height: 18)
                    
                    
                )
        }
    }
    var textDescription: some View {
        
        Button {
            withAnimation(.easeOut) {
                showFullDescription.toggle()
            }
        } label: {
            Text(restaurant.description ?? "")
                .foregroundColor(.theme.label)
                .lineLimit(showFullDescription ? nil : 3)
                .font(.custom("Satoshi-Regular", size: 16))
                .multilineTextAlignment(.leading)
        }
        
        
        
        
    }
    var foods: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(vm.foods) { food in
                    FoodView(food: food)
                }
            }.padding(.vertical,10)
            
        }
    }
    
}
