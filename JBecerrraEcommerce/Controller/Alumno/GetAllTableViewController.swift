//
//  GetAllTableViewController.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 29/12/22.
//

import UIKit
import SwipeCellKit

class GetAllTableViewController: UITableViewController{

    let alumnoViewModel = AlumnoViewModel()
    var alumnos = [Alumno]()
    var idAlumno : Int = 0
    
    override func viewDidLoad() {
        navigationController?.isNavigationBarHidden = false
        super.viewDidLoad()
        
        print("ViewDidLoad")
        tableView.register(UINib(nibName: "AlumnoTableViewCell", bundle: nil), forCellReuseIdentifier: "AlumnoCell")
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UpdateSegues"{
            let alumnoForm = segue.destination as! AlumnoFormController
            alumnoForm.idAlumno = self.idAlumno
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("ViewWillAppear")
        loadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        print("ViewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("ViewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("ViewDidDisappear")
    }
    
    func loadData() {
        let result = alumnoViewModel.GetAll()
        if result.Correct{
            alumnos = result.Objects! as! [Alumno]
            tableView.reloadData()
        }
        else{
            //ALERT
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return alumnos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlumnoCell", for: indexPath) as! AlumnoTableViewCell
        cell.delegate = self
        cell.Nombrelbl.text = alumnos[indexPath.row].Nombre
        cell.ApellidoPaternoField.text = alumnos[indexPath.row].ApellidoPaterno
        cell.ApellidoMaternoField.text = alumnos[indexPath.row].ApellidoMaterno
        if alumnos[indexPath.row].Imagen == ""{
            cell.ImageUser.image = UIImage(named: "User")
        }else{
            let imageData = Data(base64Encoded: alumnos[indexPath.row].Imagen, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
            cell.ImageUser.image = UIImage(data: imageData!)
        }
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension GetAllTableViewController : SwipeTableViewCellDelegate{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
           
            let idAlumno = self.alumnos[indexPath.row].IdAlumno
            print("La Celda es el indice: \(indexPath.row) y el IdAlumno es: \(idAlumno)")
            let result = self.alumnoViewModel.Delete(IdAlumno: idAlumno)
            if result.Correct{
                //UIAlert
            }else{
                //UIAlert
            }
            self.loadData()
        }

        deleteAction.image = UIImage(named: "delete")

        return [deleteAction]
        
        if true{
            
        }else{
            self.performSegue(withIdentifier: "UpdateSegues", sender: self)
        }
        
    }

}
