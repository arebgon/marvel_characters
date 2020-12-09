//
//  MockHomeInteractor.swift
//  Marvel CharactersTests
//  Created by Alfredo Rebolloso
//

import XCTest
@testable import Marvel_Characters

class MockHomeInteractor: PresenterToInteractorHomeProtocol {
    var presenter: InteractorToPresenterHomeProtocol?

    var fetchGetListCharactersCalled = false
    
    func fetchGetCharacters() {
        fetchGetListCharactersCalled = true
    }
}
