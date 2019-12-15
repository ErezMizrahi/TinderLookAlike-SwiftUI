//
//  SwipeView.swift
//  TinderSwiftUI
//
//  Created by Erez Mizrahi on 09/12/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import SwiftUI

struct SwipeView: View {
    @EnvironmentObject var observer: MyObserver
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(self.observer.users) { user in
                    SwipeDetailsView(name: user.name,
                                     age: user.age,
                                     image: user.image,
                                     height: geometry.size.height - 150)
                        .gesture(DragGesture()
                            .onChanged({ (value) in
                                if value.translation.width > 0 {
                                    self.observer.update(id: user,
                                                         value: value.translation.width,
                                                         degree: 8)
                                } else {
                                    
                                    self.observer.update(id: user,
                                                         value: value.translation.width,
                                                         degree: -8)
                                }
                            })
                            .onEnded({ (value) in
                                if user.swipe > 0 {
                                    if user.swipe > geometry.size.width / 2 - 80 {
                                        
                                        self.observer.update(id: user,
                                                             value: 500,
                                                             degree: 0)
                                        self.observer.updateDataBase(id: user, status: .like)
                                    }
                                    else {
                                        self.observer.update(id: user,
                                                             value: 0,
                                                             degree: 0)
                                    }
                                } else {
                                    if -user.swipe > geometry.size.width / 2 - 80 {
                                        
                                        self.observer.update(id: user,
                                                             value: -500,
                                                             degree: 0)
                                        self.observer.updateDataBase(id: user, status: .dislike)

                                    }
                                    else {
                                        self.observer.update(id: user,
                                                             value: 0,
                                                             degree: 0)
                                    }
                                }
                            }))
                        .offset(x: user.swipe)
                        .rotationEffect(.init(degrees: user.degree))
                        .animation(.spring())
                }
            }
        }
        
    }
}

