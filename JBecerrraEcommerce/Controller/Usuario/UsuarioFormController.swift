//
//  UsuarioFormController.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 05/01/23.
//

import UIKit
import iOSDropDown

class UsuarioFormController: UIViewController {

    @IBOutlet weak var SemestreDropDown: DropDown!
    
    let semestreViewModel = SemestreViewModel()
    var idSemestre : Int? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        SemestreDropDown.optionArray = [String]()
        SemestreDropDown.optionIds = [Int]()
        LoadData()

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func LoadData(){
        let result = semestreViewModel.GetAll()
        if result.Correct{
            for semestre in result.Objects as! [Semestre]{
                SemestreDropDown.optionArray.append(semestre.Nombre)
                SemestreDropDown.optionIds?.append(semestre.IdSemestre)
            }
        }
    }
}
