//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Victor Uriarte on 22/04/21.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var labelContadorPacotes: UILabel!
    @IBOutlet weak var colecaoPacotesViagens: UICollectionView!
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    
    let listaComtodasViagens: Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var listaViagens: Array<PacoteViagem> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaComtodasViagens
        colecaoPacotesViagens.dataSource = self
        colecaoPacotesViagens.delegate = self
        pesquisarViagens.delegate = self
        self.labelContadorPacotes.text = self.atualizaContadorLabel()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        let pacoteAtual = listaViagens[indexPath.item]
        celulaPacote.configuraCelula(pacoteViagem: pacoteAtual)
    
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let larguraCelula = collectionView.bounds.width / 2
        //return CGSize(width: larguraCelula - 15, height: 160)
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-20, height: 160) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaViagens[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "detalhe") as! DetalhesViagensViewController
        controller.pacoteSelecionado = pacote
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaComtodasViagens
            if searchText != "" {
                listaViagens = listaViagens.filter { $0.viagem.titulo.contains(searchText) }
            }
        
        self.labelContadorPacotes.text = self.atualizaContadorLabel()
        colecaoPacotesViagens.reloadData()
        
    }
    
    func atualizaContadorLabel() -> String {
        return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados"
    }
}
