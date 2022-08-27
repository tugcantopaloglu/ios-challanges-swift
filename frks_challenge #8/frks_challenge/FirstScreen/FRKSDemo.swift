//
//  FRKSDemoStoryboard.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 18.08.2022.
//

import UIKit

class FRKSDemo: UIViewController {
    @IBOutlet weak var stackView:UIStackView!
    
    private lazy var colors:[UIColor] = {
        return [.purple, .cyan, .white, .blue, .brown, .black, .gray, .green, .yellow, .magenta, .orange]
    }()
    
    private var timer:Timer?
    private var counter:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(generateView), userInfo: [:], repeats: true)
    }
    
    @objc
    func generateView(){
        counter += 1
        if counter == 10 {
            timer?.invalidate()
        }
        
        let randomView = generateRandomView()
        stackView.addArrangedSubview(randomView)
        randomView.translatesAutoresizingMaskIntoConstraints = false
        randomView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    
    
    private func generateRandomView() -> UIView{
        let randomView = UIView(frame: .zero)
        randomView.backgroundColor = colors[Int.random(in: 0..<colors.count)]
        return randomView
    }
}
