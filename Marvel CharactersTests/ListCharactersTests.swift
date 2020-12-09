//
//  ListCharactersTests.swift
//  Marvel CharactersTests
//  Created by Alfredo Rebolloso
//

import XCTest

class ListCharactersTests: XCTestCase {
    //var presenter : PresenterToViewHomeProtocol!
    var presenter: HomePresenter = HomePresenter()
    var interactor: PresenterToInteractorHomeProtocol?

    override func setUp() {
        super.setUp()
        presenter.view = MockHomeView()
        interactor = MockHomeInteractor()
        interactor?.presenter = presenter
        presenter.interactor = interactor
    }
    
    func testGetListCharacters() {
        presenter.getCharacters()
        
        guard let interactor = presenter.interactor as? MockHomeInteractor else {
            XCTFail("Interactor should exist")
            return
        }
        XCTAssertTrue(interactor.fetchGetListCharactersCalled, "fetchGetListCharacters should be Called")
    }
    
    func testGetListCharactersError() {
        let error = "This is a test Error"
        presenter.getCharactersFetchedFailed(error: error)
        guard let view = presenter.view as? MockHomeView else {
            XCTFail("view should exist")
            return
        }
        XCTAssertFalse(view.getListCharactersErrorCalled, "getListCharactersErrorCalled should be called")
        
        guard let err = view.err else {
            XCTFail("err should exist")
            return
        }
        XCTAssertEqual(err, "This is a test Error")
    }

}
