//
//  SearchViewController.swift
//  MovieApp
//
//  Created by Ayan on 09.12.23.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    let viewModel = SearchViewModel()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()        
    }
    
    // MARK: - UI Elements
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(SearchCell.self, forCellReuseIdentifier: SearchCell.identifier)
        table.backgroundColor = .white
        return table
    }()
    
    private let searchField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 16
        textField.backgroundColor = .systemGray4
        textField.addTarget(self, action: #selector(searchFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    @objc private func searchFieldDidChange(_ textField: UITextField) {
        if let searchText = textField.text {
            viewModel.filterItemsForSearch(with: searchText)
            viewModel.success = { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - UI Configuration
    func configureUI() {
        view.backgroundColor = .white
        title = "Search"
        view.addSubview(tableView)
        view.addSubview(searchField)
        setupConstraints()
    }
    
    // MARK: - Constraints
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(172)
        }
        
        searchField.snp.makeConstraints { make in
            make.bottom.equalTo(tableView.snp.top).offset(-12)
            make.left.equalTo(view.safeAreaInsets.left).offset(12)
            make.right.equalTo(view.safeAreaInsets.right).offset(-12)
            make.size.height.equalTo(50)
        }
    }
}


    //MARK: -Table View Data Source methods
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.identifier, for: indexPath) as! SearchCell
        cell.configureCell(data: viewModel.results[indexPath.row])
        return cell
    }
}

    //MARK: -Table View Delegate methods
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}