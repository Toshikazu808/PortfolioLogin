//
//  SignUpView.swift
//  PortfolioLogin
//
//  Created by Ryan Kanno on 5/8/21.
//

import SwiftUI
import Firebase

struct SignupView: View {
   @State var color = Color.black.opacity(0.7)
   @State var email = ""
   @State var pw = ""
   @State var regPass = ""
   @State var visiblePW = false
   @State var regVisiblePW = false
   @Binding var show: Bool
   @State var alert = false
   @State var error = ""
   
   var body: some View {
      ZStack {
         ZStack(alignment: .topLeading) {
            GeometryReader { _ in
               VStack {
                  Spacer()
                  Text("Register")
                     .font(.title)
                     .foregroundColor(.white)
                     .fontWeight(.bold)
                     .padding()
                     .padding(.horizontal, 40)
                     .border(Color.white, width: 5.3)
                     .cornerRadius(10)
                     .shadow(color: .black, radius: 10, x: 2, y: 2)
                     .padding(.top, 40)
                     .padding(.bottom, 8)
                  Spacer()
                  
                  TextField("Email", text: $email)
                     .padding()
                     .background(Color.white)
                     .opacity(0.75)
                     .cornerRadius(6)
                     .background(RoundedRectangle(cornerRadius: 6).stroke(email != "" ? Color(.white) : color,lineWidth: 2))
                     .padding(.horizontal, 40)
                     .padding(.vertical, 8)
                     .autocapitalization(.none)

                  HStack(spacing: 15) {
                     VStack {
                        if regVisiblePW == true {
                           TextField("Password", text: $pw)
                              .autocapitalization(.none)
                        } else {
                           SecureField("Password", text: $pw)
                              .autocapitalization(.none)
                        }
                     }
                     Button(action: {regVisiblePW.toggle()}) {
                        Image(systemName: regVisiblePW ? "eye.slash.fill" : "eye.fill")
                           .foregroundColor(color)
                     }
                  } //: HSTACK
                  .padding()
                  .background(Color.white)
                  .opacity(0.75)
                  .cornerRadius(6)
                  .background(RoundedRectangle(cornerRadius: 6).stroke(pw != "" ? Color(.white) : color,lineWidth: 2))
                  .padding(.horizontal, 40)
                  .padding(.vertical, 8)

                  HStack(spacing: 15) {
                     VStack {
                        if regVisiblePW == true {
                           TextField("Re-enter", text: $regPass)
                        } else {
                           SecureField("Re-enter", text: $regPass)
                        }
                     }
                     Button(action: {regVisiblePW.toggle()}) {
                        Image(systemName: regVisiblePW ? "eye.slash.fill" : "eye.fill")
                           .foregroundColor(color)
                     }
                  } //: HSTACK
                  .padding()
                  .background(Color.white)
                  .opacity(0.75)
                  .cornerRadius(6)
                  .background(RoundedRectangle(cornerRadius: 6).stroke(pw != "" ? Color(.white) : color,lineWidth: 2))
                  .padding(.horizontal, 40)
                  .padding(.vertical, 8)
                  
                  Button(action: {register()}) {
                     Text("Register")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                  }
                  .padding()
                  .padding(.horizontal, 110)
                  .background(Color.gray)
                  .cornerRadius(40)
                  .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.white, lineWidth: 1.5))
                  Spacer()
               } //: VSTACK
            } //: GEOMETRY
            
            Button(action: {
               show.toggle()
            }) {
               Image(systemName: "chevron.left")
                  .font(.title)
                  .foregroundColor(.white)
            }
            .padding()
            
         } //: ZSTACK
         
         if alert == true {
            ErrorView(alert: $alert, error: $error)
               .transition(.opacity)
         }
      } //: ZSTACK
      .background(Image("ModernHouse"))
      .navigationBarBackButtonHidden(true)
      .navigationBarHidden(true)
   } //: BODY
   
   func register() {
      if email != "" {
         if pw == regPass {
            Auth.auth().createUser(withEmail: email, password: pw) { result, error in
               if error != nil {
                  self.error = error!.localizedDescription
                  self.alert.toggle()
                  return
               }
               print("Successfully created account.")
               UserDefaults.standard.set(true, forKey: "status")
               NotificationCenter.default.post(name: Notification.Name("status"), object: nil)
            }
         } else {
            error = "Passwords do not match."
            alert.toggle()
         }
      } else {
         error = "Please fill email and password correctly."
         alert.toggle()
      }      
   } //: register()
}
