//
//  SearchViewController.swift
//  MovieApp
//
//  Created by Ayan on 09.12.23.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        view.backgroundColor = .white
        
    }
    
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
        return textField
    }()
    
    func configureUI() {
        title = "Search"
        view.addSubview(tableView)
        view.addSubview(searchField)
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

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.identifier, for: indexPath) as! SearchCell
        cell.moviePoster.image = UIImage(named: "HomeTabItem")
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
