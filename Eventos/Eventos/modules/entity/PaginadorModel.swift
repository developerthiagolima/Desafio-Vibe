//
//  PaginadorModel.swift
//  Eventos
//
//  Created by Thiago Lima on 10/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import Foundation
import Tailor

struct PaginadorModel: Mappable {
    let pagina: Int
    let totalPaginas: Int
    let registrosPorPagina: Int
    let TotalRegistros: Int
    var lista: NSMutableArray?
}

extension PaginadorModel {
    init(_ map: [String : Any]) {
        self.init(pagina: map.property("Pagina")!,
                  totalPaginas: map.property("TotalPaginas")!,
                  registrosPorPagina: map.property("RegistrosPorPagina")!,
                  TotalRegistros: map.property("TotalRegistros")!,
                  lista: NSMutableArray())
    }
}
