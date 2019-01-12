//
//  ParticipanteViewController.swift
//  Eventos
//
//  Created by Thiago Lima on 10/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit

class ParticipanteViewController: UIViewController {
    
    @IBOutlet var lb_nome: UILabel!
    @IBOutlet var lb_email: UILabel!
    @IBOutlet var lb_checkin: UILabel!
    @IBOutlet var lb_cadastro: UILabel!
    @IBOutlet var img_assinatura: UIImageView!
    var presenter: ParticipanteViewToPresenterProtocol?
    var participante: ParticipanteModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.carregaParticipante(participante!.id)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ParticipanteViewController: ParticipanteViewProtocol {
    
    func mostrarParticipante(_ participante: ParticipanteModel) {
        self.lb_nome.text = participante.nome
        self.lb_email.text = participante.email
        self.lb_checkin.text = participante.checkIn?.toString()
        self.lb_cadastro.text = participante.dataCadastro?.toString()
        self.img_assinatura.image = participante.assinatura
    }
    
    func mostrarErro(_ mensagem: String) {
        self.showAlert(title: "Eventos", message: mensagem)
    }
    
    func showLoading() {
        self.indicator(show: true)
    }
    
    func hideLoading() {
        self.indicator(show: false)
    }
    
}
