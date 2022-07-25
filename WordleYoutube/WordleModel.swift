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
    var denemeSayısı = 0
    var girilenKelime = ""
    let gününKelimesi = "KİTAP"
    var klavyeRengi = [String : Color]()
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
        kelimeler[denemeSayısı].harfler = girilenKelime.map{String($0)}
    }
    mutating func tersÇevir(index : Int){
        kelimeler[denemeSayısı].isFaceUp[index].toggle()
        if kelimeler[denemeSayısı].isFaceUp == [Bool](repeating: false, count: 5){
            denemeSayısı += 1
            girilenKelime = ""
        }
    }
    mutating func harfleriKarşılaştır(){
        var harfSayacı = [String : Int]()
        for harf in gününKelimesi{
            harfSayacı[String(harf), default: 0] += 1
        }
        for index in 0..<5{
            let girilenHarf = girilenKelime.map({String($0)})[index]
            let gününHarfi = gününKelimesi.map({String($0)})[index]
            if girilenHarf == gününHarfi{
                kelimeler[denemeSayısı].arkaPlanRengi[index] = .green
                klavyeRengi[girilenHarf] = .green
                harfSayacı[girilenHarf]! -= 1
            }
        }
        for index in 0..<5{
            let girilenHarf = girilenKelime.map({String($0)})[index]
            if gününKelimesi.contains(girilenHarf)
                && kelimeler[denemeSayısı].arkaPlanRengi[index] != .green
                && harfSayacı[girilenHarf]! > 0 {
                kelimeler[denemeSayısı].arkaPlanRengi[index] = .yellow
                klavyeRengi[girilenHarf] = .yellow
                harfSayacı[girilenHarf]! -= 1
            }
            if !gününKelimesi.contains(girilenHarf){
                kelimeler[denemeSayısı].arkaPlanRengi[index] = .gray
                klavyeRengi[girilenHarf] = .gray
            }
        }
    }
    struct Kelime : Identifiable{
        let id : Int
        var harfler = Array<String>(repeating: "", count: 5)
        var arkaPlanRengi = Array<Color>(repeating: Color.lightGray, count: 5)
        var isFaceUp = Array<Bool>(repeating: true, count: 5)
    }
}
