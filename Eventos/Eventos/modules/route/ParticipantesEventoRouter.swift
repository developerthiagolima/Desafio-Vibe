//
//  ParticipantesEventoRouter.swift
//  Eventos
//
//  Created by Thiago Lima on 10/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit

class ParticipantesEventoRouter: ParticipantesEventoRouterProtocol {
    
    var navigationController: UINavigationController?
    
    init() {
    }
    
    init(navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func createModule(_ evento: EventoModel, navigation: UINavigationController) -> UIViewController {

        let view = UIStoryboard(name:"Main",bundle: Bundle.main).instantiateViewController(withIdentifier: "participantesEventoViewController") as? ParticipantesEventoViewController
        let presenter: ParticipantesEventoViewToPresenterProtocol & ParticipantesEventoPresenterProtocol = ParticipantesEventoPresenter()
        let interactor: ParticipantesEventoInterectorProtocol = ParticipantesEventoInteractor()
        let router: ParticipantesEventoRouterProtocol = ParticipantesEventoRouter(navigation: navigation)
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interector = interactor
        interactor.presenter = presenter
        
        view?.evento = evento
        
        return view!
    }
    
    func mostrarParticipante(_ participante: ParticipanteModel) {
        self.navigationController?.pushViewController(ParticipanteRouter().createModule(participante, navigation: self.navigationController!), animated: true)
    }
    
}
