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
    var kelimeler : Array<WordleModel.Kelime>{
        model.kelimeler
    }
}
