//
//  ContentView.swift
//  TinderSwiftUI
//
//  Created by Erez Mizrahi on 09/12/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var observer: MyObserver
    
    var body: some View {
        ZStack {
            Color("LightWhite")
                .edgesIgnoringSafeArea(.all)
            
       
            if self.observer.users.isEmpty {
            Loader()
            }
            
            VStack {
                TopView()
                
                SwipeView()
                
                BottomView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
