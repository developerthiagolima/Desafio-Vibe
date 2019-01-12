//
//  ParticipanteProtocols.swift
//  Eventos
//
//  Created by Thiago Lima on 10/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit

protocol ParticipanteViewProtocol: class{
    func mostrarParticipante(_ participante: ParticipanteModel)
    func mostrarErro(_ mensagem: String)
    func showLoading()
    func hideLoading()
}

protocol ParticipantePresenterProtocol: class{
    func mostrarParticipante(participante: ParticipanteModel)
    func mostrarParticipanteFailed(_ mensagem: String)
}

protocol ParticipanteInterectorProtocol: class{
    var presenter: ParticipantePresenterProtocol? {get set}
    func BuscarParticipante(_ idParticipante: Int)
}

protocol ParticipanteViewToPresenterProtocol: class{
    var view: ParticipanteViewProtocol? {get set}
    var interector: ParticipanteInterectorProtocol? {get set}
    var router: ParticipanteRouterProtocol? {get set}
    func carregaParticipante(_ idParticipante: Int)
}

protocol ParticipanteRouterProtocol: class{
    func createModule(_ participante: ParticipanteModel, navigation: UINavigationController) -> UIViewController
}
