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
    private var displayedTextField: UIView?
    var contentView: MainScreenContentView? { view as? MainScreenContentView }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = MainScreenContentView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView?.tableViewDataSource = self
        contentView?.tableViewDelegate = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = TextConstants.mainScreenTitle
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let tableView = contentView?.tableView,
              let headerView = tableView.tableHeaderView
        else { return }
        let width = tableView.bounds.size.width
        let size = headerView.systemLayoutSizeFitting(CGSize(width: width, height: UIView.layoutFittingCompressedSize.height))
        if headerView.frame.size.height != size.height {
            headerView.frame.size.height = size.height
            tableView.tableHeaderView = headerView
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return TextConstants.numberFieldTitle
        case 1:
            return TextConstants.landPickerTitle
        case 2:
            return TextConstants.resultTitle
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 2 {
            return TextConstants.resultFooter
        }
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if result == nil {
            return 2
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath == CellIndex.numberTextField.indexPath {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.reuseIdentifier) as? TextFieldTableViewCell else { return UITableViewCell() }
            displayedTextField = cell.textField
            cell.textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            return cell
        } else if indexPath == CellIndex.landPicker.indexPath {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MainScreenTableViewCell.reuseIdentifier) as? MainScreenTableViewCell else { return UITableViewCell() }
            let secondaryText = land?.rawValue == nil ? TextConstants.landPickerPlaceholder : nil
            cell.configure(text: land?.rawValue, secondaryText: secondaryText, showIndicator: true)
            cell.selectionStyle = .none
            return cell
        } else if indexPath == CellIndex.result.indexPath {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MainScreenTableViewCell.reuseIdentifier) as? MainScreenTableViewCell else { return UITableViewCell() }
            cell.configure(text: result, secondaryText: nil, showIndicator: false)
            cell.selectionStyle = .default
            return cell
        }
        return UITableViewCell()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        displayedTextField?.resignFirstResponder()
        if indexPath == CellIndex.landPicker.indexPath {
            let controller = LandViewController()
            controller.didSelectHandler = { [weak self] land in
                guard let self = self else { return }
                self.land = land
                self.contentView?.updateLand()
                self.tryCalculate()
                self.navigationController?.popViewController(animated: true)
            }
            navigationController?.pushViewController(controller, animated: true)
        } else if indexPath == CellIndex.result.indexPath {
            UIPasteboard.general.string = result
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        displayedTextField?.resignFirstResponder()
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
