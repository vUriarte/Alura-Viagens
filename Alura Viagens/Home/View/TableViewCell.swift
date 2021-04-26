//
//  TableViewCell.swift
//  Alura Viagens
//
//  Created by Victor Uriarte on 20/04/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDIas: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var imagemViagem: UIImageView!
    
    func configuraCelula(viagem: Viagem) {
        
        labelTitulo.text = viagem.titulo
        labelQuantidadeDIas.text = Int(viagem.quantidadeDeDias) == 1 ? "1 dia" : "\(viagem.quantidadeDeDias) dias"
        labelPreco.text = "R$ \(viagem.preco)"
        imagemViagem.image =  UIImage(named: viagem.caminhoDaImagem)
        
        imagemViagem.layer.cornerRadius = 8
        imagemViagem.layer.masksToBounds = true

    }
    
}
