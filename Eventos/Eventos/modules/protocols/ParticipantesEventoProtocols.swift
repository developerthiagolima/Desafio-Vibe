//
//  ParticipantesEventoProtocols.swift
//  Eventos
//
//  Created by Thiago Lima on 10/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit

protocol ParticipantesEventoViewProtocol: class{
    func mostrarParticipantesEvento(_ participantesEvento: PaginadorModel)
    func mostrarProximosParticipantesEvento(_ participantesEvento: PaginadorModel)
    func mostrarErro(_ mensagem: String)
    func showLoading()
    func hideLoading()
}

protocol ParticipantesEventoPresenterProtocol: class{
    func mostrarParticipantesEvento(participantesEvento: PaginadorModel)
    func mostrarProximosParticipantesEvento(participantesEvento: PaginadorModel)
    func mostrarParticipantesEventoFailed(_ mensagem: String)
}

protocol ParticipantesEventoInterectorProtocol: class{
    var presenter: ParticipantesEventoPresenterProtocol? {get set}
    func listarParticipantesEvento(_ idEvento: Int, pagina: Int, registroPorPagina: Int)
    func listarProximosParticipantesEvento(_ idEvento: Int, pagina: Int, registroPorPagina: Int, participantesEvento: PaginadorModel)
}

protocol ParticipantesEventoViewToPresenterProtocol: class{
    var view: ParticipantesEventoViewProtocol? {get set}
    var interector: ParticipantesEventoInterectorProtocol? {get set}
    var router: ParticipantesEventoRouterProtocol? {get set}
    func carregaListaParticipantesEventos(_ idEvento: Int, paginador: PaginadorModel?)
    func carregaProximaListaParticipantesEventos(_ idEvento: Int, paginador: PaginadorModel)
    func prepararListaParticipantesEventoCell(_ tableView: UITableView, evento: EventoModel) -> ListaEventoCell
    func prepararListaParticipantesCell(_ tableView: UITableView, participante: ParticipanteModel) -> UITableViewCell
    func prepararCarregamentoParticipantesCell(_ tableView: UITableView) -> UITableViewCell
}

protocol ParticipantesEventoRouterProtocol: class{
    func createModule(_ evento: EventoModel, navigation: UINavigationController) -> UIViewController
    func mostrarParticipante(_ participante: ParticipanteModel)
}
