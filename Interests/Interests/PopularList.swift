//
//  PopularList.swift
//  Interests
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import SwiftUI

struct PopularList : View {
    @EnvironmentObject var viewModel: PopularListViewModel
    @State var searchText: String = ""

    var body: some View {
        NavigationView {
                List {

                    ForEach(self.viewModel.movieSubjectList) {id in
                        
                        Text(id.title)
                    }
                }
            }
            
        
    }
}

#if DEBUG
struct PopularList_Previews : PreviewProvider {
    static var previews: some View {
        PopularList().environmentObject(PopularListViewModel())
    }
}
#endif
