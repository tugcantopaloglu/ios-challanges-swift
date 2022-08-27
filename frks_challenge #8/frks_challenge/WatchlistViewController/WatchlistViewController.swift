//
//  WatchlistViewController.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 23.08.2022.
//

import UIKit

// - Delegate Pattern

class WatchlistViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var symbolList:[Symbol]?
    
    
    var viewModel:WatchlistViewModelProtocol! {
        didSet {
            viewModel.changeHandler = { change in
                switch change {
                case .dataFetched(let symbolList):
                    self.symbolList = symbolList
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.startSync()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.stopSync()
    }
    
    private func setupUI(){
        
        // Bu işlemi sadece UITableViewCell UI elemanı ayrı bir file'da ya da xib'de ise yapmamız gerekli.
        tableView.register(UINib.init(nibName: "SymbolCell", bundle: .main), forCellReuseIdentifier: "SymbolCell")
        
        // TableView Delegate ve DataSource metodlarının çalışabilmeesi için bu self eşitlemelerini yapmamız gerekiyor.
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension WatchlistViewController: UITableViewDelegate, ShowMessageDelegate {
    func approveTapped() {
        // Seçili olan cell'i silmek olacaktır.
    }
    
    func cancelTapped() {
        // Popup'ın kapanması
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ShowMessageViewController.showMessage(message: "Seçmiş olduğunuz Cell'i silmek istiyor musunuz? \nNumarası: \(indexPath.row)", target: self) { action in
            switch action {
            case .approve:
                print("Approve Tapped")
            case .cancel:
                print("Cancel Tapped")
            }
        }
    }
}


extension WatchlistViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return symbolList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SymbolCell") as! SymbolCell
        guard let symbol = self.symbolList?[indexPath.row] else { return cell }
        cell.createCell(symbol: symbol)
        return cell
    }
}
