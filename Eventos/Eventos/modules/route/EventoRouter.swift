//
//  EventoRouter.swift
//  Eventos
//
//  Created by Thiago Lima on 07/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit

class EventoRouter: EventoRouterProtocol{
    
    var navigationController: UINavigationController?
    
    init() {
    }
    
    init(navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func createModule() -> UINavigationController {
        let navigation = UIStoryboard(name:"Main",bundle: Bundle.main).instantiateViewController(withIdentifier: "mainNavigationController") as? UINavigationController
        
        let view = navigation?.childViewControllers.first as? EventoViewController
        let presenter: EventoViewToPresenterProtocol & EventoPresenterProtocol = EventoPresenter()
        let interactor: EventoInterectorProtocol = EventoInteractor()
        let router: EventoRouterProtocol = EventoRouter(navigation: navigation!)
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interector = interactor
        interactor.presenter = presenter
        
        return navigation!
    }
    
    func listarParticipantesEvento(_ evento: EventoModel){
        self.navigationController?.pushViewController(ParticipantesEventoRouter().createModule(evento, navigation: self.navigationController!), animated: true)
    }
    
}
