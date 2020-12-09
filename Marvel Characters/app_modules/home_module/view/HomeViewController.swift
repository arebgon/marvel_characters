//
//  HomeViewController.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import UIKit
import RSLoadingView
import SPAlert

class HomeViewController: UIViewController {

    var presenter: ViewToPresenterHomeProtocol?

    //IBOutlets
    @IBOutlet weak var uiTitleLabel: UILabel!
    @IBOutlet weak var uiTableView: UITableView!
    
    //List Marvel Characters
    var results : [CharacterDTO] = []

    //Others variables
    let loadingView = RSLoadingView()
    
    //MARK: View Load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Localizabled Strings
        self.localizedString()
        
        //Get Marvel Characters
        self.loadingView.show(on: view)
        self.presenter?.getCharacters()
    }
    
    //MARK: - Localized String
    func localizedString(){
        self.uiTitleLabel.text = "home_module_title_label".localized
    }
    
    //MARK: - IBActions
    //Resfresh Screen
    @IBAction func btn_resfresh_screen(_ sender: Any) {
        //Get Marvel Characters
        self.loadingView.show(on: view)
        self.presenter?.getCharacters()
    }
    
}

//MARK: Extension UITableView
extension HomeViewController:UITableViewDelegate, UITableViewDataSource{

    //Number rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    //Height Row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //Configure Row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCharactersIdentifier", for: indexPath) as! CharactersTableViewCell
        
        //Get element by indexPath.row
        let character : CharacterDTO = self.results[indexPath.row]
        
        //Set elements
        cell.ui_character_label.text = character.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Get element by indexPath.row
        let character : CharacterDTO = self.results[indexPath.row]
        let characterId : Int = character.id!
        
        let detailVC = DetailRouter.createModule()
        detailVC.characterId = characterId
        detailVC.modalPresentationStyle = .overFullScreen
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.fade
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        self.view.window!.layer.add(transition, forKey: kCATransition)
        self.present(detailVC, animated: false, completion: nil)
    }

}

//MARK: - Extension PresenterToViewHomeProtocol
extension HomeViewController: PresenterToViewHomeProtocol{
    
    func getCharactersSuccess(result: ResponseCharactersDTO) {
        // FIXME: Return Marvel Characters
        self.loadingView.hide()
        self.results = result.data.results!
        self.uiTableView.reloadData()
    }
    
    func getCharactersError(error: String) {
        // FIXME: Returns incorrect values
        self.loadingView.hide()
        SPAlert.present(message: error)
    }

}
