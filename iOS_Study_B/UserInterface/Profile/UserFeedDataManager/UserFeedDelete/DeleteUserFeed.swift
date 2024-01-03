//
//  DeleteUserFeed.swift
//  iOS_Study_B
//
//  Created by 정민지 on 1/4/24.
//

import Foundation

struct DeleteUserFeed: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: String?
}
