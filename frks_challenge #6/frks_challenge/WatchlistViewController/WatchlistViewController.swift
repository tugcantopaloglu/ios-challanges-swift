//
//  WatchlistViewController.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 23.08.2022.
//

import UIKit

class WatchlistViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var viewModel:WatchlistViewModelProtocol! {
        didSet {
            viewModel.changeHandler = { change in
                switch change {
                case .dataFetched:
                    print("Reload Data!")
                case .showError(let errorMessage):
                    DispatchQueue.main.async {
                        let errorMessageController = UIAlertController.init(title: "Uyarı", message: errorMessage, preferredStyle: .alert)
                        errorMessageController.addAction(UIAlertAction.init(title: "Kapat", style: .default, handler: { action in
                            
                        }))
                        self.present(errorMessageController, animated: true, completion: nil)
                    }
                case .networkOperationEnd:
                    print("Loader Dismiss")
                case .networkOperationStart:
                    print("Loader Show")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        
        // Bu işlemi sadece UITableViewCell UI elemanı ayrı bir file'da ya da xib'de ise yapmamız gerekli.
        tableView.register(UINib.init(nibName: "SymbolCell", bundle: .main), forCellReuseIdentifier: "SymbolCell")
        
        // TableView Delegate ve DataSource metodlarının çalışabilmeesi için bu self eşitlemelerini yapmamız gerekiyor.
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension WatchlistViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Item: \(indexPath.row) Tapped!")
    }
}


extension WatchlistViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SymbolCell") as! SymbolCell
        return cell
    }
}
