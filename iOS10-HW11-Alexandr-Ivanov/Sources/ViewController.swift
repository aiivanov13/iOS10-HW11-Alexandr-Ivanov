//
//  ViewController.swift
//  iOS10-HW11-Alexandr-Ivanov
//
//  Created by Александр Иванов on 14.06.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Elements

    // Фоновое изображение
    private lazy var backgroundImage: UIImageView = {
        let image = UIImage(named: "backgroundImage")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    // Авторизация
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)

        return label
    }()

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Login"
        textField.backgroundColor = .white
        textField.tintColor = .systemGray2
        textField.setLeftIcon(UIImage(systemName: "person") ?? UIImage())
        textField.layer.cornerRadius = 22
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
        textField.layer.addShadows()

        return textField
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
        button.layer.addShadows()

        return button
    }()

    private lazy var forgotButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot your password?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(.white, for: .normal)

        return button
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

    // Лейбл + разделители
    private lazy var separatorLeft: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6

        return view
    }()

    private lazy var separatorRight: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6

        return view
    }()

    private lazy var alternativeConnectLabel: UILabel = {
        let label = UILabel()
        label.text = "or connect with"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .systemGray2

        return label
    }()

    private lazy var alternativeConnectStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(separatorLeft)
        stackView.addArrangedSubview(alternativeConnectLabel)
        stackView.addArrangedSubview(separatorRight)
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering

        return stackView
    }()

    // Авторизация через соцсети
    private lazy var facebookButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Facebook", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.titleLabel?.textColor = .white
        button.setImage(UIImage(named: "facebookIcon")?.withTintColor(.white), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        button.layer.cornerRadius = 22
        button.layer.addShadows()

        return button
    }()

    private lazy var twitterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.setTitle("Twitter", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.titleLabel?.textColor = .white
        button.setImage(UIImage(named: "twitterIcon")?.withTintColor(.white), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        button.layer.cornerRadius = 22
        button.layer.addShadows()

        return button
    }()

    private lazy var socialNetworkStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(facebookButton)
        stackView.addArrangedSubview(twitterButton)
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30
        stackView.distribution = .fillEqually

        return stackView
    }()

    // Регистрация
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Dont have account?"
        label.textColor = .systemGray2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)

        return label
    }()

    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(.systemIndigo, for: .normal)

        return button
    }()

    private lazy var signUpStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(signUpLabel)
        stackView.addArrangedSubview(signUpButton)
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.distribution = .fillProportionally

        return stackView
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
        view.addSubview(alternativeConnectStackView)
        view.addSubview(socialNetworkStackView)
        view.addSubview(signUpStackView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: 44),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            loginStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height / 10),
            loginStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            loginStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            separatorLeft.heightAnchor.constraint(equalToConstant: 2),
            separatorLeft.leftAnchor.constraint(equalTo: alternativeConnectStackView.leftAnchor),
            separatorLeft.rightAnchor.constraint(equalTo: alternativeConnectLabel.leftAnchor, constant: -15),
            separatorRight.heightAnchor.constraint(equalToConstant: 2),
            separatorRight.rightAnchor.constraint(equalTo: alternativeConnectStackView.rightAnchor),
            separatorRight.leftAnchor.constraint(equalTo: alternativeConnectLabel.rightAnchor, constant: 15),
            alternativeConnectStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            alternativeConnectStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            facebookButton.heightAnchor.constraint(equalToConstant: 44),
            twitterButton.heightAnchor.constraint(equalToConstant: 44),
            socialNetworkStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            socialNetworkStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            socialNetworkStackView.topAnchor.constraint(equalTo: alternativeConnectStackView.bottomAnchor, constant: view.bounds.height / 40),
            signUpStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpStackView.topAnchor.constraint(equalTo: socialNetworkStackView.bottomAnchor, constant: view.bounds.height / 30),
            signUpStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height / 11)
        ])
    }
}
