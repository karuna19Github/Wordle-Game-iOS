//
//  ContentView.swift
//  Slider
//
//  Created by User12 on 2022/4/15.
//

import SwiftUI
import AVFoundation


struct ContentView: View {
    let musicPlayer = AVPlayer()
    //@State private var showSecondView = false
    @State private var showgames = false
    var body: some View {
        ZStack(alignment:.center )
        {
        Image("hewan1")
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight:
            0, maxHeight: .infinity)
            .ignoresSafeArea()
        Button(action: {showgames = true}, label: {
            ZStack{
                
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 300, height: 50)
                Text("PLAY Now!!")
                    .font(.largeTitle)
                   .foregroundColor(.black)
            }
            
        })
        .fullScreenCover(isPresented: $showgames) {
        games(showgames: $showgames)
        }
        
    }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
