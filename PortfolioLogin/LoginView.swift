//
//  LoginView.swift
//  PortfolioLogin
//
//  Created by Ryan Kanno on 5/8/21.
//

import SwiftUI
//import Firebase

struct LoginView: View {
   @State var color = Color.black.opacity(0.7)
   @State var email = ""
   @State var pw = ""
   @State var visiblePW = false
   @Binding var show: Bool
   @State var alert = false
   @State var error = ""
   
   var body: some View {
      ZStack {
         ZStack(alignment: .topTrailing) {
            GeometryReader { _ in
               VStack {
                  Spacer()
                  Text("Login")
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
                        if visiblePW == true {
                           TextField("Password", text: $pw)
                              .autocapitalization(.none)
                        } else {
                           SecureField("Password", text: $pw)
                              .autocapitalization(.none)
                        }
                     }
                     Button(action: {visiblePW.toggle()}) {
                        Image(systemName: visiblePW ? "eye.slash.fill" : "eye.fill")
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
                  
                  Button(action: {reset()}) {
                     Text("Forgot password")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Lead"))
                  }
                  .padding(.vertical, 8)

                  Button(action: {verify()}) {
                     Text("Login")
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
            
            Button(action: {show.toggle()}) {
               Text("Register")
                  .fontWeight(.bold)
                  .foregroundColor(Color("Lead"))
            }
            .padding()
            
         } //: ZSTACK
         
         if alert == true {
            ErrorView(alert: $alert, error: $error)
               .transition(.opacity)
         }
      } //: ZSTACK
      .background(Image("ModernHouse"))
   } //: BODY
   
   func verify() {
      if email != "" && pw != "" {
         Auth.auth().signIn(withEmail: email, password: pw) { result, error in
            if error != nil {
               self.error = error!.localizedDescription
               self.alert.toggle()
               return
            }
            print("Successfully logged in.")
            UserDefaults.standard.set(true, forKey: "status")
            NotificationCenter.default.post(name: Notification.Name("status"), object: nil)
         }
      } else {
         error = "Please fill email and password correctly."
         alert.toggle()
      }
   } //: verify()
   
   func reset() {
      if email != "" {
         Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
               self.error = error!.localizedDescription
               self.alert.toggle()
               return
            }
            self.error = "RESET"
            self.alert.toggle()
         }
      } else {
         self.error = "Email ID is empty"
         self.alert.toggle()
      }
   } //: reset()
   
   func loginFB() {
//      if fbLoggedIn == true {
////         fbmanager.logOut()
//         email = ""
//         fbLoggedIn = false
//      } else {
////         fbmanager.logIn(permissions: ["emailFB"], from: nil) { (result, error) in
////            if error != nil {
////               print(error!)
////               return
////            }
//         fbLoggedIn = true
//      }
   } //: loginFB()
   
   func loginG() {
//      print("Login via Google")
   }
   
}

