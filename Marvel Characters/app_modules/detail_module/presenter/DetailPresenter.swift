//
//  DetailPresenter.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation
import UIKit

class DetailPresenter: ViewToPresenterDetailProtocol {
    
    //MARK: Properties
    var view: PresenterToViewDetailProtocol?
    var interactor: PresenterToInteractorDetailProtocol?
    var router: PresenterToRouterDetailProtocol?
    
    func getCharacterById(characterId: Int) {
        interactor?.fetchGetCharacterById(characterId: characterId)
    }
    
}
extension DetailPresenter: InteractorToPresenterDetailProtocol {
    func getCharacterByIdFetched(result: ResponseCharactersDTO) {
        //Presenter tells view what to do
        view?.getCharacterByIdSuccess(result: result)
    }
    
    func getCharacterByIdFetchedFailed(error: String) {
        //Presenter tells view what to do
        view?.getCharacterByIdError(error: error)
    }
}
