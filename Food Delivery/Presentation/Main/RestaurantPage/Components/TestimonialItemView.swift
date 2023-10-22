//
//  TestimonialItemView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 25/09/2023.
//

import SwiftUI

struct TestimonialItemView: View {
    let testimonial: Testimonial
    
    
    var body: some View {
        HStack(alignment: .top,content: {
            FoodImageView(imageName: testimonial.avatar ?? "")
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Spacer().frame(width: 20)
            VStack(alignment: .leading,spacing: 10) {
                HStack {
                    Text(testimonial.authorName ?? "")
                        .font(.custom("Satoshi-Bold", size: 17))
                    .foregroundColor(.theme.label)
                    Spacer()
                    Image("star")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.theme.accent)
                        .frame(width: 18, height: 18)
                    
                    Text("\(Int(testimonial.rating ?? 0))")
                        .font(.custom("Satoshi-Bold", size: 17))
                        .foregroundColor(.theme.accent)
                        
                }
                
                Text(Date(dateString: testimonial.dateCreated ?? "").asShortDateStyle())
                    .font(.custom("Satoshi-Regular", size: 14))
                    .foregroundColor(.theme.label)
                
                Text(testimonial.content ?? "")
                    .font(.custom("Satoshi-Regular", size: 14))
                    .foregroundColor(.theme.label)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
        })
        .padding(.horizontal,20)
        .padding(.vertical,20)
            .foregroundColor(.clear)
            .frame(maxWidth: .infinity,alignment: .leading)
           
            .background(Color.theme.cardBackgroundColor)
            .cornerRadius(16)
            .shadow(color: Color(red: 0.05, green: 0.37, blue: 0.98).opacity(0.2), radius: 10, x: 0, y: 7)
           
    }
}

struct TestimonialItemView_Previews: PreviewProvider {
    static var previews: some View {
        TestimonialItemView(testimonial: dev.testimonial)
    }
}
