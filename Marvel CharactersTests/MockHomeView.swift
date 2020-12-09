//
//  MockHomeView.swift
//  Marvel CharactersTests
//  Created by Alfredo Rebolloso
//

@testable import Marvel_Characters

class MockHomeView: PresenterToViewHomeProtocol {
    var res : ResponseCharactersDTO?
    var err : String?
    var getListCharactersSuccessCalled = false
    var getListCharactersErrorCalled = false
    
    func getCharactersSuccess(result: ResponseCharactersDTO) {
        getListCharactersSuccessCalled = true
        res = result
    }
    
    func getCharactersError(error: String) {
        getListCharactersErrorCalled = false
        err = error
    }
    
}
