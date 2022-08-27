//
//  ShowMessageViewController.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 24.08.2022.
//

import UIKit

protocol ShowMessageDelegate {
    func approveTapped()
    func cancelTapped()
}

extension ShowMessageViewController {
    
    // Buradaki constructr'da hem delegate yapısı hem de completion block yapısına örnek verilmiştir.
    public static func showMessage(message:String, target:UIViewController, actionTapped:@escaping ((ShowMessageAction)->())) {
        if let controller = UIStoryboard.init(name: "ShowMessageViewController", bundle: .main).instantiateInitialViewController() as? ShowMessageViewController {
            controller.message = message
            controller.delegate = target as? ShowMessageDelegate
            controller.actionTapped = actionTapped
            target.present(controller, animated: true, completion: nil)
        }
    }
}


class ShowMessageViewController: UIViewController {
    
    enum ShowMessageAction {
        case approve
        case cancel
    }
    
    @IBOutlet weak var messageLabel: UILabel!
    
    fileprivate var actionTapped:((ShowMessageAction)->())?
    
    fileprivate var delegate:ShowMessageDelegate?
    
    fileprivate var message:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    private func setupUI(){
        messageLabel.text = message
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        delegate?.cancelTapped()
        actionTapped?(.cancel)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        delegate?.approveTapped()
        actionTapped?(.approve)
        self.dismiss(animated: true, completion: nil)
    }
}
