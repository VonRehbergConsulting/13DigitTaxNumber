//
//  LandViewController.swift
//  TaxNumberConverter
//
//  Created by Denis Shtangey on 05.09.22.
//

import Foundation
import UIKit

final class LandViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private let reuseIdentifier = "landList"
    
    var didSelectHandler: ((Land) -> Void)?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = UIView()
        view.addSubview(tableView)
        tableView.attachToSuperview()
        navigationItem.title = TextConstants.landPickerScreenTitle
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Land.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else { return UITableViewCell() }
        var content = cell.defaultContentConfiguration()
        content.text = Land.allCases[indexPath.row].rawValue
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectHandler?(Land.allCases[indexPath.row])
    }
}
