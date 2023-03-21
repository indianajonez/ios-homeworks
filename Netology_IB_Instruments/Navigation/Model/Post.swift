//
//  Post.swift
//  Navigation
//
//  Created by Ekaterina Saveleva on 21.03.2023.
//

import UIKit

struct Post {  // комментарий от Алексея Павлова "Подобные структуры struct Post лучше убирать в отдельный файл"
    let id = UUID()
    let title: String?
    let image: UIImage?
    let text: String?
}
