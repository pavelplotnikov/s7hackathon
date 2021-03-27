//
//  ViewControllerBase.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 27.03.2021.
//

import Foundation
import UIKit

class ViewControllerBase<ViewModelT: ViewModelProtocolBase>: UIViewController {
    let viewModel: ViewModelT
    private let spinner = UIActivityIndicatorView.init(style: .large)
    var spinConstraints: [NSLayoutConstraint]?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.reloadData(source: .viewWillAppear)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fixViewUnderNavBar()
        handleShowSpinner()
        setupView()
        setupConstraints()
    }

    init(_ viewModel: ViewModelT) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    func setupView() {
        self.view.addSubview(self.spinner)
        spinner.isHidden = true
    }

    func setupConstraints() {
        NSLayoutConstraint.useAndActivate([
            self.spinner.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.spinner.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func fixViewUnderNavBar() {
        edgesForExtendedLayout = []
    }

    private func handleShowSpinner() {
        viewModel.shouldShowSpinner.observe(self, closure: { value in
            switch value {
            case true:
                self.displaySpinner()
            case false:
                self.removeSpinner()
            }
        }, onMainThread: true)
    }

    // MARK: Spinner
    /// Показывает спиннер, например, при загрузке данных.
    /// @brief Должен быть переопределен в наследнике, если необходима другая логика показа спиннера.
    func displaySpinner() {
        DispatchQueue.main.async {
            self.spinner.isHidden = false
            self.spinner.startAnimating()
        }
    }

    /// Скрывает спиннер.
    /// @brief Должен быть переопределен в наследнике, если необходима другая логика показа спиннера.
    func removeSpinner() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.spinner.isHidden = true
        }
    }

    @objc func refresh() {
        viewModel.reloadData(source: .pullToRefresh)
    }

    func hasContent() -> Bool {
        return true
    }

    func buttonRepeatRequestTapped() {
        refresh()
    }
}

extension NSLayoutConstraint {
    public class func useAndActivate(_ constraints: [NSLayoutConstraint]) {
        for constraint in constraints {
            if let view = constraint.firstItem as? UIView {
                view.translatesAutoresizingMaskIntoConstraints = false
            }
        }
        activate(constraints)
    }
}
