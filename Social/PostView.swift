//
//  PostView.swift
//  Social
//
//  Created by Pedro Henrique on 05/04/21.
//

import SwiftUI

struct PostView: View {
    
    var user: User
    
    @EnvironmentObject
    var viewModel: PostViewModel
        
    var body: some View {
        Group {
            if viewModel.isLoading {
                showLoading()
            } else {
                HStack {
                    NavigationLink(destination: GridUsersImageView(viewModel: GridUsersImageViewModel(user: user))) {
                        Text("Albuns")
                    }
                    Spacer()
                }.padding()
                
                List{
                    ForEach(viewModel.posts) { post in
                        ZStack {
                            VStack(alignment: .leading) {
                                Text(post.title).font(.headline)
                                Text(post.body).font(.caption)
                            }.padding(EdgeInsets(top: 8.0, leading: 4.0, bottom: 8.0, trailing: 8.0))
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchPosts(user: user)
        }
        .navigationTitle(user.name)
    }
    
    private func showLoading() -> some View {
        return VStack {
            ProgressView()
            Text("Carregando")
        }
    }
}
