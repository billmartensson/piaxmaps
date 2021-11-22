//
//  FancyMappinView.swift
//  piaxmaps
//
//  Created by Bill Martensson on 2021-11-22.
//

import SwiftUI

struct FancyMappinView: View {
    
    @State var pininfo : FancyPlace
    
    var body: some View {
        VStack {
            Image(systemName: "mappin.circle").resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50).foregroundColor(.white)
            Text(pininfo.placename).font(.title)
                .onTapGesture {
                    print(pininfo.placedescription)
            }
            Text("Underrubrik").font(.subheadline)
        }.padding().background(Color.gray)
    }
}

struct FancyMappinView_Previews: PreviewProvider {
    static var previews: some View {
        
        let testplace: FancyPlace = FancyPlace(lat: 55.61259201984638, long: 12.993687792841314, thename: "Tåg", thedesc: "Här är tåg")
        
        FancyMappinView(pininfo: testplace)
            .previewLayout(.sizeThatFits)


        let testplace2: FancyPlace = FancyPlace(lat: 55.61259201984638, long: 12.993687792841314, thename: "Centralstationen", thedesc: "Här är tåg")
        
        FancyMappinView(pininfo: testplace2)
            .previewLayout(.sizeThatFits)

    }
}
