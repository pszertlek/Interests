//
//  Tabbar.swift
//  Interests
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import SwiftUI

struct Tabbar : View {
    var body: some View {
        TabbedView {
            PopularList().environmentObject(PopularListViewModel())
                .tabItemLabel(Text("Popular"))
                .tag(0)
            MyLists()
                .tabItemLabel(Text("My List"))
                .tag(1)
        }.edgesIgnoringSafeArea(.top).accentColor(.red)
    }
}

#if DEBUG
struct Tabbar_Previews : PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
#endif
