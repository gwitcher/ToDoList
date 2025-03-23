//
//  DetailView.swift
//  ToDoList
//
//  Created by Gabe Witcher on 3/22/25.
//

import SwiftUI

struct DetailView: View {
    var passedValue: String // Don't initialize it - it will be passed from the parent view
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text("You Are a Swifty Legend!\n and you passed over the value \(passedValue)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button("Get Back") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        
    }
}

#Preview {
    DetailView(passedValue: "Item 1")
}
 
