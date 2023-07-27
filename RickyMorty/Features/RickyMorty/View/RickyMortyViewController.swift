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
    private let box:UIView = UIView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }
    private func configure() {
        view.addSubview(labelTitle)
        view.addSubview(box)
        view.addSubview(indicator)
        drawDesign()
        makeBox()
        makeLabel()
        makeIndicator()
    }
    
    private func drawDesign() {
        DispatchQueue.main.async {
            self.box.backgroundColor = .red
            self.labelTitle.text = "bahittin"
            self.indicator.color = .red
            self.indicator.startAnimating()
        }
    }
}

extension RickyMortyViewController: RickyMortyOutPut {
    func changeLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func saveDatas(values: [Result]) {
        
    }
}

extension RickyMortyViewController {
    private func makeBox() {
        box.snp.makeConstraints { make in
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


