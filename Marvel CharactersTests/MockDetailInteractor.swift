//
//  MockDetailInteractor.swift
//  Marvel CharactersTests
//  Created by Alfredo Rebolloso
//

import XCTest
@testable import Marvel_Characters

class MockDetailInteractor: PresenterToInteractorDetailProtocol {
    var presenter: InteractorToPresenterDetailProtocol?
    var chId : Int = 0
    var fetchGetCharacterDetailCalled = false
    
    func fetchGetCharacterById(characterId: Int) {
        fetchGetCharacterDetailCalled = true
        chId = characterId
    }

}
