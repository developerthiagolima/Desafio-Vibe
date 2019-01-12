//
//  ParticipantePresenter.swift
//  Eventos
//
//  Created by Thiago Lima on 10/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit

class ParticipantePresenter: ParticipanteViewToPresenterProtocol {
    var view: ParticipanteViewProtocol?
    var interector: ParticipanteInterectorProtocol?
    var router: ParticipanteRouterProtocol?
    
    func carregaParticipante(_ idParticipante: Int) {
        view?.showLoading()
        interector?.BuscarParticipante(idParticipante)
    }

}

extension ParticipantePresenter: ParticipantePresenterProtocol {
    
    func mostrarParticipante(participante: ParticipanteModel) {
        view?.hideLoading()
        view?.mostrarParticipante(participante)
    }
    
    func mostrarParticipanteFailed(_ mensagem: String) {
        view?.mostrarErro(mensagem)
    }
    
}
