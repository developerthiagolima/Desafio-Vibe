//
//  Evento.swift
//  Eventos
//
//  Created by Thiago Lima on 06/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit
import Tailor

struct EventoModel: Mappable {
    let id: Int
    let nome: String
    let imagem: UIImage?
    let clienteImagem: UIImage?
    let inicio: Date
    let local: String
}

extension EventoModel {
    init(id: Int, nome: String, inicio: Date, local: String) {
        self.init(id: id, nome: nome, imagem: nil, clienteImagem: nil, inicio: inicio, local: local)
    }
    
    init(_ map: [String : Any]) {
        self.init(id: map.property("Id")!,
                  nome: map.property("Nome")!,
                  imagem: map.transform("Imagem", transformer: { (value: String) -> UIImage? in
                    return value.tagBase64ToImage()
                  }),
                  clienteImagem: map.transform("ClienteImagem", transformer: { (value: String) -> UIImage? in
                    return value.tagBase64ToImage()
                  }),
                  inicio: map.transform("Inicio", transformer: { (value: String) -> Date in
                    let df = DateFormatter()
                    df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                    return df.date(from: value)!
                  })!,
                  local: map.property("Local")!)
    }
    
}
