//
//  Test.swift
//  iOS_Study_B
//
//  Created by Blu on 2023/10/12.
//

import Foundation

struct Test {
    let title: String
    var image: String
    let location: String
    let updateDate: String
    let price: String?
    let chat: Int?
    let heart: Int?
}

extension Test {
    static var data = [
        Test(title: "[급구] 50만원 제공! 쿵야 레스토랑에서 시식 알바 구함니다.^^ -🧅", image: "first", location: "당근알바", updateDate: "이벤트", price: nil, chat: nil, heart: nil),
        Test(title: "에어팟맥스실버", image: "second", location: "서울특별시 양천구", updateDate: "6일 전", price: "370,000원", chat: 5, heart: 23),
        Test(title: "에어팟 맥스 스페이스그레이 S급 판매합니다.", image: "third", location: "서울특별시 양천구", updateDate: "3시간 전", price: "490,000원", chat: 1, heart: 4),
        Test(title: "[S급]에어팟 맥스 스페이스 그레이 풀박 판매합니다.", image: "fourth", location: "서울특별시 양천구", updateDate: "1일 전", price: "550,000원", chat: 1, heart: 7),
        Test(title: "귀여운 웰시코기 사진 팝니다", image: "fifth", location: "의정부시 용현동", updateDate: "1일 전", price: "999,999원", chat: 9, heart: 99)
    ]
}
