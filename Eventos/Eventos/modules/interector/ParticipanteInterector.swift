//
//  ParticipanteInterector.swift
//  Eventos
//
//  Created by Thiago Lima on 10/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import Foundation
import Alamofire

class ParticipanteInterector: ParticipanteInterectorProtocol {
    var presenter: ParticipantePresenterProtocol?
    
    func BuscarParticipante(_ idParticipante: Int) {
        if verificaInternet() {
            Alamofire.request(Endpoints.Participante.ObterParticipante.url + String(idParticipante)).validate(contentType: ["application/json"]).responseJSON { response in
                switch response.result {
                case .success(let json):
                    let retorno = json as! NSDictionary
                    let participante = ParticipanteModel(retorno as! [String : Any])
                    self.presenter?.mostrarParticipante(participante: participante)
                case .failure( _):
                    self.presenter?.mostrarParticipanteFailed("Problema ao se conectar com o servidor.")
                }
            }
        } else {
            self.presenter?.mostrarParticipanteFailed("Sem conexão com a internet.")
        }
    }
}
