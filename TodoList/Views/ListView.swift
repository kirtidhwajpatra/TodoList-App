//
//  ListView.swift
//  TodoList
//
//  Created by Uday on 28/10/25.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var hasAppeared = false

    var body: some View {
        ZStack {
            // Modern subtle gradient background
            LinearGradient(colors: [Color(.systemBackground), Color(.secondarySystemBackground)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .opacity(0.9)

            if listViewModel.items.isEmpty {
                NoItemsView()
                    .padding()
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0, y: 8)
                    .scaleEffect(hasAppeared ? 1 : 0.96)
                    .opacity(hasAppeared ? 1 : 0)
                    .animation(.spring(response: 0.5, dampingFraction: 0.9, blendDuration: 0.2), value: hasAppeared)
                    .transition(.asymmetric(insertion: .opacity.combined(with: .scale), removal: .opacity))

            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation(.spring(response: 0.35, dampingFraction: 0.88)) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                            .listRowSeparatorTint(Color.gray.opacity(0.2))
                            .listRowBackground(Color.clear)
                    }
                    .onDelete { indexSet in
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.85)) {
                            listViewModel.deleteItem(indexSet: indexSet)
                        }
                    }
                    .onMove { indices, newOffset in
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.85)) {
                            listViewModel.moveItem(from: indices, to: newOffset)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        
        .navigationTitle("Todo List 📝")
//        .animation(.spring(response: 0.5, dampingFraction: 0.9), value: listViewModel.items)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                if !listViewModel.items.isEmpty {
                    EditButton()
                        .transition(.opacity)
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                if !listViewModel.items.isEmpty {
                    NavigationLink {
                        AddView()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .symbolRenderingMode(.hierarchical)
                            .imageScale(.large)
                    }
                    .transition(.opacity)
                }
            }
        }
        .onAppear {
            hasAppeared = true
        }
    }

}

#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())
}
