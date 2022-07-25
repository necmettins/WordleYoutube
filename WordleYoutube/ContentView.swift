//
//  ContentView.swift
//  WordleYoutube
//
//  Created by Necmettin SOLMAZ on 25.06.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var wordleVM = WordleViewModel()
    var body: some View {
        NavigationView{
            VStack(spacing: 1){
                ForEach(wordleVM.kelimeler){ kelime in
                    CardView(kelime: kelime)
                }
                Spacer()
                KlavyeView().environmentObject(wordleVM)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "questionmark.circle")
                    }

                }
                ToolbarItem(placement: .principal) {
                    Text("W O R D L E")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        Button {
                            
                        } label: {
                            Image(systemName: "chart.bar")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape.fill")
                        }
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct CardView: View {
    var kelime : WordleModel.Kelime
    var body: some View {
        HStack(spacing: 1){
            ForEach(0..<5){ index in
                ZStack {
                    Text(kelime.harfler[index])
                        .frame(width: 60, height: 60)
                        .rotation3DEffect(Angle.degrees(kelime.isFaceUp[index] ? 0 : -180), axis: (x: 1, y: 0, z: 0))
                    
                }.background(kelime.isFaceUp[index] ? Color.lightGray : kelime.arkaPlanRengi[index])
                    .rotation3DEffect(Angle.degrees(kelime.isFaceUp[index] ? 0 : -180), axis: (x: 1, y: 0, z: 0))
            }
        }
    }
}
