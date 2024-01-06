//
//  FeedUploadModel.swift
//  iOS_Study_B
//
//  Created by 정민지 on 11/29/23.
//

struct FeedUploadModel: Decodable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : FeedUploadResult?
}
struct FeedUploadResult : Decodable {
    var postIdx : Int?
}
