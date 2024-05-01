//
//  PassCodeView.swift
//  PassCodeAppSwiftUI
//
//  Created by Macbook on 23/4/24.
//

import SwiftUI

struct PassCodeView: View {
    
    @Binding var isAuthenticated: Bool
    @State private var passcode = ""
    
    var body: some View {
        VStack(spacing: 48) {
            VStack(spacing: 24) {
                Text("Enter code")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text("Please enter 4-digit pin to securely access your account.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
            .padding(.top)
            
            // indicator view
            PasscodeIndicatorView(passcode: $passcode)
            
            Spacer()
            
            // numberpad view
            NumberPadView(passcode: $passcode)
        }
         //iOS 17 standart
        .onChange(of: passcode, { oldValue, newValue in
            verifyPassCode()
        })
        
//        // older versions before iOS 17
//        .onChange(of: passcode) { value in
//            verifyPassCode()
//        }
    }
    
    private func verifyPassCode() {
        guard passcode.count == 4 else { return }
        
        Task {
            try? await Task.sleep(nanoseconds: 125_000_000)
            isAuthenticated = passcode == "5555"
            passcode = ""
        }
    }
}

#Preview {
    PassCodeView(isAuthenticated: .constant(false))
}
