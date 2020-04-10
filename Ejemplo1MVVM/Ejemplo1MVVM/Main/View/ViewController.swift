//
//  ViewController.swift
//  Ejemplo1MVVM
//
//  Created by Sergio Becerril on 13/02/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModelList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bind()
    }
    
    private func configureView() {
        activity.isHidden = false
        activity.startAnimating()
        viewModel.retriveDataList()
    }
    
    private func bind() {
        viewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activity.stopAnimating()
                self?.activity.isHidden = true
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        let object = viewModel.dataArray[indexPath.row]
        
        cell.textLabel?.text = object.title
        cell.detailTextLabel?.text = object.body
        
        return cell
    }
}

