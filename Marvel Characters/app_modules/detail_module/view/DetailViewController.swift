//
//  DetailViewController.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import UIKit
import RSLoadingView
import SPAlert

class DetailViewController: UIViewController {

    //MARK: Properties
    var presenter: ViewToPresenterDetailProtocol?
    
    //MARK: IBOutlets
    @IBOutlet weak var uiButtonBack: UIButton!
    @IBOutlet weak var uiTitleLabel: UILabel!
    @IBOutlet weak var uiScrollView: UIScrollView!
    @IBOutlet weak var uiImage: UIImageView!
    @IBOutlet weak var uiNameStackView: UIStackView!
    @IBOutlet weak var uiNameDefLabel: UILabel!
    @IBOutlet weak var uiNameLabel: UILabel!
    @IBOutlet weak var uiDescriptionStackView: UIStackView!
    @IBOutlet weak var uiDescriptionDefLabel: UILabel!
    @IBOutlet weak var uiDescriptionLabel: UILabel!
    @IBOutlet weak var uiTableView: UITableView!
    @IBOutlet weak var uiHeightContraintTable: NSLayoutConstraint!
    @IBOutlet weak var uiHeightContraintView: NSLayoutConstraint!
    @IBOutlet weak var uiBottomConstraintImageStackView: NSLayoutConstraint!
    @IBOutlet weak var uiBottomConstraintNameStackView: NSLayoutConstraint!
    @IBOutlet weak var uiBottomConstraintDescripStackView: NSLayoutConstraint!

    //MARK: Character Detail
    var result : CharacterDTO = CharacterDTO()
    var categoryList : [CategoryListDTO] = []
    
    //MARK: Other variables
    let loadingView = RSLoadingView()
    var characterId : Int = 0
    let spaceBottomScroll : CGFloat = 20.0

    //MARK: View Load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Localizabled Strings
        self.localizedString()
        
        //Get Marvel Character By Id
        self.loadingView.show(on: view)
        self.presenter?.getCharacterById(characterId: characterId)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //Remove observer contentSize (Table)
        self.uiTableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    //MARK: - Localized String
    func localizedString(){
        self.uiTitleLabel.text = "detail_module_title_label".localized
        self.uiNameDefLabel.text = "detail_module_name_label".localized
        self.uiDescriptionDefLabel.text = "detail_module_description_label".localized
    }
    
    //MARK: - IBActions
    //Back screen
    @IBAction func btn_back_screen(_ sender: Any) {
        let homeVC = HomeRouter.createModule()
        homeVC.modalPresentationStyle = .overFullScreen
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.fade
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        self.view.window!.layer.add(transition, forKey: kCATransition)
        self.present(homeVC, animated: false, completion: nil)
    }
    
    //MARK: - Configure Data
    //Set Elements
    func configureData(){
        self.configureImage()
        self.configureNameAndDescription()
    }
    
    //Set element Table (Comics, Series, Stories, Events)
    func configureTable(){
        //CategoryList
        if ((self.result.comics?.items!.count)! > 0) {
            var category : CategoryListDTO = CategoryListDTO()
            category.name = "detail_module_category_comics".localized
            category.items = self.result.comics?.items
            self.categoryList.append(category)
        }
        
        if ((self.result.series?.items!.count)! > 0) {
            var category : CategoryListDTO = CategoryListDTO()
            category.name = "detail_module_category_series".localized
            category.items = self.result.series?.items
            self.categoryList.append(category)
        }
        
        if ((self.result.series?.items!.count)! > 0) {
            var category : CategoryListDTO = CategoryListDTO()
            category.name = "detail_module_category_stories".localized
            category.items = self.result.stories?.items
            self.categoryList.append(category)
        }
        
        if ((self.result.events?.items!.count)! > 0) {
            var category : CategoryListDTO = CategoryListDTO()
            category.name = "detail_module_category_events".localized
            category.items = self.result.events?.items
            self.categoryList.append(category)
        }
    }
    
    //Set Image Detail
    func configureImage(){
        let imageURL : String = (self.result.thumbnail?.path)! + "." + (self.result.thumbnail?.extension)!
        let task = URLSession.shared.dataTask(with: NSURL(string: imageURL)! as URL) { data, response, error in
            guard let data = data, error == nil else {
                self.uiImage.image = UIImage(named: "icon_default")
                return
            }
            let image = UIImage(data: data as Data)
            if image != nil {
                DispatchQueue.main.async {
                    self.uiImage.image = image
                }
            }
        }
        task.resume()
    }
    
    //Set Name and Description Detail
    func configureNameAndDescription(){
        if !self.result.name!.isEmpty{
            self.uiNameLabel.text = self.result.name
        }
        if !self.result.description!.isEmpty{
            self.uiDescriptionLabel.text = self.result.description
        }
    }
    
    //MARK: Observer Constraint
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if object is UITableView {
                if let newvalue = change?[.newKey] {
                    let newSize = newvalue as! CGSize
                    
                    //Height Constraint Table
                    self.uiHeightContraintTable.constant = newSize.height

                    let heightScroll : CGFloat = (self.uiImage.frame.origin.y + self.uiImage.frame.size.height + self.uiNameStackView.frame.size.height + self.uiDescriptionStackView.frame.size.height + self.uiHeightContraintTable.constant)
                    
                    //Height Constraint View
                    self.uiHeightContraintView.constant = heightScroll + self.uiBottomConstraintImageStackView.constant + self.uiBottomConstraintNameStackView.constant + self.uiBottomConstraintDescripStackView.constant + self.spaceBottomScroll
                }
            }
        }
    }
    
}

//MARK: Extension UITableView
extension DetailViewController:UITableViewDelegate, UITableViewDataSource{
    
    //View Header Section
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))

        let label = UILabel()
        label.frame = CGRect.init(x: 10, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = self.categoryList[section].name
        label.textColor = UIColor.white
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        headerView.backgroundColor = #colorLiteral(red: 0.3988855779, green: 0.7974254489, blue: 0.7869567275, alpha: 1)
        headerView.addSubview(label)

        return headerView
    }
    
    //Height Section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    //Number sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.categoryList.count
    }
    
    //Number rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryList[section].items!.count
    }
    
    //Height Row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //Configure Row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCategoryIdentifier", for: indexPath) as! CategoryTableViewCell
        
        //Get element by Section and Row
        let item : ItemDTO = self.categoryList[indexPath.section].items![indexPath.row]
        
        //Set elements
        cell.ui_name_label.text = item.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailRouter.createModule()
        detailVC.modalPresentationStyle = .overFullScreen
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.fade
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        self.view.window!.layer.add(transition, forKey: kCATransition)
        self.present(detailVC, animated: false, completion: nil)
    }
}


//MARK: - Extension PresenterToViewDetailProtocol
extension DetailViewController: PresenterToViewDetailProtocol{
    func getCharacterByIdSuccess(result: ResponseCharactersDTO) {
        // FIXME: Return Marvel Character
        self.loadingView.hide()
        self.result = result.data.results![0]
        self.configureData()
        self.configureTable()
        self.uiTableView.reloadData()
        self.uiTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    func getCharacterByIdError(error: String) {
        // FIXME: Returns incorrect values
        self.loadingView.hide()
        SPAlert.present(message: error)
    }
}
