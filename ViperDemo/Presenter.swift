//
//  Presenter.swift
//  ViperDemo
//
//  Created by Mehmet Gül on 30.10.2023.
//

import Foundation

// Presenter talks to interactor, router, view.

enum NetworkError: Error {
    case NetworkFailed // İnternetle alakalı bir sorun var.
    case ParsingFailed // Veriyi işlemeyle alakalı bir sorun var.
}

protocol AnyPresenter {
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func interactorDidDownloadData(result: Result<[Crypto],Error>)
}

class CryptoPresenter: AnyPresenter {
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadData()
        }
    }
    var view: AnyView?
    
    func interactorDidDownloadData(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            view?.update(with: cryptos)
        case .failure(_):
            view?.update(with: "Daha sonra tekrar deneyiniz...")
        }
    }
}
