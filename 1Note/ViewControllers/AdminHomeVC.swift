//
//  AdminHomeVC.swift
//  1Note
//
//  Created by Christopher Lora on 2/6/22.
//

import UIKit
import Firebase

class AdminHomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView: UITableView = {
       let table = UITableView()
        table.register(CollectionTableViewCell.self,
                       forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(
            viewModels: [
                TileCollectionViewCellViewModel(name: "Dressing Tasks", backgroundColor: .systemBlue),
                TileCollectionViewCellViewModel(name: "Vitals", backgroundColor: .systemRed),
                TileCollectionViewCellViewModel(name: "Home Layout: Safety", backgroundColor: .systemYellow),
                TileCollectionViewCellViewModel(name: "Home Layout: Accessibility", backgroundColor: .systemPink),
                TileCollectionViewCellViewModel(name: "Fine Motor Milestone: Compact", backgroundColor: .systemGreen),
                TileCollectionViewCellViewModel(name: "Fine Motor Milestone: Preschool", backgroundColor: .systemOrange)
            ]
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CollectionTableViewCell.identifier,
            for: indexPath
        ) as? CollectionTableViewCell else {
            fatalError()
        }
        cell.delegate = self
        cell.configure(with: viewModel)
        return cell
        }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width/2
    }
}

extension UIViewController: CollectionTableViewCellDelegate{
    func collectionTableViewCellDidTapItem(with viewModel: TileCollectionViewCellViewModel) {
        let alert = UIAlertController(
            title: viewModel.name,
            message: "You successfully got the selected item",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    @objc func makeAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
