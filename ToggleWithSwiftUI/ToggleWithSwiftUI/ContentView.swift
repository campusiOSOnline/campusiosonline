//
//  ContentView.swift
//  ToggleWithSwiftUI
//
//  Created by Sergio Becerril on 10/04/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var notificaciones = false
    
    var body: some View {
        
        VStack {
            
            Toggle(isOn: $notificaciones) {
                Text("Notificaciones")
            }.padding()
            
            if(notificaciones) {
                Text("Las notificaciones están activadas")
            } else {
                Text("Las nofiticaciones están desactivadas")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
