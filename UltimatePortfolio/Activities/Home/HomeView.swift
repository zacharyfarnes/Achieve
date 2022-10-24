//
//  HomeView.swift
//  UltimatePortfolio
//
//  Created by Zachary Farnes on 05/05/2022.
//

import CoreSpotlight
import SwiftUI

struct HomeView: View {
    static let tag: String? = "Home"
    @StateObject var viewModel: ViewModel

    var projectRows: [GridItem] {
        [GridItem(.fixed(100))]
    }

    init(dataController: DataController) {
        let viewModel = ViewModel(dataController: dataController)
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            Group {
                if viewModel.projects.isEmpty {
                    Text("There's nothing here right now.")
                        .foregroundColor(.secondary)
                } else {
                    ScrollView {
                        if let item = viewModel.selectedItem {
                            NavigationLink(
                                destination: EditItemView(item: item),
                                tag: item,
                                selection: $viewModel.selectedItem,
                                label: EmptyView.init
                            )
                            .id(item)
                        }

                        VStack(alignment: .leading, spacing: 0) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: projectRows) {
                                    ForEach(viewModel.projects) { project in
                                        NavigationLink(destination: EditProjectView(project: project)) {
                                            ProjectSummaryView(project: project)
                                        }
                                    }
                                }
                                .padding()
                                .fixedSize(horizontal: false, vertical: true)
                            }
                            Divider()
                                .padding(.horizontal)
                            VStack(alignment: .leading) {
                                ItemListView(title: "Up next", items: viewModel.upNext)
                                ItemListView(title: "More to explore", items: viewModel.moreToExplore)
                            }
                            .padding([.horizontal, .bottom])
                        }
                    }
                    .background(Color.systemGroupedBackground.ignoresSafeArea())
                }
            }
            .navigationTitle("Home")
            .onContinueUserActivity(CSSearchableItemActionType, perform: loadSpotlightItem)
        }
    }

    func loadSpotlightItem(_ userActivity: NSUserActivity) {
        if let uniqueIdentifier = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
            viewModel.selectItem(with: uniqueIdentifier)
        }
    }
}

// Button("Add Data", action: viewModel.addSampleData)

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(dataController: .preview)
    }
}
