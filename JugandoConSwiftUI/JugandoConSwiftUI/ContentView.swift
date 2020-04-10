//
//  ContentView.swift
//  JugandoConSwiftUI
//
//  Created by Sergio Becerril on 14/02/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("¡Hola Mundo!")
                .font(.largeTitle)
                .foregroundColor(Color.green)
            Spacer()
                .frame(height: 60)
            Text("Que he dicho Hola")
                .font(.body)
                .foregroundColor(.red)
                .bold()
            Text("Que he vuelto a decir hola")
            Spacer()
            .frame(height: 100)
            
            Button(action: {
                print("Hola!")
                self.showPrintInLog()
                
            }) {
                Text("Púlsame!")
            }
        }
    }
    
    func showPrintInLog() {
        print("He dicho Holaaa!!!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
