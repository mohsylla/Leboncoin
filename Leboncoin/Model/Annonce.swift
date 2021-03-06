//
//  Annonce.swift
//  Leboncoin
//
//  Created by Sylla on 22/04/2022.
//

import Foundation

struct Annonce: Decodable {
    let id: Int
    let category_id: Int
    let title: String
    let description: String
    let price: Float
    let images_url: ImageUrl
    let creation_date: String
    let is_urgent: Bool
}
struct ImageUrl: Decodable{
    let small: String?
    let thumb: String?
}
