//
//  WordleModel.swift
//  WordleYoutube
//
//  Created by Necmettin SOLMAZ on 25.06.2022.
//

import Foundation
import SwiftUI
struct WordleModel{
    private(set) var kelimeler : Array<Kelime>
    var girilenKelime = ""
    init(){
        kelimeler = Array<Kelime>()
        for index in 0..<6{
            kelimeler.append(Kelime(id: index))
        }
    }
    
    mutating func harfEkle(_ harf: String){
        girilenKelime += harf
        girilenKelimeyiBeşHarfeTamamla()
    }
    mutating func harfSil(){
        girilenKelime.removeLast()
        girilenKelimeyiBeşHarfeTamamla()
    }
    mutating func girilenKelimeyiBeşHarfeTamamla(){
        let girilenKelime = girilenKelime.padding(toLength: 5, withPad: " ", startingAt: 0)
        kelimeler[0].harfler = girilenKelime.map{String($0)}
    }
    mutating func tersÇevir(index : Int){
        kelimeler[0].isFaceUp[index].toggle()
    }
    struct Kelime : Identifiable{
        let id : Int
        var harfler = Array<String>(repeating: "", count: 5)
        var arkaPlanRengi = Array<Color>(repeating: Color.lightGray, count: 5)
        var isFaceUp = Array<Bool>(repeating: true, count: 5)
    }
}
