//
//  FeedViewController.swift
//  Navigation
//
//  Created by Ekaterina Saveleva on 16.03.2023.
//

import UIKit
import Foundation


struct Post {
    let id = UUID()
    let title: String?
    let image: UIImage?
    let text: String?
}



class FeedViewController: UIViewController {

    let post = Post(
        title: "Название поста (POST VC)",
        image: UIImage(named: "A316DE42"),
        text: "текст внутри данного поста, очень длинный и важный"
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        makeButtonViewPost()
    }
    
    
    
    private func makeButtonViewPost(){
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 30))
        button.center = view.center
        button.backgroundColor = .black
        button.setTitle("Посмотреть пост", for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(tapButtonViewPost), for: .touchUpInside)
    }
    @objc private func tapButtonViewPost(){
        let postVC = PostViewController()
        postVC.navigationItem.title = post.title
        navigationController?.pushViewController(postVC, animated: true)
    }
    

}
