//
//  CharactersTableViewCell.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import UIKit

class CharactersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ui_container_view: UIView!
    @IBOutlet weak var ui_character_label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            ui_container_view.backgroundColor = #colorLiteral(red: 0.3988855779, green: 0.7974254489, blue: 0.7869567275, alpha: 1)
            ui_container_view.layer.opacity = 0.5
        } else {
            ui_container_view.backgroundColor = .white
            ui_container_view.layer.opacity = 1
        }
    }
    
}
