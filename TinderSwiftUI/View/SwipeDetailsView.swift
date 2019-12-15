//
//  SwipeDetailsView.swift
//  TinderSwiftUI
//
//  Created by Erez Mizrahi on 09/12/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct SwipeDetailsView: View {
    var name: String = ""
    var age: String = ""
    var image: String = ""
    
    var height: CGFloat = 0
    
    var body: some View {
        ZStack {
            AnimatedImage(url: URL(string: image)!)
                .resizable()
                .cornerRadius(20)
                .padding(.horizontal, 15)
            
            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text(name)
                            .font(.system(size: 25))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        
                        Text(age)
                            .foregroundColor(.white)
                        
                    }
                    
                    Spacer()
                }
            }.padding([.bottom, .leading], 35)
            
        }.frame(height: height)
    }
}

