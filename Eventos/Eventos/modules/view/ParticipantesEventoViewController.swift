//
//  ParticipantesEventoViewController.swift
//  Eventos
//
//  Created by Thiago Lima on 10/06/2018.
//  Copyright © 2018 Vibe. All rights reserved.
//

import UIKit

class ParticipantesEventoViewController: UIViewController {
    
    @IBOutlet var tabela: UITableView!
    var presenter: ParticipantesEventoViewToPresenterProtocol?
    var evento:EventoModel?
    var paginador:PaginadorModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.carregaListaParticipantesEventos(evento!.id, paginador: paginador)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ParticipantesEventoViewController: ParticipantesEventoViewProtocol {
    
    func mostrarProximosParticipantesEvento(_ participantesEvento: PaginadorModel) {
        self.paginador = participantesEvento
        self.UI {
            self.tabela.reloadData()
        }
    }

    func mostrarParticipantesEvento(_ participantesEvento: PaginadorModel) {
        self.paginador = participantesEvento
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

extension ParticipantesEventoViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let lista = paginador?.lista else { return 0 }
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let lista = paginador?.lista else { return  UITableViewCell() }
        if (indexPath.row + 1 == lista.count) && (paginador!.pagina != paginador!.TotalRegistros) {
            presenter!.carregaProximaListaParticipantesEventos(evento!.id, paginador: paginador!)
            return presenter!.prepararCarregamentoParticipantesCell(tableView)
        }else{
            return presenter!.prepararListaParticipantesCell(tableView, participante: lista.object(at: indexPath.row) as! ParticipanteModel)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.router?.mostrarParticipante(paginador?.lista?.object(at: indexPath.row) as! ParticipanteModel)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 84
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return presenter!.prepararListaParticipantesEventoCell(tableView, evento: evento!)
    }
    
}
