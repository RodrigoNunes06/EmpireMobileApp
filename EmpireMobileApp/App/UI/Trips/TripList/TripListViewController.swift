//
//  TripListViewController.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/13/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import UIKit
import RxSwift

class TripListViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    private let viewModel: TripListViewModelApi!
    private let disposeBag = DisposeBag()
    
    init(viewModel: TripListViewModelApi) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        setupRx()
        viewModel.onViewDidLoad()
    }
}

private extension TripListViewController {
    func setupNavigationBar() {
        self.navigationItem.title = "LAST TRIPS"
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: TripCell.preferredNibName(), bundle: nil),
                           forCellReuseIdentifier: TripCell.reuseIdentifier())
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = CGFloat(116)
    }
    
    func setupRx() {
        viewModel.reloadAction.subscribe(onNext: {[unowned self] in
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
}

extension TripListViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier(), for: indexPath)
        if let tripCell = cell as? TripCell {
            tripCell.set(viewModel: viewModel.cellViewModel(index: indexPath.row))
        }
        
        return cell
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Show detail
    }
}
