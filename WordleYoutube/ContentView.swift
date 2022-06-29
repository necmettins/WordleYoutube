//
//  ContentView.swift
//  WordleYoutube
//
//  Created by Necmettin SOLMAZ on 25.06.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var wordleVM = WordleViewModel()
    var body: some View {
        VStack{
            ForEach(wordleVM.kelimeler){ kelime in
                HStack{
                    ForEach(0..<5){ index in
                        Text(kelime.harfler[index])
                            .frame(width: 50, height: 50)
                            .background(Color.gray)
                    }
                }
            }
            Spacer()
        } 
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
