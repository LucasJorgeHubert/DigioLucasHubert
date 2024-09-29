//
//  HomeSessionHeader.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 29/09/24.
//

import SwiftUI

struct HomeSessionHeader: View {
    var text: String
    
    var body: some View {
        HStack(spacing: 0) {
            getFirstWord()
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.blue)
            
            getRestOfWords()
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
    
    private func getFirstWord() -> Text {
        let words = text.split(separator: " ")
        return Text(words.first ?? "")
    }
    
    private func getRestOfWords() -> Text {
        var words = text.split(separator: " ")
        var stg = ""
        if words.count >= 1 {
            words.removeFirst()
            words.forEach { stg.append(" \($0)") }
        }
        return Text(stg)
    }
}

#Preview {
    HomeSessionHeader(text: "Digio Cash One")
}
