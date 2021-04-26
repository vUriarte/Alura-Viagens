//
//  PacoteViagemCollectionViewCell.swift
//  Alura Viagens
//
//  Created by Victor Uriarte on 22/04/21.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    func configuraCelula(pacoteViagem: PacoteViagem) {
        labelTitulo.text = pacoteViagem.viagem.titulo
        labelQuantidadeDias.text = Int(pacoteViagem.viagem.quantidadeDeDias) == 1 ? "1 dia" : "\(pacoteViagem.viagem.quantidadeDeDias) dias"
        labelPreco.text = "R$ \(pacoteViagem.viagem.preco)"
        imagemViagem.image =  UIImage(named: pacoteViagem.viagem.caminhoDaImagem)
        
        layer.cornerRadius = 5
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
    }
}
