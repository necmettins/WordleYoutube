//
//  WordleViewModel.swift
//  WordleYoutube
//
//  Created by Necmettin SOLMAZ on 25.06.2022.
//

import Foundation
import SwiftUI
class WordleViewModel : ObservableObject{
    @Published var model : WordleModel
    
    init(){
        model = WordleModel()
    }
    
    func harfEkle(_ harf: String){
        model.harfEkle(harf)
    }
    func harfSil(){
        model.harfSil()
    }
    func tamamButonu(){
        model.harfleriKarşılaştır()
        for index in 0..<5{
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
                withAnimation {
                    self.model.tersÇevir(index: index)
                }
            }
            
            
        }
        
    }
    var harfleriPasifYap : Bool{
        model.girilenKelime.count == 5
    }
    var tamamButonunuPasifYap : Bool{
        model.girilenKelime.count < 5
    }
    var geriButonunuPasifYap : Bool{
        model.girilenKelime.count == 0
    }
    var kelimeler : Array<WordleModel.Kelime>{
        model.kelimeler
    }
    var klavyeRengi : [String: Color]{
        model.klavyeRengi
    }
}
