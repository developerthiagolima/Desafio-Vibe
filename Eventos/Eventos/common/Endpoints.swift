//
//  Endpoint.swift
//  Eventos
//
//  Created by Thiago Lima on 06/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "http://receptivawebapi.azurewebsites.net/api"
    enum ReturnType : Int {
        case success = 1, semInternet = 2, erro = 3
    }
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Evento: Endpoint {
        case AtivosDoCliente
        case ParticipantesDoEvento
        
        public var path: String {
            switch self {
                case .AtivosDoCliente: return "/Evento/EventosAtivosDoCliente?idCliente="
                case .ParticipantesDoEvento: return "/Evento/ParticipantesDoEvento?idEvento="
            }
        }
        public var url: String {
            switch self {
                default: return "\(API.baseUrl)\(path)"
            }
        }
    }
    
    enum Participante: Endpoint {
        case ObterParticipante
        
        public var path: String {
            switch self {
                case .ObterParticipante: return "/Participante/ObterParticipante?idParticipante="
            }
        }
        public var url: String {
            switch self {
                default: return "\(API.baseUrl)\(path)"
            }
        }
    }
    
}
