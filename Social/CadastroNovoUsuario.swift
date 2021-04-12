//
//  CadastraNovoUsuario.swift
//  Social
//
//  Created by Rubens Ferreira Ramos on 12/04/21.
//

import SwiftUI

struct CadastraNovoUsuarioView: View {
    
    var user: User
    
    @EnvironmentObject
    var viewModel: UserViewModel
        
    var body: some View {
        GeometryReader{ geometry in
            Group {
                if viewModel.isLoading {
                    showLoading()
                } else {
                    VStack {
                       Text("Cadastrar Novo Usuario")
                        .bold()
                        .font(.headline)
                        
                        Button("Cadastrar Usuario") {
                            withAnimation(.easeInOut) {
                                viewModel.registerUsers(user: user)
                            }
                        }
                      
                        Spacer()
                    }.padding()
                }
            }
        }
        .navigationTitle("Cadastro de usuarios")
    }
    
    private func showLoading() -> some View {
        return VStack {
            ProgressView()
            Text("Carregando")
        }
    }
}
