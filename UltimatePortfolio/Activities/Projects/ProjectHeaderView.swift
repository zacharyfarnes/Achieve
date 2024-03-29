//
//  ProjectHeaderView.swift
//  UltimatePortfolio
//
//  Created by Zachary Farnes on 12/05/2022.
//

import SwiftUI

struct ProjectHeaderView: View {
    @ObservedObject var project: Project

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(project.projectTitle)
                ProgressView(value: project.completionAmount)
                    .accentColor(Color(project.projectColor))
            }
            .accessibilityElement(children: .combine)
            Spacer()
            NavigationLink(destination: EditProjectView(project: project)) {
                Image(systemName: "square.and.pencil")
                    .imageScale(.large)
            }
            .accessibilityLabel("Edit Project")
        }
        .padding(.bottom, 10)
    }
}

struct ProjectHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectHeaderView(project: Project.example)
    }
}
