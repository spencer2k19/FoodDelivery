//
//  RestaurantView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 23/09/2023.
//

import SwiftUI

struct RestaurantDetailsView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    var circleContentColor: Color {
        return colorScheme == .light ? Color(red: 0.09, green: 0.12, blue: 0.13).opacity(0.1)
        : .white.opacity(0.05)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            
            GeometryReader { geometry in
                Image("restaurant_page")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: geometry.size.width,maxHeight: geometry.size.height)
                    .clipped()
                    .ignoresSafeArea()
                
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading) {
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
                                Spacer()
                                
                                Circle()
                                    .frame(width: 34, height: 34)
                                    .foregroundColor(.theme.legerBlue)
                                    .overlay(
                                        Image("location")
                                            .resizable()
                                            .frame(width: 18, height: 18)
                                    )
                                
                                Spacer().frame(width: 10)
                                
                                Circle()
                                    .frame(width: 34, height: 34)
                                    .foregroundColor(.theme.legerBlue)
                                    .overlay(
                                        Image("heart")
                                            .resizable()
                                            .renderingMode(.template)
                                            .foregroundColor(.theme.accent)
                                            .frame(width: 18, height: 18)
                                            
                                            
                                    )
                            }
                            
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
                            
                            Text("McDonald's is the world's largest fast food restaurant chain, serving over 69 million customers daily in over 100 countries in more than 40,000 outlets as of ...")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .multilineTextAlignment(.leading)
                            
                            Spacer().frame(height: 20)
                            
                            HStack {
                                Text("Popular this week")
                                    .font(.custom("Satoshi-Bold", size: 17))
                                
                                Spacer()
                                Button("See all") {
                                    
                                }
                            }
                            
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
                            
                           
                            
                            HStack {
                                Text("Testimonials")
                                    .font(.custom("Satoshi-Bold", size: 17))
                                
                                Spacer()
                                Button("See all") {
                                    
                                }
                            }
                            
                            TestimonialItemView()
                         
                            
                            
                            Spacer(minLength: 400)
                        }
                        .padding(.horizontal,20)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .background(.white)
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
