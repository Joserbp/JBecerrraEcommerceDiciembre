//
//  UsuarioFormController.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 05/01/23.
//

import UIKit

class UsuarioFormController: UIViewController {

    let usuarioViewModel = UsuarioViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        var usuario = Usuario()
        usuario.Nombre = "Jose"
        usuario.ApellidoPaterno = "Becerra"
        usuario.ApellidoMaterno = "Perez"
        
        usuarioViewModel.GetAll()
        
        //usuarioViewModel.Add(usuario: usuario)
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
