//
//  MainScreenContentView.swift
//  TaxNumberConverter
//
//  Created by Denis Shtangey on 05.09.22.
//

import UIKit

final class MainScreenContentView: UIView {
    
    // MARK: - Subviews
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: TextFieldTableViewCell.reuseIdentifier)
        tableView.register(MainScreenTableViewCell.self, forCellReuseIdentifier: MainScreenTableViewCell.reuseIdentifier)
        tableView.isScrollEnabled = false
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        label.text = TextConstants.footerText
        label.textColor = .systemGray
        
        let bufferView = UIView()
        bufferView.addSubview(label)
        label.attachToSuperview(insets: .init(top: 8, left: 40, bottom: -16, right: -40))
        tableView.tableHeaderView = bufferView
        
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
        backgroundColor = .systemGroupedBackground
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - Public methods
    
    func updateLand() {
        tableView.reloadRows(at: [CellIndex.landPicker.indexPath], with: .none)
    }
    
    func updateResult() {
        tableView.reloadRows(at: [CellIndex.landPicker.indexPath], with: .none)
    }
    
    func showResult() {
        tableView.insertSections(IndexSet(integer: CellIndex.result.indexPath.section), with: .middle)
    }
    
    func hideResult() {
        tableView.deleteSections(IndexSet(integer: CellIndex.result.indexPath.section), with: .middle)
    }
}
