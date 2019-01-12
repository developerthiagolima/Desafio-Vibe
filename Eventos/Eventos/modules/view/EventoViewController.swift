//
//  EventoViewController.swift
//  Eventos
//
//  Created by Thiago Lima on 06/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit

class EventoViewController: UIViewController {

    @IBOutlet var tabela: UITableView!
    var presenter: EventoViewToPresenterProtocol?
    var listaEventos: NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.carregaListaEventos();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension EventoViewController: EventoViewProtocol {
    
    func mostrarEventos(_ eventos: NSArray) {
        self.listaEventos = eventos
        self.UI {
            self.tabela.reloadData()
        }
    }
    
    func mostrarErro(_ mensagem: String) {
        self.showAlert(title: "Eventos", message: mensagem)
    }
    
    func showLoading() {
        self.indicator(show: true)
    }
    
    func hideLoading() {
        self.indicator(show: false)
    }
    
}

extension EventoViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaEventos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let evento = listaEventos.object(at: indexPath.row) as! EventoModel
        return (presenter?.prepararListaEventoCell(tableView, evento: evento))!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let evento = listaEventos.object(at: indexPath.row) as! EventoModel
        presenter?.router?.listarParticipantesEvento(evento)
    }
    
}
