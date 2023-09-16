//
//  BioView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 12/09/2023.
//

import SwiftUI

struct BioView: View {
    @State private var fullname: String = ""
    @State private var phoneNumber: String = ""
    @Environment(\.presentationMode) private var presentationMode
    @State private var gender: String = "Male"
    @State private var birthdate: String = "23/Octomber/1990"
    @State private var showPaymentView: Bool = false
    @State private var showGender: Bool = false
    var genders: [String] = ["Male", "Female"]
    
    static let identifier = "bio"
    
    private func toggleGenderList() {
        withAnimation(.easeInOut) {
            showGender.toggle()
        }
    }
    
    private func selectGender(_ genderSelected: String) {
        withAnimation(.easeInOut) {
            gender = genderSelected
            showGender = false
        }
       
    }
    
    
    
    var body: some View {
        ScrollView {
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
                
                
                Text("Fill in all fields")
                    .font(.custom("Satoshi-Bold", size: 20))
                
                
            }.frame(maxWidth: .infinity,alignment: .leading)
                .padding()
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Full Name")
                    .font(.custom("Satoshi-Bold", size: 18))
                
                TextField("Enter fullname", text: $fullname)
                    .textContentType(.name)
                    .padding(.all,20)
                    .keyboardType(.default)
                    .background(Color.theme.fieldBackground)
                    .cornerRadius(12)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .inset(by: 0.5)
                            .stroke(Color.theme.strokeBtnColor, lineWidth: 1)

                    }
                
                Spacer().frame(height: 10)
                
                Text("Gender")
                    .font(.custom("Satoshi-Bold", size: 18))
                Button {
                    toggleGenderList()
                } label: {
                    
                    VStack {
                        Text(gender)
                            .foregroundColor(Color.theme.label)
                            .font(.custom("Satoshi-Regular", size: 18))
                            .padding(.all,20)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .overlay(alignment: .trailing, content: {
                                Image(systemName: "chevron.down")
                                    .foregroundColor(Color.theme.label)
                                    .padding()
                                
                            })
                        
                        if showGender {
                           ForEach(genders, id: \.self) { value in
                                    Button {
                                       selectGender(value)
                                    } label: {
                                        HStack {
                                            Text(value)
                                                .foregroundColor(Color.theme.label)
                                                .font(.custom("Satoshi-Regular", size: 17))
                                        }
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.horizontal,20)
                                    }
                                    .padding(.vertical,20)
                                    
                                   
                                }
                            
                        }
                    }
                    
                   
                        .background(Color.theme.fieldBackground)
                        .cornerRadius(12)
                        
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .inset(by: 0.5)
                                .stroke(Color.theme.strokeBtnColor, lineWidth: 1)
                        }
                    
                    
                    
                }
                
                
                Spacer().frame(height: 10)
                Group {
                    Text("Phone Number")
                        .font(.custom("Satoshi-Bold", size: 18))
                    
                    TextField("Enter phone number", text: $phoneNumber)
                        .padding(.all,20)
                        .textContentType(.telephoneNumber)
                        .keyboardType(.phonePad)
                        .background(Color.theme.fieldBackground)
                        .cornerRadius(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .inset(by: 0.5)
                                .stroke(Color.theme.strokeBtnColor, lineWidth: 1)

                        }
                    
                    Spacer().frame(height: 10)
                    
                    
                    Text("Birth Date")
                        .font(.custom("Satoshi-Bold", size: 18))
                    Button {
                        
                    } label: {
                        Text(birthdate)
                            .foregroundColor(Color.theme.label)
                            .font(.custom("Satoshi-Regular", size: 18))
                            .padding(.all,20)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .background(Color.theme.fieldBackground)
                            .cornerRadius(12)
                            .overlay(alignment: .trailing, content: {
                                Image(systemName: "calendar.badge.clock")
                                    .foregroundColor(Color.theme.label)
                                    .padding()
                                
                            })
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .inset(by: 0.5)
                                    .stroke(Color.theme.strokeBtnColor, lineWidth: 1)
                            }
                        
                        
                        
                    }
                    
                   
                }
                
               
                
                
               

                
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding()
            
            Spacer().frame(height: 40)
            
            Button(action: {
                showPaymentView = true
            }) {
                Text("NEXT")
                    .font(.custom("Satoshi-Bold", size: 18))
                    .foregroundColor(.white)
                    .padding(.all, 20)
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.accent)
                    .cornerRadius(50)
                    .padding()
                    
                
            }
            
            NavigationLink(destination: PaymentMethodView(), isActive: $showPaymentView) {
                EmptyView()
            }
            
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
           
    }
}

struct BioView_Previews: PreviewProvider {
    static var previews: some View {
        BioView()
    }
}
