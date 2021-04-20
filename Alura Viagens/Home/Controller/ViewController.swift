//
//  ViewController.swift
//  Alura Viagens
//
//  Created by Victor Uriarte on 20/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    // MARK: - IBOutlets
    
    @IBOutlet weak var viewPacotes: UIView!
    @IBOutlet weak var tabelaViagens: UITableView!
    @IBOutlet weak var viewHoteis: UIView!
    
    // MARK: - Atributos

    let listaViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()

    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaViagens.dataSource = self
        self.tabelaViagens.delegate = self
        self.viewPacotes.layer.cornerRadius = 10
        self.viewHoteis.layer.cornerRadius = 10

    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let viagemAtual = listaViagens[indexPath.row]
        
        cell.labelTitulo.text = viagemAtual.titulo
        cell.labelQuantidadeDIas.text = viagemAtual.quantidadeDeDias + " dias"
        cell.labelPreco.text = viagemAtual.preco
        cell.imagemViagem.image =  UIImage(named: viagemAtual.caminhoDaImagem)
        cell.imagemViagem.layer.cornerRadius = 10
        cell.imagemViagem.layer.masksToBounds = true
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 176
    }
    


}

