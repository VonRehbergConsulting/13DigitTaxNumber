//
//  MainScreenContentView.swift
//  TaxNumberConverter
//
//  Created by Denis Shtangey on 05.09.22.
//

import UIKit

final class MainScreenContentView: UIView {
    
    // MARK: - Subviews
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: TextFieldTableViewCell.reuseIdentifier)
        tableView.register(MainScreenTableViewCell.self, forCellReuseIdentifier: MainScreenTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    // MARK: - Properties
    
    var tableViewDataSource: UITableViewDataSource? {
        get { tableView.dataSource }
        set { tableView.dataSource = newValue}
    }
    var tableViewDelegate: UITableViewDelegate? {
        get { tableView.delegate }
        set { tableView.delegate = newValue}
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func updateLand() {
        tableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .none)
    }
    
    func updateResult() {
        tableView.reloadRows(at: [IndexPath(row: 0, section: 1)], with: .none)
    }
    
    func showResult() {
        tableView.insertSections(IndexSet(integer: 1), with: .middle)
    }
    
    func hideResult() {
        tableView.deleteSections(IndexSet(integer: 1), with: .middle)
    }
}
