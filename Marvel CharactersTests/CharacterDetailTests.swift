//
//  CharacterDetailTests.swift
//  Marvel CharactersTests
//  Created by Alfredo Rebolloso
//

import XCTest

class CharacterDetailTests: XCTestCase {
    //var presenter : PresenterToViewHomeProtocol!
    var presenter: DetailPresenter = DetailPresenter()
    var interactor: PresenterToInteractorDetailProtocol?

    override func setUp() {
        super.setUp()
        presenter.view = MockDetailView()
        interactor = MockDetailInteractor()
        interactor?.presenter = presenter
        presenter.interactor = interactor
    }
    
    func testCharacterDetail() {
        presenter.getCharacterById(characterId: 10)
        
        guard let interactor = presenter.interactor as? MockDetailInteractor else {
            XCTFail("Interactor should exist")
            return
        }
        XCTAssertTrue(interactor.fetchGetCharacterDetailCalled, "fetchGetCharacterDetailCalled should be Called")
    }
    
    func testGetListCharactersError() {
        let error = "This is a test Error"
        presenter.getCharacterByIdFetchedFailed(error: error)
        guard let view = presenter.view as? MockDetailView else {
            XCTFail("view should exist")
            return
        }
        XCTAssertFalse(view.getCharacterDetailErrorCalled, "getCharacterDetailErrorCalled should be called")
        
        guard let err = view.err else {
            XCTFail("err should exist")
            return
        }
        XCTAssertEqual(err, "This is a test Error")
    }
    
}
