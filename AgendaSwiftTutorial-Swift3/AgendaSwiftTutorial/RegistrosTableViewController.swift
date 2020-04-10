//
//  RegistrosTableViewController.swift
//  AgendaSwiftTutorial
//
//  Created by Jaime Pantoja Diaz on 1/10/16.
//
//

import UIKit
import CoreData

class RegistrosTableViewController: UITableViewController {

    @IBOutlet var miTabla: UITableView!
    
    //CREAMOS LAS VARIABLES Y CONSTANTES PARA REALIZAR LA CONSULTA A CORE DATA Y TRAER LOS DATOS
    let fetchRequest: NSFetchRequest<Persona> = Persona.fetchRequest()
    var searchResults: Array<Persona> = []
    var managedObjectContext: NSManagedObjectContext?
    
    
    //FUNCIÓN QUE TRAE EL PERSISTENT STORE DEL APP DELEGATE
    func getContext () -> NSManagedObjectContext {
        //creamos una instancia del delegado que será el encargado de gestionar el core data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //retorno de un NSManagedObjectContext desde el delegado
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        managedObjectContext = getContext()
        
    }

    //presentará datos en mi vista de tabla
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
         do {
        
            //Guardamos en un array los datos de la consulta del NSManagedObjectContext
            searchResults  = try getContext().fetch(fetchRequest)
            
         } catch let error as NSError
         {
            NSLog("Error: \(error), \(error.userInfo)")
            abort()
        }
        
        
        miTabla.reloadData()
        
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return searchResults.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId: NSString = "Cell"
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId as String)! as UITableViewCell
        if (searchResults.count) > 0 {
            let nombre: String? = searchResults[indexPath.row].nombre
            let apellidos: String? = searchResults[indexPath.row].apellidos
            
            if searchResults[indexPath.row].nombre != nil {
                cell.textLabel?.text = "\(nombre!), \(apellidos!)"
                
                cell.detailTextLabel?.text = searchResults[indexPath.row].direccion
            }
        }
        return cell
    }
    
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "actualizar" {
            
            //creamos indexPath, que es el encargado de almacenar el indice de la tabla
            var indexPath: IndexPath = self.tableView.indexPathForSelectedRow!
            
            //crea un objeto de la clase NSManagedObject y le paso mi array fila seleccionada
            let selectItem: NSManagedObject = searchResults[indexPath.row] as NSManagedObject

            //instancia de la ventana VistaDetalle para presentarla
            if let vistaDetalle = segue.destination as? ViewControllerDetalle {
                //asignar al NSManagedObject de detalle el objeto seleccionado en la celda, para tener todos los datos de él.
                vistaDetalle.existePersona = selectItem
                }
            
            }
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView?, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        do {
        
            if editingStyle == UITableViewCell.EditingStyle.delete {
                
                if let tableV = tableView {
                    
                    managedObjectContext?.delete(searchResults[indexPath.row] as NSManagedObject)
                
                    searchResults.remove(at: indexPath.row)
                
                    tableV.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)

                }
                
                
                
                
            
                do {
                    try managedObjectContext?.save()
                
                } catch let error as NSError
                {
                    NSLog("Unresolved error \(error), \(error.userInfo)")
                    abort()
                }
            }
        }
    }

}
