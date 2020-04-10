//
//  ContentView.swift
//  PlayWithImages
//
//  Created by Sergio Becerril on 10/04/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//

import SwiftUI

//https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/

struct ContentView: View {

    var body: some View {
        
        VStack {
        Image("coronavirus")
            .resizable()
            .scaledToFit()
        .clipShape(Circle())
            .shadow(color: .blue, radius: 8)
                        .overlay(Circle().stroke(Color.red, lineWidth: 3))
            .overlay(
                Text("CoronaVirus 2020")
                    .foregroundColor(.white)
                    .font(.title).padding()
            ,alignment: .center)
            Divider()
        Image(systemName: "message.fill")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
