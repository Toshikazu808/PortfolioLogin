//
//  WelcomeView.swift
//  PortfolioLogin
//
//  Created by Ryan Kanno on 5/8/21.
//

import SwiftUI
import Firebase

struct WelcomeView: View {
   @AppStorage("savedEmail") var savedEmail:String = ""
   @AppStorage("savedPassword") var savedPassword:String = ""
   
   var body: some View {
      ZStack {
         Image("Confetti")
         VStack {
            Text("Welcome!")
               .font(.title)
               .foregroundColor(.white)
               .fontWeight(.bold)
               .padding()
               .border(Color.white, width: 5.3)
               .cornerRadius(10)
               .shadow(color: .black, radius: 10, x: 2, y: 2)
               .padding()
            
            Button(action: {logout()}) {
               Text("Logout")
                  .font(.title)
                  .foregroundColor(.pink)
                  .fontWeight(.bold)
                  .padding()
                  .border(Color.pink, width: 5.3)
                  .cornerRadius(10)
                  .shadow(color: .black, radius: 10, x: 2, y: 2)
                  .padding()
            }                     
         } //: VSTACK
      } //: ZSTACK
   }
   
   func logout() {
      try! Auth.auth().signOut()
      UserDefaults.standard.set(false, forKey: "status")
      NotificationCenter.default.post(name: Notification.Name("status"), object: nil)
      print("Logged out successfully")
   } //: logout()
}

struct WelcomeView_Previews: PreviewProvider {
   static var previews: some View {
      WelcomeView()
   }
}
