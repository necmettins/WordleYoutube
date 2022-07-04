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
        NavigationView{
            VStack(spacing: 3){
                ForEach(wordleVM.kelimeler){ kelime in
                    CardView(kelime: kelime)
                }
                Spacer()
                KlavyeView()
            } .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            
                        } label: {
                            Image(systemName: "questionmark.circle")
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("WORDLE")
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
        HStack(spacing: 3){
            ForEach(0..<5){ index in
                Text(kelime.harfler[index])
                    .frame(width: 60, height: 60)
                    .background(Color.gray)
                    .font(.title)
                    .foregroundColor(.primary)
            }
        }
    }
}
