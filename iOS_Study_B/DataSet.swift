//
//  DataSet.swift
//  iOS_Study_B
//
//  Created by 황채웅 on 2023/10/18.
//

import Foundation

struct DataSet {
    var image: String
    let text1: String
    let text2: String
    let text3: String
}

extension DataSet {
    static var data = [
        DataSet(image: "Image", text1: "[급구] 50만원 제공! 쿵야 레스토랑에서 시식 알바 구함니다.^^ -🧅", text2: "당근알바 · 이벤트", text3: ""),
        DataSet(image: "Image 1", text1: "에어팟맥스실버", text2: "서울특별시 양천구 · 6일 전", text3: "370,000원"),
        DataSet(image: "Image 2", text1: "에어팟 맥스 스페이스그레이 S급 판매합니다.", text2: "서울특별시 양천구 · 3시간 전", text3: "490,000원"),
        DataSet(image: "Image 3", text1: "[S급]에어팟 맥스 스페이스 그레이 풀박 판매합니다.", text2: "서울특별시 양천구 · 1일 전", text3: "550,000원"),
        DataSet(image: "Image 4", text1: "보일러 온돌 (배관) 고쳐주세요", text2: "천왕동 · 광고", text3: "")
        
    ]
}
