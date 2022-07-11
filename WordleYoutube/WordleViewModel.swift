//
//  WordleViewModel.swift
//  WordleYoutube
//
//  Created by Necmettin SOLMAZ on 25.06.2022.
//

import Foundation
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
}
