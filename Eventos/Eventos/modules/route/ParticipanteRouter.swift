//
//  ParticipanteRouter.swift
//  Eventos
//
//  Created by Thiago Lima on 10/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit

class ParticipanteRouter: ParticipanteRouterProtocol {

    var navigationController: UINavigationController?
    
    init() {
    }
    
    init(navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func createModule(_ participante: ParticipanteModel, navigation: UINavigationController) -> UIViewController {
        
        let view = UIStoryboard(name:"Main",bundle: Bundle.main).instantiateViewController(withIdentifier: "participanteViewController") as? ParticipanteViewController
        let presenter: ParticipanteViewToPresenterProtocol & ParticipantePresenterProtocol = ParticipantePresenter()
        let interactor: ParticipanteInterectorProtocol = ParticipanteInterector()
        let router: ParticipanteRouterProtocol = ParticipanteRouter(navigation: navigation)
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interector = interactor
        interactor.presenter = presenter
        
        view?.participante = participante
        
        return view!
    }
    
}
