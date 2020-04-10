//
//  ViewModelList.swift
//  Ejemplo1MVVM
//
//  Created by Sergio Becerril on 13/02/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//

import Foundation

class ViewModelList {
    
    //CREAR UN MECANISMO PARA ENLAZAR LO QUE SERÍA LA VISTA CON ESTE MODELO DE LA VISTA
    var refreshData = { () -> () in }
    
    //FUENTE DE DATOS (ARRAY)
    var dataArray: [List] = [] {
        didSet {
            refreshData()
        }
    }
    
    //¡¡¡¡NO DEBERÍA IR AQUÍ!!!! HABRÍA QUE CREAR UNA CAPA DE CONEXIÓN PARA HACER ESTE TIPO DE COSAS. E INSTANCIAR DESDE AQUÍ EL OBJETO DE CAPA DE CONEXIÓN
    
    //OBTENER LOS DATOS DE LA API
    func retriveDataList() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let json = data else { return }
            
            //SERIALIZAR LOS DATOS
            do {
                let decoder = JSONDecoder()
                self.dataArray = try decoder.decode([List].self, from: json)
            } catch let error {
                print("Ha ocurrido un error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
