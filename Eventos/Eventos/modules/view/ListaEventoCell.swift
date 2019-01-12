//
//  ListaEventoTableViewCell.swift
//  Eventos
//
//  Created by Thiago Lima on 07/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit

class ListaEventoCell: UITableViewCell {

    @IBOutlet var vw_background: UIView!
    @IBOutlet var vw_view: UIView!
    @IBOutlet var nome: UILabel!
    @IBOutlet var local: UILabel!
    @IBOutlet var imagem: UIImageView!
    @IBOutlet var imagemCliente: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configurarViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configurarViews(){
        if let _ = vw_view {
            vw_view.layer.cornerRadius = 5
            vw_background.layer.cornerRadius = 5
            vw_background.layer.shadowOffset = CGSize(width: 1, height: 1)
            vw_background.layer.shadowOpacity = 0.7
            vw_background.layer.shadowRadius = 5
            vw_background.layer.shadowColor = UIColor.darkGray.cgColor
        }
    }

}
