//
//  TestimonialsView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 25/09/2023.
//

import SwiftUI
import NavigationBackport

struct TestimonialsView: View {
    @StateObject private var vm: TestimonialViewModel
    @EnvironmentObject private var navigator: PathNavigator
    
    
    
    init(restaurant: Int) {
        _vm = StateObject(wrappedValue: TestimonialViewModel(restaurant: restaurant))
    }
    
    var body: some View {
        VStack {
            header
            ScrollView {
                VStack(spacing: 20) {
                    if(vm.isBusy) {
                        ProgressView()
                            .padding(.top,20)
                    } else {
                        ForEach(vm.testimonials) { testimonial in
                            TestimonialItemView(testimonial: testimonial)
                        }
                    }
                }
                .padding(.horizontal)
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        }
    }
    
}

struct TestimonialsView_Previews: PreviewProvider {
    static var previews: some View {
        TestimonialsView(restaurant: 1)
    }
}


extension TestimonialsView {
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
            
            
            Text("Testimonials")
                .font(.custom("Satoshi-Bold", size: 20))
            
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding()
            .navigationBarBackButtonHidden()
    }
}
