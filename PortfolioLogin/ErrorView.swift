//
//  ErrorView.swift
//  PortfolioLogin
//
//  Created by Ryan Kanno on 5/9/21.
//

import SwiftUI

struct ErrorView: View {
   @State var color = Color.black.opacity(0.7)
   @Binding var alert: Bool
   @Binding var error: String
   
   var body: some View {
      ZStack {
         Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
         
         VStack {
            Text(error == "RESET" ? "Message" : "Error")
               .font(.title)
               .fontWeight(.bold)
               .foregroundColor(.black)
            
            Text(error == "RESET" ? "Password reset link has been sent to your email." : error)
               .foregroundColor(Color("Lead"))
               .padding(.top)
               .padding(.horizontal, 25)
            
            Button(action: {alert.toggle()}) {
               Text(error == "RESET" ? "Ok" : "Cancel")
                  .foregroundColor(.white)
                  .padding(.vertical)
                  .frame(width: UIScreen.main.bounds.width - 120)
            }
            .background(Color("Lead"))
            .cornerRadius(40)
            .padding(.top, 25)
            
         } //: VSTACK
         .padding(.vertical, 25)
         .frame(width: UIScreen.main.bounds.width - 70)
         .background(Color.white)
         .cornerRadius(15 )

      } //: ZSTACK
   }
}

//struct ErrorView_Previews: PreviewProvider {
//   static var previews: some View {
//      ErrorView()
//   }
//}
