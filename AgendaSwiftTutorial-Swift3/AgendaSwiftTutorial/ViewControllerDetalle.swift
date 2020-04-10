//
//  ViewControllerDetalle.swift
//  AgendaSwiftTutorial
//
//  Created by Jaime Pantoja Diaz on 1/10/16.
//
//

import UIKit
import CoreData

class ViewControllerDetalle: UIViewController {
    
    //MARK: - Propiedades

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellidos: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    @IBOutlet weak var txtDireccion: UITextField!
    @IBOutlet weak var txtCodPostal: UITextField!
    @IBOutlet weak var txtCiuad: UITextField!
    
    //Objecto que incluirá la persona y nos servirá para comprobar la existencia de la persona
    var existePersona: NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if existePersona != nil {
            //asignar valor a las cajas de texto desde el NSManagedObject
            self.txtNombre.text = existePersona.value(forKey: "nombre") as! String?
            self.txtApellidos.text = existePersona.value(forKey: "apellidos") as! String?
            self.txtDireccion.text = existePersona.value(forKey: "direccion") as! String?
            self.txtEdad.text = existePersona.value(forKey: "edad") as! String?
            self.txtTelefono.text = existePersona.value(forKey: "telefono") as! String?
            self.txtCodPostal.text = existePersona.value(forKey: "codPostal") as! String?
            self.txtCiuad.text = existePersona.value(forKey: "ciudad") as! String?
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Métodos propios
    
    @IBAction func modificarDatos(_ sender: AnyObject) {
        
        let miDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

        let moc = miDelegate.persistentContainer.viewContext

        if (existePersona != nil){
            existePersona.setValue(txtNombre.text, forKey: "nombre")
            existePersona.setValue(txtApellidos.text, forKey: "apellidos")
            existePersona.setValue(txtTelefono.text, forKey: "telefono")
            existePersona.setValue(txtDireccion.text, forKey: "direccion")
            existePersona.setValue(txtCodPostal.text, forKey: "codPostal")
            existePersona.setValue(txtCiuad.text, forKey: "ciudad")
            existePersona.setValue(txtEdad.text, forKey: "edad")
        }else{
            //Crear una instancia de la clase Persona y asignamos una entidad y un contexto de objeto
            let newPersona = NSEntityDescription.insertNewObject(forEntityName: "Persona", into: moc) as! Persona
            //4. Mapear las propiedades de String con los textField
            newPersona.nombre = txtNombre.text
            newPersona.apellidos = txtApellidos.text
            newPersona.edad = txtEdad.text
            newPersona.telefono = txtTelefono.text
            newPersona.direccion = txtDireccion.text
            newPersona.codPostal = txtCodPostal.text
            newPersona.ciudad = txtCiuad.text
        }
        
        //5. Guardar valores
        miDelegate.saveContext()
        print("saved!")
    
        //volvemos a la vista principal a traves del navigation
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func cancelar(_ sender: AnyObject) {
        //volvemos a la vista principal a traves del navigation
        _ = navigationController?.popToRootViewController(animated: true)
    }

}
