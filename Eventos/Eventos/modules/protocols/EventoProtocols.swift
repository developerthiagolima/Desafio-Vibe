//
//  EventoProtocols.swift
//  Eventos
//
//  Created by Thiago Lima on 07/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit

protocol EventoViewProtocol: class{
    func mostrarEventos(_ eventos: NSArray)
    func mostrarErro(_ mensagem: String)
    func showLoading()
    func hideLoading()
}

protocol EventoPresenterProtocol: class{
    func mostrarEventosAtivos(eventos: NSArray)
    func mostrarEventosFailed(_ mensagem: String)
}

protocol EventoInterectorProtocol: class{
    var presenter: EventoPresenterProtocol? {get set}
    func listarEventosAtivos(_ idCliente: Int)
}

protocol EventoViewToPresenterProtocol: class{
    var view: EventoViewProtocol? {get set}
    var interector: EventoInterectorProtocol? {get set}
    var router: EventoRouterProtocol? {get set}
    func carregaListaEventos()
    func prepararListaEventoCell(_ tableView: UITableView, evento: EventoModel) -> ListaEventoCell
}

protocol EventoRouterProtocol: class{
    func createModule() -> UINavigationController
    func listarParticipantesEvento(_ evento: EventoModel)
}
