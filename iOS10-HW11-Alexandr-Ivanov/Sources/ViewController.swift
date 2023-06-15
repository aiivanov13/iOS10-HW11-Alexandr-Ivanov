//
//  ViewController.swift
//  iOS10-HW11-Alexandr-Ivanov
//
//  Created by Александр Иванов on 14.06.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Elements

    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Login"
        textField.backgroundColor = .white
        textField.tintColor = .systemGray2
        textField.setLeftIcon(UIImage(systemName: "person") ?? UIImage())
        textField.layer.cornerRadius = 22
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.rightView = checkIconView
        textField.rightViewMode = .always
        textField.layer.addShadows()

        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.backgroundColor = .white
        textField.tintColor = .systemGray2
        textField.setLeftIcon(UIImage(systemName: "lock") ?? UIImage())
        textField.layer.cornerRadius = 22
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.addShadows()

        return textField
    }()

    private lazy var loginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(loginLabel)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(forgotButton)
        stackView.spacing = view.bounds.height / 20
        stackView.setCustomSpacing(view.bounds.height / 20, after: passwordTextField)
        stackView.setCustomSpacing(view.bounds.height / 40, after: loginTextField)
        stackView.setCustomSpacing(view.bounds.height / 60, after: loginButton)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private lazy var checkIconView: UIView = {
        let iconView = UIImageView(frame: CGRect(x: 25, y: 3, width: 25, height: 25))
        iconView.image = UIImage(systemName: "checkmark.circle.fill")
        iconView.tintColor = .systemGreen
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 60, height: 30))
        iconContainerView.addSubview(iconView)

        return iconContainerView
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 22
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.addShadows()

        return button
    }()

    private lazy var forgotButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot your password?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.titleLabel?.textColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private lazy var backgroundImage: UIImageView = {
        let image = UIImage(named: "backgroundImage")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups

    private func setupHierarchy() {
        view.addSubview(backgroundImage)
        view.addSubview(loginStackView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            loginStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height / 9),
            loginStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            loginStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            loginTextField.heightAnchor.constraint(equalToConstant: 44),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            loginButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
