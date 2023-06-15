//
//  ViewController.swift
//  iOS10-HW11-Alexandr-Ivanov
//
//  Created by Александр Иванов on 14.06.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Elements

    private lazy var backgroundImage: UIImageView = {
        let image = UIImage(named: "backgroundImage")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
    }

    // MARK: - Setups

    private func setupHierarchy() {
        view.addSubview(backgroundImage)
    }
}
