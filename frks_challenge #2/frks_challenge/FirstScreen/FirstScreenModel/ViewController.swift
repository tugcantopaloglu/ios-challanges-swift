//
//  ViewController.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 2.08.2022.
//

import UIKit

//MVVM
// Protocol -> VM Model -> Controller



/***

 -UI-
 Label
 Button
 Button Action
 Indicator View
 
 -Model-
 Person
 
 
 -ViewModel-
 Logicler
 Modeller
 İşlemler
 
 emit-changeHandler
 */

class ViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var testLabel: UILabel!
    
    var viewModel:FirstScreenViewModelProtocol! {
        didSet {
            viewModel.changeHandler = { [weak self] change in
                switch change {
                case .loaderShow:
                    self?.activityIndicator.isHidden = false
                    self?.activityIndicator.startAnimating()
                case .loaderDismiss:
                    self?.activityIndicator.stopAnimating()
                case .responseReceived(let response):
                    self?.testLabel.text = response
                case .error(let alert):
                    DispatchQueue.main.async {
                        let alertController = UIAlertController.init(title: "Uyarı", message: alert, preferredStyle: .alert)
                        alertController.addAction(UIAlertAction.init(title: "Kapat", style: .cancel, handler: nil))
                        self?.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        viewModel = FirstScreenViewModel()
        testLabel.text = "..."
        viewModel.sendRequest()
    }
}
