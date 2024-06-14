import ComposableArchitecture
import SwiftUI

@ViewAction(for: AboutReducer.self)
public struct AboutView: View {
    @Bindable public var store: StoreOf<AboutReducer>

    public init(store: StoreOf<AboutReducer>) {
        self.store = store
    }

    public var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            content
        } destination: { store in
            switch store.state {
            case .staffs:
                Text("Staff")
            case .contributers:
                Text("Contributers")
            case .sponsors:
                Text("Sponsors")
            }
        }
    }
    
    @ViewBuilder var content: some View {
        ScrollView {
            VStack(spacing: 0) {
                KeyVisual()
                    .padding(.top, 28)
                    .padding(.bottom, 32)
                
                VStack {
                    HStack {
                        Text("Credits")
                            .foregroundStyle(Color(.surfaceOnSurfaceVariant))
                            .font(.headline)
                        Spacer()
                    }

                    Button(action: {
                        send(.staffsTapped)
                    }, label: {
                        Label("Staffs", systemImage: "face.smiling")
                            .foregroundStyle(Color(.surfaceOnSurface))
                        Spacer()
                    })
                    .padding(.init(top: 24, leading: 14, bottom: 24, trailing: 14))
                    
                    Divider()
                        .background(Color(.outlineOutlineVariant))

                    Button(action: {
                        send(.contributersTapped)
                    }, label: {
                        Label("Contributers", systemImage: "person.3")
                            .foregroundStyle(Color(.surfaceOnSurface))
                        Spacer()
                    })
                    .padding(.init(top: 24, leading: 14, bottom: 24, trailing: 14))

                    Divider()
                        .background(Color(.outlineOutlineVariant))

                    Button(action: {
                        send(.sponsorsTapped)
                    }, label: {
                        Label("Sponsors", systemImage: "building.2")
                            .foregroundStyle(Color(.surfaceOnSurface))
                        Spacer()
                    })
                    .padding(.init(top: 24, leading: 14, bottom: 24, trailing: 14))

                    Divider()
                        .background(Color(.outlineOutlineVariant))

                }
                
            }
            .padding(.horizontal, 16)
        }
        .background(Color(.background))
    }
}

#Preview {
    AboutView(store: .init(initialState: .init(), reducer: { AboutReducer() }))
}
