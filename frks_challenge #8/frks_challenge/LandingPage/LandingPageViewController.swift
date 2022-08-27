//
//  LandingPageViewController.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 24.08.2022.
//

import UIKit

class LandingPageViewController: UIViewController {
    
//    -Delegate
//    -Observer
    @IBOutlet weak var tableView: UITableView!
    
    
    private lazy var allScreens:[UIViewController] = {
        var screenList = [UIViewController]()
        
        
        if let watchlistViewController = UIStoryboard.init(name: "WatchlistViewController", bundle: .main).instantiateInitialViewController() as? WatchlistViewController {
            watchlistViewController.viewModel = WatchlistViewModel()
            watchlistViewController.title = "Watchlist View Controller"
            screenList.append(watchlistViewController)
        }
        
        if let main = UIStoryboard.init(name: "Main", bundle: .main).instantiateInitialViewController() as? ViewController {
            main.title = "Main"
            screenList.append(main)
        }
        
        if let firstScreen = UIStoryboard.init(name: "FRKSDemoStoryboard", bundle: .main).instantiateInitialViewController() as? FRKSDemo {
            firstScreen.title = "FRKS Demo Screen"
            screenList.append(firstScreen)
        }
        
        if let cellTest = UIStoryboard.init(name: "CellTestUIViewController", bundle: .main).instantiateViewController(withIdentifier: "CellTestUIViewController") as? CellTestUIViewController {
            screenList.append(cellTest)
        }
        
        return screenList
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    private func setupUI(){
        tableView.register(UINib.init(nibName: "LandingCell", bundle: .main), forCellReuseIdentifier: "LandingCell")
    }
}


extension LandingPageViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allScreens.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LandingCell") as? LandingCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = allScreens[indexPath.row].title
        return cell
    }
}

extension LandingPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(allScreens[indexPath.row], animated: true)
    }
    
}


//extension LandingPageViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    }
//
//}
//
//
//extension LandingPageViewController: UICollectionViewDelegate {
//
//}
