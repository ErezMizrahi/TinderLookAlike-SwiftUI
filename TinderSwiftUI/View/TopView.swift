//
//  TopView.swift
//  TinderSwiftUI
//
//  Created by Erez Mizrahi on 09/12/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        HStack {
            //1
            Button(action: {
                
            }) {
                Image("icons8-person_male")
                    .resizable()
                    .frame(width: 35, height: 35)
            }
            .foregroundColor(.gray)
            
            Spacer()
            
            //2
            Button(action: {
                
            }) {
                Image(systemName: "flame.fill")
                    .resizable()
                    .frame(width: 30, height: 35)
            }
            .foregroundColor(.red)
            
            
            Spacer()
            
            //3
            Button(action: {
                
            }) {
                Image("icons8-chat")
                    .resizable()
                    .frame(width: 35, height: 35)
            }
            .foregroundColor(.gray)
            
            
        }.padding()
    }
}
