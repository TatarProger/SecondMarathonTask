//
//  AnotherViewController.swift
//  SecondMarathonTask
//
//  Created by Rishat Zakirov on 06.11.2024.
//

import UIKit
class AnotherViewController: UIViewController {
    
    var onDismiss: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        // Закрываем контроллер при касании и вызываем замыкание onDismiss
//        dismiss(animated: true) {
//            self.onDismiss?()  // Вызываем замыкание для восстановления цвета
//        }
//    }
    
    deinit {
        onDismiss?()
    }
}
