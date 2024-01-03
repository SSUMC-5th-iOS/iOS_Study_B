//
//  UserFeedModel.swift
//  iOS_Study_B
//
//  Created by 정민지 on 11/29/23.
//

import Foundation

struct UserFeedModel: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: UserFeedModelResult?
}

struct UserFeedModelResult: Decodable  {
    let isMyFeed: Bool?
    let getUserInfo: GetUserInfo?
    let getUserPosts: [GetUserPosts]?
}
    
struct GetUserInfo: Decodable {
    let userIdx: Int?
    let nickName: String?
    let name: String?
    let profileImgUrl: String?
    let website: String?
    let introduction: String?
    let followerCount: Int?
    let followeeCount: Int?
    let postCount: Int?
}

struct GetUserPosts: Decodable{
    let postIdx: Int?
    let postImgUrl: String?
}
