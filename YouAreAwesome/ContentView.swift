//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jonathan Wheeler Jr. on 1/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = "When the Genius Bar needs help, they call you!"
    var body: some View {
        
        VStack {
            Group {
                Text("I am a Text View")
                Text("I am a Text View")
                Text("I am a Text View")
                Text("I am a Text View")
                Text("I am a Text View")
                Text("I am a Text View")
                Text("I am a Text View")
                Text("I am a Text View")
                Text("I am a Text View")
            }
            .font(.title)
            .fontWeight(.heavy)
            
            Spacer()
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding()
            
            Spacer()
            
            
            HStack {
                Button("Awesome") {
                    // This is the action performed when the button is pressed
                    messageString = "You Are Awesome!"
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                Button("Great") {
                    messageString = "You Are Great!"
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
