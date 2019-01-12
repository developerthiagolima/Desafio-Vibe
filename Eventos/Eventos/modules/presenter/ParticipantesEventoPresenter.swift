//
//  ParticipantesEventoPresenter.swift
//  Eventos
//
//  Created by Thiago Lima on 10/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit

class ParticipantesEventoPresenter: ParticipantesEventoViewToPresenterProtocol{
    
    var view: ParticipantesEventoViewProtocol?
    var interector: ParticipantesEventoInterectorProtocol?
    var router: ParticipantesEventoRouterProtocol?
    
    func carregaListaParticipantesEventos(_ idEvento: Int, paginador: PaginadorModel?) {
        view?.showLoading()
        if paginador != nil {
            interector?.listarParticipantesEvento(idEvento, pagina: paginador!.pagina, registroPorPagina: paginador!.registrosPorPagina)
        }else{
            interector?.listarParticipantesEvento(idEvento, pagina: 1, registroPorPagina: 20)
        }
    }
    
    func carregaProximaListaParticipantesEventos(_ idEvento: Int, paginador: PaginadorModel) {
        interector?.listarProximosParticipantesEvento(idEvento, pagina: paginador.pagina + 1, registroPorPagina: paginador.registrosPorPagina, participantesEvento: paginador)
    }
    
    func prepararListaParticipantesEventoCell(_ tableView: UITableView, evento: EventoModel) -> ListaEventoCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellEvento") as! ListaEventoCell
        cell.nome.text = evento.nome
        cell.imagemCliente.image = evento.clienteImagem
        return cell
    }
    
    func prepararListaParticipantesCell(_ tableView: UITableView, participante: ParticipanteModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellParticipante")
        cell?.textLabel?.text = participante.nome
        if participante.checkIn == nil {
            cell?.accessoryType = .none
        }else{
            cell?.accessoryType = .checkmark
        }
        return cell!
    }
    
    func prepararCarregamentoParticipantesCell(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCarregando")
        return cell!
    }
    
}

extension ParticipantesEventoPresenter: ParticipantesEventoPresenterProtocol {
    
    func mostrarProximosParticipantesEvento(participantesEvento: PaginadorModel) {
        view?.mostrarProximosParticipantesEvento(participantesEvento)
    }
    
    func mostrarParticipantesEvento(participantesEvento: PaginadorModel) {
        view?.hideLoading()
        view?.mostrarParticipantesEvento(participantesEvento)
    }
    
    func mostrarParticipantesEventoFailed(_ mensagem: String) {
        view?.mostrarErro(mensagem)
    }
}
