//
//  ViewController.swift
//  SecondMarathonTask
//
//  Created by Rishat Zakirov on 05.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var isAnimating = false
    var firstlBackgroundColor: UIColor?
    var secondBackgroundColor: UIColor?
    var thirdBackgroundColor: UIColor?
    
    var firstButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.title = "First button"
        config.titleAlignment = .center
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        config.image = UIImage(systemName: "arrow.right.circle.fill")
        config.imagePlacement = .trailing
        config.imagePadding = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = config
        button.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        button.addTarget(self, action: #selector(buttonReleased), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        
        return button
    }()
    
    var secondButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.title = "Second Medium button"
        config.titleAlignment = .center
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        config.image = UIImage(systemName: "arrow.right.circle.fill")
        config.imagePlacement = .trailing
        config.imagePadding = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = config
        button.addTarget(self, action: #selector(secondButtonPressed), for: .touchDown)
        button.addTarget(self, action: #selector(secondButtonReleased), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        
        return button
    }()
    
    var thirdButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.title = "Third"
        config.titleAlignment = .center
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        config.image = UIImage(systemName: "arrow.right.circle.fill")
        config.imagePlacement = .trailing
        config.imagePadding = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = config
        button.addTarget(self, action: #selector(thirdButtonPressed), for: .touchDown)
        button.addTarget(self, action: #selector(thirdButtonReleased), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    

    @objc func buttonPressed() {
         UIView.animate(withDuration: 0.1,
                        delay: 0,
                        options: [.allowUserInteraction],
                        animations: {
                            self.firstButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                        })
     }


     @objc func buttonReleased() {
         UIView.animate(withDuration: 0.1, animations: {
             self.firstButton.transform = .identity
         })
     }
    
    @objc func secondButtonPressed() {
         UIView.animate(withDuration: 0.1,
                        delay: 0,
                        options: [.allowUserInteraction],
                        animations: {
                            self.secondButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                        })
     }

     // Метод, вызываемый при отпускании кнопки
     @objc func secondButtonReleased() {
         UIView.animate(withDuration: 0.1, animations: {
             self.secondButton.transform = .identity
         })
     }
    
    @objc func thirdButtonPressed() {
         UIView.animate(withDuration: 0.1,
                        delay: 0,
                        options: [.allowUserInteraction],
                        animations: {
                            self.thirdButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                        })
     }

     // Метод, вызываемый при отпускании кнопки
     @objc func thirdButtonReleased() {
         UIView.animate(withDuration: 0.1, animations: {
             self.thirdButton.transform = .identity
         })
         
         let vc = AnotherViewController()
//         view.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
         firstlBackgroundColor = firstButton.backgroundColor
         secondBackgroundColor = secondButton.backgroundColor
         thirdBackgroundColor = thirdButton.backgroundColor
         
         firstButton.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
         secondButton.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
         thirdButton.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
         
         firstButton.layer.cornerRadius = 7
         secondButton.layer.cornerRadius = 7
         thirdButton.layer.cornerRadius = 7
         
         
         vc.onDismiss = { [weak self] in
             self?.firstButton.backgroundColor = self?.firstlBackgroundColor
             self?.secondButton.backgroundColor = self?.secondBackgroundColor
             self?.thirdButton.backgroundColor = self?.thirdBackgroundColor
         }
         
         present(vc, animated: true)
     }
       

}

extension ViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
    }
    
    func setupConstraints() {
        firstButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        secondButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10).isActive = true
        
        thirdButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 10).isActive = true
    }
}
