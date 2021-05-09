//
//  ContentView.swift
//  PortfolioLogin
//
//  Created by Ryan Kanno on 5/9/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      HomeView()
         .transition(.opacity)
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
