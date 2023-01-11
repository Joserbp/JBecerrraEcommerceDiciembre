//
//  UsuarioFormController.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 05/01/23.
//

import UIKit
import iOSDropDown

class UsuarioFormController: UIViewController {
    
    @IBOutlet weak var GrupoDropDown: DropDown!
    @IBOutlet weak var PlantelDropDown: DropDown!
    
    let plantelViewModel = PlantelViewModel()
    let grupoViewModel = GrupoViewModel()
    var IdGrupo: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PlantelDropDown.optionArray = [String]()
        PlantelDropDown.optionIds = [Int]()
        GrupoDropDown.optionArray = [String]()
        GrupoDropDown.optionIds = [Int]()
        LoadData()
        PlantelDropDown.didSelect { selectedText, index, id in
            self.LoadDataGrupos(id)
        }
        GrupoDropDown.didSelect { selectedText, index, id in
            self.IdGrupo = id
        }
        
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
        let result = plantelViewModel.GetAll()
        if result.Correct{
            for plantel in result.Objects as! [Plantel]{
                PlantelDropDown.optionArray.append(plantel.Nombre)
                PlantelDropDown.optionIds?.append(plantel.IdPlantel)
            }
        }
    }
    func LoadDataGrupos(_ IdPlantel : Int){
        let result = grupoViewModel.GetByIdPlantel(IdPlantel)
        if result.Correct{
            GrupoDropDown.optionArray = [String]()
            GrupoDropDown.optionIds = [Int]()
            for grupo in result.Objects as! [Grupo]{
                GrupoDropDown.optionArray.append(grupo.Nombre)
                GrupoDropDown.optionIds?.append(grupo.IdGrupo)
            }
        }
    }
}
