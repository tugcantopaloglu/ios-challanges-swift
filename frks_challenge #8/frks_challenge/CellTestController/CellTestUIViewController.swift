//
//  CellTestUIViewController.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 26.08.2022.
//

import UIKit

class CellTestUIViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        //Cell Register'ı önemli, eğer cell farklı biz xib dosyasında ise (components yapılmış ise register yapılmazsa crash eder.)
        self.tableView.register(UINib.init(nibName: "LandingCell", bundle: .main), forCellReuseIdentifier: "LandingCell")
        self.tableView.dataSource = self
//        self.tableView.delegate = self
    }
}


//MARK: DataSource
extension CellTestUIViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LandingCell") as? LandingCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = "Cell: \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
}

// Bu değişkeni UI'da da verebiliriz.
//
//extension CellTestUIViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
//}
