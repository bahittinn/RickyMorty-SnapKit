//
//  RickyMortyViewController.swift
//  RickyMorty
//
//  Created by Bahittin on 25.07.2023.
//

import UIKit
import SnapKit

protocol RickyMortyOutPut {
    func changeLoading(isLoad: Bool)
    func saveDatas(values: [Result])
}


final class RickyMortyViewController: UIViewController {
    private let labelTitle: UILabel = UILabel()
    private let tableView:UITableView = UITableView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    private lazy var results: [Result] = []
    
    lazy var viewModel: IRickyMortyViewModel = RickyMortyViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
        viewModel.setDelegate(output: self)
        viewModel.fetchItems()
        
    }
    private func configure() {
        view.addSubview(labelTitle)
        view.addSubview(tableView)
        view.addSubview(indicator)
        drawDesign()
        makeTableView()
        makeLabel()
        makeIndicator()
    }
    
    private func drawDesign() {
        tableView.delegate   = self
        tableView.dataSource = self
        DispatchQueue.main.async {
            self.labelTitle.text = "Ricky Morty"
            self.indicator.color = .red
        }
        indicator.startAnimating()
    }
}

//MARK: - Output Section
extension RickyMortyViewController: RickyMortyOutPut {
    func changeLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func saveDatas(values: [Result]) {
        results = values
        tableView.reloadData()
    }
}


//MARK: - TableView Settings
extension RickyMortyViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = results[indexPath.row].name ?? "deneme"
        return UITableViewCell()
    }
}


//MARK: - UI Design
extension RickyMortyViewController {
    private func makeTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(labelTitle)
        }
    }
    private func makeLabel() {
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(20)
        }
    }
    private func makeIndicator() {
        indicator.snp.makeConstraints { make in
            make.height.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
            make.top.equalTo(labelTitle)
        }
    }
}


