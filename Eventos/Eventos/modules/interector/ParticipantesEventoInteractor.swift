//
//  ParticipantesEventoInteractor.swift
//  Eventos
//
//  Created by Thiago Lima on 10/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import Foundation
import Alamofire

class ParticipantesEventoInteractor: ParticipantesEventoInterectorProtocol {
    var presenter: ParticipantesEventoPresenterProtocol?
    
    func listarParticipantesEvento(_ idEvento: Int, pagina: Int = 1, registroPorPagina: Int = 10) {
        if verificaInternet() {
            Alamofire.request(Endpoints.Evento.ParticipantesDoEvento.url + String(idEvento),
                              method: .post,
                              parameters:  ["Pagina":pagina, "RegistrosPorPagina":registroPorPagina],
                              encoding: JSONEncoding.default).responseJSON { response in
                switch response.result {
                case .success(let json):
                    let response = json as! NSDictionary
                    let paginador = PaginadorModel(response.object(forKey: "Paginador") as! [String : Any])
                    let lista = response.object(forKey: "Lista") as! NSArray
                    for i in 0 ..< lista.count {
                        let participante = ParticipanteModel(lista.object(at: i) as! [String : Any])
                        paginador.lista?.add(participante)
                    }
                    self.presenter?.mostrarParticipantesEvento(participantesEvento: paginador)
                case .failure( _):
                    self.presenter?.mostrarParticipantesEventoFailed("Problema ao se conectar com o servidor.")
                }
            }
        } else {
            self.presenter?.mostrarParticipantesEventoFailed("Sem conexão com a internet.")
        }
    }
    
    func listarProximosParticipantesEvento(_ idEvento: Int, pagina: Int, registroPorPagina: Int, participantesEvento: PaginadorModel) {
        if verificaInternet() {
            Alamofire.request(Endpoints.Evento.ParticipantesDoEvento.url + String(idEvento),
                              method: .post,
                              parameters:  ["Pagina":pagina, "RegistrosPorPagina":registroPorPagina],
                              encoding: JSONEncoding.default).responseJSON { response in
                switch response.result {
                case .success(let json):
                    let response = json as! NSDictionary
                    var paginador = PaginadorModel(response.object(forKey: "Paginador") as! [String : Any])
                    paginador.lista = participantesEvento.lista
                    let lista = response.object(forKey: "Lista") as! NSArray
                    for i in 0 ..< lista.count {
                        let participante = ParticipanteModel(lista.object(at: i) as! [String : Any])
                        paginador.lista?.add(participante)
                    }
                    self.presenter?.mostrarParticipantesEvento(participantesEvento: paginador)
                case .failure( _):
                    self.presenter?.mostrarParticipantesEventoFailed("Problema ao se conectar com o servidor.")
                }
            }
        } else {
            self.presenter?.mostrarParticipantesEventoFailed("Sem conexão com a internet.")
        }
    }
    
}
