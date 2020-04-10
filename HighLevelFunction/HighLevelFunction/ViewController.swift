//
//  ViewController.swift
//  HighLevelFunction
//
//  Created by Sergio Becerril on 21/05/2019.
//  Copyright © 2019 Sergio Becerri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let miArray = [0,2,4,-3,6,8,-30]
    
    let otroArray = ["Uno","Dos", "1", "2", "5"]
    
    let dict = ["Manuel":[0, 1, 8],"Alberto":[3,6,9]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MAP
        let map: [Int?] = otroArray.map {Int($0)}
        print("Con map tengo: \(map)")
        
        //COMPACTMAP
        let compactMap: [Int] = otroArray.compactMap {Int($0)}
        print("Con map tengo: \(compactMap)")
        
        //FLATMAP
        let flatMap = dict.flatMap {$0.value}
        print("Con flatMap tengo: \(flatMap)")
        
        let compactMap2 = dict.compactMap {$0.value}
        print("Con flatMap tengo: \(flatMap)")
        
        let map2 = dict.map {$0.value}
        
        print("Con flatMap tengo: \(flatMap)")
        print("Con compactMap tengo: \(compactMap2)")
        print("Con map tengo: \(map2)")
        
        //WHERE
        for numero in  miArray where numero % 2 == 0{
            print("Imprime: \(numero) ")
        }
        
        //FIRST
        let primerNegativo = miArray.first(where: { $0 < 0})
        print("Imprime esto otro: \(String(describing: primerNegativo))")
        
        //FILTER
        
        let numero = miArray.filter {$0 % 2 == 0}
        print("Imprime esto otro con filter: \(numero)")
    }


}

