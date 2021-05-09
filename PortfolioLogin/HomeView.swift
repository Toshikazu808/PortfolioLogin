//
//  HomeView.swift
//  PortfolioLogin
//
//  Created by Ryan Kanno on 5/8/21.
//

import SwiftUI

struct HomeView: View {
   @State var show = false
   @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
   
   var body: some View {
      NavigationView {
         VStack {
            if status == true {
               WelcomeView()
            } else {
               ZStack {
                  NavigationLink(
                     destination: SignupView(show: $show),
                     isActive: $show) {
                        Text("")
                     }
                     .hidden()
                  
                  LoginView(show: $show)
               } //: ZSTACK
            }
         }
         .navigationBarTitle("")
         .navigationBarHidden(true)
         .navigationBarBackButtonHidden(true)
         .onAppear {
            NotificationCenter.default.addObserver(forName: Notification.Name("status"), object: nil, queue: .main) { (_) in
               status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
            }
         }
      } //: NAVIGATION
   }
}

struct HomeView_Previews: PreviewProvider {
   static var previews: some View {
      HomeView()
   }
}
