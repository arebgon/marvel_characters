//
//  HomeInteractor.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation
import Alamofire

class HomeInteractor: PresenterToInteractorHomeProtocol{
    var presenter: InteractorToPresenterHomeProtocol?
        
    //Get Marvel Characters
    func fetchGetCharacters() {
        //Interactor receives the request from Presenter to load data from the server
        let url : String = ServiceContants.shared.url_base + ServiceContants.shared.version_api + ServiceContants.shared.url_api_getCharacters
        
        let ts = 1
        let hash = ("\(ts)\(ServiceContants.shared.marvel_private_key)\(ServiceContants.shared.marvel_public_key)").md5()
        let params: Parameters = ["apikey": ServiceContants.shared.marvel_public_key, "ts": ts, "hash": hash]
        
        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil).responseJSON { (response) in switch response.result {
            case .success( _):
                let statusCode = response.response?.statusCode
                
                switch statusCode {
                case 200:
                    // FIXME: Return Sucess (200) OK
                    let responseObj = decode(data: response.data, modelType: ResponseCharactersDTO.self)
                    self.presenter?.getCharactersFetched(result: responseObj)
                    break
                case 401:
                    // FIXME: Return Sucess (401) InvalidCredentials
                    self.presenter?.getCharactersFetchedFailed(error: "error_invalid_credentials".localized)
                    break
                case 409:
                    // FIXME: Return Sucess (409) Multiple Reason
                    let responseObj = decode(data: response.data, modelType: ErrorDTO.self)
                    if let msg = responseObj.status {
                        self.presenter?.getCharactersFetchedFailed(error: msg)
                    }else {
                        self.presenter?.getCharactersFetchedFailed(error: "error_generic_conection".localized)
                    }
                    break
                default:
                    // FIXME: Return Sucess (Default) Error Generic
                    self.presenter?.getCharactersFetchedFailed(error: "error_generic_conection".localized)
                    break
                }
                
            case .failure( _):
                // FIXME: Return Failure Error Generic
                self.presenter?.getCharactersFetchedFailed(error: "error_generic_conection".localized)
            }
        }

    }
}
