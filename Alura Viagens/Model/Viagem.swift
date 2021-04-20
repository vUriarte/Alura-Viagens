//
//  Viagem.swift
//  Alura Viagens
//
//  Created by Victor Uriarte on 20/04/21.
//

import UIKit

class Viagem: NSObject {
    let titulo: String
    let quantidadeDeDias: String
    let preco: String
    let caminhoDaImagem: String
    
    init(titulo: String, quantidadeDeDias: String, preco: String, caminhoDaImagem: String) {
        self.titulo = titulo
        self.quantidadeDeDias = quantidadeDeDias
        self.preco = preco
        self.caminhoDaImagem = caminhoDaImagem
    }
    

}
