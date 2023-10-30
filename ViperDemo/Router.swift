//
//  Router.swift
//  ViperDemo
//
//  Created by Mehmet Gül on 30.10.2023.
//

import Foundation
import UIKit

typealias EntryPoint = UIViewController & AnyView

protocol AnyRouter {
    var entryPoint: EntryPoint? {get}
    static func startExecution() -> AnyRouter
}

class CryptoRouter: AnyRouter {
     
    var entryPoint: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        
        let router = CryptoRouter()
        
        var view : AnyView = CryptoViewController()
        var presenter : AnyPresenter = CryptoPresenter()
        var interactor : AnyInteractor = CryptoInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.entryPoint = view as? EntryPoint
        
        return router
    }
    
}
