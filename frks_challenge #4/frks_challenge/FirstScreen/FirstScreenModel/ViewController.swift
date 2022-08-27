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
    
    @IBOutlet weak var headerLabel: FRKSLabel!
    @IBOutlet weak var testButton: UIButton!
    
    
    
//    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
//    @IBOutlet weak var testLabel: UILabel!
//
//    var viewModel:FirstScreenViewModelProtocol! {
//        didSet {
//            viewModel.changeHandler = { [weak self] change in
//                switch change {
//                case .loaderShow:
//                    self?.activityIndicator.isHidden = false
//                    self?.activityIndicator.startAnimating()
//                case .loaderDismiss:
//                    self?.activityIndicator.stopAnimating()
//                case .responseReceived(let response):
//                    self?.testLabel.text = response
//                case .error(let alert):
//                    DispatchQueue.main.async {
//                        let alertController = UIAlertController.init(title: "Uyarı", message: alert, preferredStyle: .alert)
//                        alertController.addAction(UIAlertAction.init(title: "Kapat", style: .cancel, handler: nil))
//                        self?.present(alertController, animated: true, completion: nil)
//                    }
//                }
//            }
//        }
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    @IBAction func buttonTapped(_ sender: Any) {
//        viewModel = FirstScreenViewModel()
//        testLabel.text = "..."
//        viewModel.sendRequest()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLabel.text = "Merhaba!"
        headerLabel.textColor = .cyan
        headerLabel.textAlignment = .left
        
        
        
        testButton.setTitle("Hi!", for: .normal)
        testButton.setTitleColor(.cyan, for: .normal)
        
        let newButton = UIButton.init(frame: .zero)
        newButton.setTitle("Button from Code", for: .normal)
        newButton.backgroundColor = .purple
        newButton.layer.cornerRadius = 10
        newButton.setTitleColor(.white, for: .normal)
        newButton.addTarget(self, action: #selector(buttonFromCodeTapped(sender:)), for: .touchUpInside)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(newButton)
        
        
        newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        newButton.topAnchor.constraint(equalTo: testButton.bottomAnchor, constant: 10).isActive = true
        newButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        newButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        newButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        
    }
    
    @objc func buttonFromCodeTapped(sender:UIButton) {
        print("Button from Code Tapped!")
    }

    @IBAction func testButtonTapped(_ sender: UIButton) {
        print("Button Tapped: \(sender.currentTitle)")
    }
    
}
