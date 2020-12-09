//
//  HomeRouter.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation
import UIKit

class HomeRouter: PresenterToRouterHomeProtocol {
    
    //MARK: Static methods
    class func createModule() -> HomeViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "HomeIdentifierVC") as? HomeViewController
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
        let interactor: PresenterToInteractorHomeProtocol = HomeInteractor()
        let router: PresenterToRouterHomeProtocol = HomeRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view!
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}

