//
//  Post.swift
//  Navigation
//
//  Created by Ekaterina Saveleva on 21.03.2023.
//

import UIKit

struct Post {  // комментарий от Алексея Павлова "Подобные структуры struct Post лучше убирать в отдельный файл"
    let id = UUID()
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int
}

struct Post2 {
    let title: String?
    let image: UIImage?
    let text: String?
}

extension Post {
    static func Make() -> [Post] {
        return [
            Post(author: "Shaggy", description: "Сегодня еще ничего не елдлапрои мывлмтывжл рмфжвмо фжщимофж шмрофущш комфщшумрфшзгкеи рфшкгеримфшыкгеирыал опирш жагиргшыкер", image: "Shaggy", likes: 10, views: 320),
            Post(author: "CalmCat", description: "Молчу весь день. Тяжело.", image: "CalmCat", likes: 10, views: 320),
            Post(author: "MaybeImNotCat", description: "Блохи и клещи худщие враги", image: "MaybeImNotCat", likes: 10, views: 320),
            Post(author: "ImOkay", description: "Бегаю за хвостом. Пока не поймал.", image: "ImOkay", likes: 10, views: 320)
        ]

    }
}

