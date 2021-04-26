//
//  ConfirmacaoPagamentoViewController.swift
//  Alura Viagens
//
//  Created by Victor Uriarte on 26/04/21.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelHotelPacoteViagem: UILabel!
    @IBOutlet weak var labelDataPacoteViagem: UILabel!
    @IBOutlet weak var labelQuantidadePessoas: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var botaoVoltarHome: UIButton!
    
    var pacoteComprado: PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pacote = pacoteComprado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo.uppercased()
            self.labelHotelPacoteViagem.text = pacote.nomeDoHotel
            self.labelDataPacoteViagem.text = pacote.dataViagem
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            
            self.imagemPacoteViagem.layer.cornerRadius = 10
            self.imagemPacoteViagem.layer.masksToBounds = true
            
            self.botaoVoltarHome.layer.cornerRadius = 8
        }
    }
    
    
    @IBAction func botaoVoltarHome(_ sender: UIButton) {
        if let navigation = self.navigationController {
            navigation.popToRootViewController(animated: true)
        }
        
    }
    
    
}
