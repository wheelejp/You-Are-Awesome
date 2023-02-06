//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jonathan Wheeler Jr. on 1/23/23.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var messageString = ""
    @State private var imageName = ""
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        
        VStack {
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding()
            
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
                .padding()
            
            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You are Awesome",
                                "You are Great",
                                "You are Fantastic",
                                "Fabulous? That's You!",
                                "You Make Me Smile",
                                "When the Genius Bar Needs Help, They Call You!"]
                lastMessageNumber = nonRepeatingNumber(lastNumber: lastMessageNumber, upperBound: messages.count-1)
                messageString = messages[lastMessageNumber]
                lastImageNumber = nonRepeatingNumber(lastNumber: lastImageNumber, upperBound: 9)
                imageName = "image\(lastImageNumber)"
                
                lastSoundNumber = nonRepeatingNumber(lastNumber: lastSoundNumber, upperBound: 5)
                playSound(soundName: "sound\(lastSoundNumber)" )
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
    
    func nonRepeatingNumber(lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        return newNumber
    }
    func playSound(soundName: String){
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("Error: \(error.localizedDescription) creating audioplayer.")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
