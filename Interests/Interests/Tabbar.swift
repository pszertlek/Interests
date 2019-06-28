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
            PopularList().tabItemLabel(Text("Popular")).tag(0)
            TopRatedList().tabItemLabel(Text("Top Rated")).tag(1)
            UpcomingList().tabItemLabel(Text("Upcoming")).tag(2)
            MyLists().tabItemLabel(Text("My Lists")).tag(3)
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
