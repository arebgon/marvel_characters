//
//  MockDetailView.swift
//  Marvel CharactersTests
//  Created by Alfredo Rebolloso
//

@testable import Marvel_Characters

class MockDetailView: PresenterToViewDetailProtocol {
    var res : ResponseCharactersDTO?
    var err : String?
    var getCharacterDetailSuccessCalled = false
    var getCharacterDetailErrorCalled = false
    
    func getCharacterByIdSuccess(result: ResponseCharactersDTO) {
        getCharacterDetailSuccessCalled = true
        res = result
    }
    
    func getCharacterByIdError(error: String) {
        getCharacterDetailErrorCalled = false
        err = error
    }
    
}

