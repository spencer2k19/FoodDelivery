//
//  RestaurantView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 23/09/2023.
//

import SwiftUI

struct RestaurantDetailsView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var showTestimonials: Bool = false
    @State private var showFullDescription: Bool = false
    @State private var showPopularMenu: Bool = false
    
    
    let description: String = """
A cheeseburger is a burger with a slice of melted cheese on top of the meat patty, added near the end of the cooking time. Cheeseburgers can include variations in structure, ingredients and composition. As with other hamburgers, a cheeseburger may include various condiments and other toppings such as:
    - Lettuce
    - Tomato
    - Onion
    - Pickles
    - Bacon
    - Avocado
    - Mushrooms
    - Mayonnaise
    - Ketchup
    - Mustard
"""
    
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
                        
                        Text("Mcdonald's ")
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
                            
                            Text("3 km")
                                .font(.custom("Satoshi-Regular", size: 15))
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
                            
                            Text("4.8 rating")
                                .font(.custom("Satoshi-Regular", size: 15))
                        }
                        
                        textDescription
                        Spacer().frame(height: 20)
                        
                        HStack {
                            Text("Popular this week")
                                .font(.custom("Satoshi-Bold", size: 17))
                            
                            Spacer()
                            Button("See all") {
                                showPopularMenu = true
                            }
                        }
                        foods
                        HStack {
                            Text("Testimonials")
                                .font(.custom("Satoshi-Bold", size: 17))
                            
                            Spacer()
                            Button("See all") {
                                showTestimonials = true
                            }
                        }
                        
                        TestimonialItemView()
                        Group {
                            NavigationLink(destination: TestimonialsView(), isActive: $showTestimonials) {
                                EmptyView()
                            }
                            NavigationLink(destination: PopularMenuView(), isActive: $showPopularMenu) {
                                EmptyView()
                            }
                            
                            Spacer(minLength: 400)
                        }
                        
                        
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
        RestaurantDetailsView()
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
            Text(description)
                .foregroundColor(.theme.label)
                .lineLimit(showFullDescription ? nil : 3)
                .font(.custom("Satoshi-Regular", size: 16))
                .multilineTextAlignment(.leading)
        }
        
        
        
        
    }
    var foods: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack(spacing: 30) {
                FoodView()
                FoodView()
                FoodView()
                FoodView()
                FoodView()
                FoodView()
                FoodView()
            }.padding(.vertical,10)
            
        }
    }
    
}
