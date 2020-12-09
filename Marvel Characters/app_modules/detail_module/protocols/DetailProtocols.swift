//
//  DetailProtocols.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation
import UIKit

//MARK: View Output (Presenter -> View)
protocol PresenterToViewDetailProtocol: class {
    func getCharacterByIdSuccess(result: ResponseCharactersDTO)
    func getCharacterByIdError(error: String)
}

//MARK: View Input (View -> Presenter)
protocol ViewToPresenterDetailProtocol: class {
    var view: PresenterToViewDetailProtocol? {get set}
    var interactor: PresenterToInteractorDetailProtocol? {get set}
    var router: PresenterToRouterDetailProtocol? {get set}
    func getCharacterById(characterId: Int)
}

//MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDetailProtocol: class {
    func getCharacterByIdFetched(result: ResponseCharactersDTO)
    func getCharacterByIdFetchedFailed(error: String)
}

//MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDetailProtocol: class {
    var presenter: InteractorToPresenterDetailProtocol? {get set}
    func fetchGetCharacterById(characterId: Int)
}

//MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterDetailProtocol: class {
    static func createModule() -> DetailViewController
}
