//
//  Interactor.swift
//  ViperDemo
//
//  Created by Mehmet Gül on 30.10.2023.
//

import Foundation

// Interactor talks to Presenter.

protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}
    func downloadData()
}

class CryptoInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    func downloadData() {
        
        guard let url = URL(string: "https://github.com/atilsamancioglu/K21-JSONDataSet/blob/master/crypto.json") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                self.presenter?.interactorDidDownloadData(result: .failure(NetworkError.NetworkFailed))
                return
            }
            
            do {
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                self.presenter?.interactorDidDownloadData(result: .success(cryptos))
            } catch {
                self.presenter?.interactorDidDownloadData(result: .failure(NetworkError.ParsingFailed))
            }
            
        }
        task.resume()
    }
}
