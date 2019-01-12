//
//  EventoInteractor.swift
//  Eventos
//
//  Created by Thiago Lima on 06/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import Foundation
import Alamofire

class EventoInteractor: EventoInterectorProtocol {

    var presenter: EventoPresenterProtocol?;
    
    func listarEventosAtivos(_ idCliente: Int) {
        if verificaInternet() {
            Alamofire.request(Endpoints.Evento.AtivosDoCliente.url + String(idCliente)).validate(contentType: ["application/json"]).responseJSON { response in
                switch response.result {
                case .success(let json):
                    let retorno = json as! NSArray
                    let listaEvento = NSMutableArray()
                    for i in 0 ..< retorno.count {
                        let evento = EventoModel(retorno.object(at: i) as! [String : Any])
                        listaEvento.add(evento)
                    }
                    self.presenter?.mostrarEventosAtivos(eventos: listaEvento)
                case .failure( _):
                    self.presenter?.mostrarEventosFailed("Problema ao se conectar com o servidor.")
                }
            }
        } else {
            self.presenter?.mostrarEventosFailed("Sem conexão com a internet.")
        }
    }
    
}
