//
//  KlavyeView.swift
//  WordleYoutube
//
//  Created by Necmettin SOLMAZ on 4.07.2022.
//

import SwiftUI

struct KlavyeView: View {
    let üstSıra = "FGĞIODRNHP".map({String($0)})
    let ortaSıra = "UİEAÜTKMLYŞ".map({String($0)})
    let altSıra = "JÖVCÇZSB".map({String($0)})
    var body: some View {
        VStack {
            HStack(spacing: 1){
                ForEach(üstSıra, id:\.self){ harf in
                    HarfView(harf: harf)
                }
            }
            HStack(spacing: 1){
                ForEach(ortaSıra, id:\.self){ harf in
                    HarfView(harf: harf)
                }
            }
            HStack(spacing: 1){
                TamamButonu
                ForEach(altSıra, id:\.self){ harf in
                    HarfView(harf: harf)
                }
                GeriButonu
            }
        }
        
    }
    var TamamButonu : some View{
        Button {
            
        } label: {
            Text("Tamam")
                .frame(width: 65, height: 60)
                .background(Color.gray)
                .foregroundColor(.primary)
        }
    }
    var GeriButonu : some View{
        Button {
            
        } label: {
            Image(systemName: "delete.left.fill")
                .frame(width: 40, height: 60)
                .background(Color.gray)
                .foregroundColor(.primary)
        }

    }
}
struct HarfView: View{
    var harf: String
    var body: some View{
        Button {
            
        } label: {
            Text(harf)
                .frame(width: 35, height: 60)
                .background(Color.gray)
                .foregroundColor(.primary)
        }

    }
}
struct KlavyeView_Previews: PreviewProvider {
    static var previews: some View {
        KlavyeView()
    }
}
