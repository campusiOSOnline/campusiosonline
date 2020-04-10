//
//  ContentView.swift
//  AlerViewWithSwiftUI
//
//  Created by Sergio Becerril on 10/04/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var mostrarAlerta = false
    
    var alert: Alert {
        Alert(title: Text("Campus iOS Online"), message: Text("Bienvenidos a la mejor plataforma de aprendizaje iOS"), dismissButton: .default(Text("Aceptar")))
    }
    
    
    var body: some View {
        Button(action: {
            self.mostrarAlerta.toggle()
        }) {
            Text("Mostrar alerta")
        }
        .alert(isPresented: $mostrarAlerta, content: { self.alert })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
