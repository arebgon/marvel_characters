//
//  DetailRouter.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation
import UIKit

class DetailRouter: PresenterToRouterDetailProtocol {
    
    //MARK: Static methods
    class func createModule() -> DetailViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "DetailIdentifierVC") as? DetailViewController
        let presenter: ViewToPresenterDetailProtocol & InteractorToPresenterDetailProtocol = DetailPresenter()
        let interactor: PresenterToInteractorDetailProtocol = DetailInteractor()
        let router: PresenterToRouterDetailProtocol = DetailRouter()
        
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
