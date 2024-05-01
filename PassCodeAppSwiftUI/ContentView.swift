//
//  ContentView.swift
//  PassCodeAppSwiftUI
//
//  Created by Macbook on 23/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated: Bool = false
    
    var body: some View {
        VStack {
            if isAuthenticated {
                VStack {
                    Text("You're in!")
                    
                    Button("Log Out") {
                        isAuthenticated = false
                    }
                }
            } else {
                PassCodeView(isAuthenticated: $isAuthenticated)
            }
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
