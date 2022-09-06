//
//  MainScreenViewController.swift
//  TaxNumberConverter
//
//  Created by Denis Shtangey on 05.09.22.
//

import UIKit

final class MainScreenViewController: UIViewController,
                                      UITableViewDataSource,
                                      UITableViewDelegate {
    
    // MARK: - Properties
    
    private var number: String?
    private var land: Land?
    private var result: String?
    
    private var converter = NumberConverter()
    var contentView: MainScreenContentView? { view as? MainScreenContentView }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = MainScreenContentView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView?.tableViewDataSource = self
        contentView?.tableViewDelegate = self
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Enter data"
        case 1:
            return "Result (tap to copy)"
        default:
            return nil
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if result == nil {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.reuseIdentifier) as? TextFieldTableViewCell else { return UITableViewCell() }
                cell.contentView.isUserInteractionEnabled = false
                cell.textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
                return cell
            } else if indexPath.row == 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: MainScreenTableViewCell.reuseIdentifier) as? MainScreenTableViewCell else { return UITableViewCell() }
                cell.configure(text: "Land", secondaryText: land?.rawValue, showIndicator: true)
                cell.selectionStyle = .none
                return cell
            }
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MainScreenTableViewCell.reuseIdentifier) as? MainScreenTableViewCell else { return UITableViewCell() }
            cell.configure(text: result, secondaryText: nil, showIndicator: false)
            cell.selectionStyle = .default
            return cell
        }
        return UITableViewCell()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0,
           indexPath.row == 1 {
            let controller = LandViewController()
            controller.didSelectHandler = { [weak self] land in
                guard let self = self else { return }
                self.land = land
                self.contentView?.updateLand()
                self.tryCalculate()
                controller.dismiss(animated: true)
            }
            present(controller, animated: true)
        } else if indexPath.section == 1,
                  indexPath.row == 0 {
            UIPasteboard.general.string = result
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44.0
    }
    
    // MARK: - Private helpers
    
    private func tryCalculate() {
        guard let number = number,
              let land = land
        else { return }
        
        let converted = converter.convert(number: number, in: land)
        if converted != result {
            let isShown = result != nil
            result = converted
            if converted == nil {
                contentView?.hideResult()
            } else if isShown{
                contentView?.updateResult()
            } else {
                contentView?.showResult()
            }
        }
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        number = textField.text
        tryCalculate()
    }
}
