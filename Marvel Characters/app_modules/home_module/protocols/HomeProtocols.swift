//
//  HomeProtocols.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation
import UIKit

//MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol: class {
    func getCharactersSuccess(result: ResponseCharactersDTO)
    func getCharactersError(error: String)
}

//MARK: View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol: class {
    var view: PresenterToViewHomeProtocol? {get set}
    var interactor: PresenterToInteractorHomeProtocol? {get set}
    var router: PresenterToRouterHomeProtocol? {get set}
    func getCharacters()
}

//MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol: class {
    func getCharactersFetched(result: ResponseCharactersDTO)
    func getCharactersFetchedFailed(error: String)
}

//MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol: class {
    var presenter: InteractorToPresenterHomeProtocol? {get set}
    func fetchGetCharacters()
}

//MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol: class {
    static func createModule() -> HomeViewController
}
