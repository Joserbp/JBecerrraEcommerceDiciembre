//
//  AlumnoTableViewCell.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 29/12/22.
//

import UIKit
import SwipeCellKit

class AlumnoTableViewCell: SwipeTableViewCell {

    
    @IBOutlet weak var Nombrelbl: UILabel!
    
    @IBOutlet weak var ApellidoPaternoField: UILabel!
    
    @IBOutlet weak var ApellidoMaternoField: UILabel!
    
    @IBOutlet weak var ImageUser: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
