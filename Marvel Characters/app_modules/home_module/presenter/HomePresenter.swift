//
//  HomePresenter.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation
import UIKit

class HomePresenter: ViewToPresenterHomeProtocol {
    
    //MARK: Properties
    var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?
    
    func getCharacters() {
        interactor?.fetchGetCharacters()
    }
    
}
extension HomePresenter: InteractorToPresenterHomeProtocol {
    func getCharactersFetched(result: ResponseCharactersDTO) {
        //Presenter tells view what to do
        view?.getCharactersSuccess(result: result)
    }
    
    func getCharactersFetchedFailed(error: String) {
        //Presenter tells view what to do
        view?.getCharactersError(error: error)
    }
}

