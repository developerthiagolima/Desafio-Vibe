//
//  ParticipanteModel.swift
//  Eventos
//
//  Created by Thiago Lima on 10/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit
import Tailor

struct ParticipanteModel: Mappable {
    let id: Int
    let nome: String
    let email: String?
    let checkIn: Date?
    let dataCadastro: Date?
    let assinatura: UIImage?
}

extension ParticipanteModel {
    init(_ map: [String : Any]) {
        self.init(id: map.property("Id")!,
                  nome: map.property("Nome")!,
                  email: map.property("Email"),
                  checkIn: map.transform("CheckIn", transformer: { (value: String) -> Date? in
                    let df = DateFormatter()
                    df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SS"
                    return df.date(from: value)
                  }),
                  dataCadastro: map.transform("DataCadastro", transformer: { (value: String) -> Date? in
                    let df = DateFormatter()
                    df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SS"
                    return df.date(from: value)
                  }),
                  assinatura: map.transform("Assinatura", transformer: { (value: String) -> UIImage? in
                    return value.base64ToImage()
                  }))
    }
}
