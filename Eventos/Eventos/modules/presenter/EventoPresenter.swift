//
//  EventoPresenter.swift
//  Eventos
//
//  Created by Thiago Lima on 06/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit

class EventoPresenter: EventoViewToPresenterProtocol {

    var view: EventoViewProtocol?
    var interector: EventoInterectorProtocol?
    var router: EventoRouterProtocol?
    
    func carregaListaEventos() {
        view?.showLoading()
        interector?.listarEventosAtivos(-1)
    }
    
    func prepararListaEventoCell(_ tableView: UITableView, evento: EventoModel) -> ListaEventoCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ListaEventoCell
        cell.nome.text = evento.nome
        cell.imagem.image = evento.imagem
        cell.imagemCliente.image = evento.clienteImagem
        cell.local.text = evento.local
        return cell
    }
    
}

extension EventoPresenter: EventoPresenterProtocol {
    
    func mostrarEventosAtivos(eventos: NSArray) {
        view?.hideLoading()
        view?.mostrarEventos(eventos)
    }
    
    func mostrarEventosFailed(_ mensagem: String) {
        view?.mostrarErro(mensagem)
    }
    
}
