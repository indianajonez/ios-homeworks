//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Ekaterina Saveleva on 16.03.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // почему не добавляем fileprivate let data =  ?
    // почему не используем private lazy var tableView: UITableView = {
    // let tableView = UITableView.init(
    // frame: .zero
    // style: .plain
    //)
    //tableView.translatesAutoresizingMaskIntoConstraints = false
    
    // return tableView
    // }()
    
    private lazy var table: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier) //регистрация ячейки для переиспользования
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        layout()
        
    }
    
    private func layout() {
        
        view.addSubview(table)
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    } // auto math height size for cell
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()
        header.backgroundColor = .darkGray
        return section == 0 ? header : nil
        //nil
    }
}


// MARK: - UITableViewDataSource дата сорс отвечает за то, чтобы наполнить наблицу данными
//tableView(_:titleForHeaderIn Section:)
//tableView(_:titleForFooterIn Section:)
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 0 : listPost.count // с помощью этого метода указываем кол-во ячеек
        //listPost.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as? PostTableViewCell else { return UITableViewCell()}
        cell.setupCell(listPost[indexPath.row])
        //cell.selectionStyle = .none
        return cell
    }
}

// MARK: - UIView

extension UIView {
    static var identifier: String {return String(describing: self)}
}
