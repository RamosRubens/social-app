//
//  FotosUsuario.swift
//  Social
//
//  Created by Rubens Ferreira Ramos on 12/04/21.
//

import SwiftUI

struct FotosUsuario: View {
 
    @ObservableObject
    var viewModel = ImagemUsuarioViewModel
    
    var body: some View{
        GeometryReader{ geometry in
            Group{
                if viewModel.loading{
                    showLoading()
                }else{
                    List(viewModel.images) { imagem in
                        HStack {
                            let width = geometry.size.width * 0.8
                            Spacer()
                            if let url = URL(string: imagem.thumbnailURL){
                                AsyncImage(url: url, placeholder: { ProgressView().frame(width: width, height: width, alignment: .center)
                                })
                                .frame(width: width, height: width, alignment: .center)
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
        .onAppear{
            viewModel.fetchUserImages()
        }
    }
    
    func showLoading() -> some View {
        return
            HStack(alignment: .center) {
                Spacer()
                VStack(alignment: .center) {
                    Spacer()
                    ProgressView()
                    Text("Carregando")
                    Spacer()
                }
                Spacer()
            }
    }

}
 
