//
//  RecipeView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 18/05/2022.
//

import AlertToast
import StepperView
import SwiftUI

struct RecipeView: View {
    @StateObject private var viewModel: ViewModel
    @EnvironmentObject var dataController: DataController
    @EnvironmentObject var favorites: Favorites
    @EnvironmentObject var modelData: ModelData
    
    @State private var isPressed = false
    @State private var viewState: CGSize = .zero
    @State private var isDraggable = true
    
    let recipe: Recipe
    
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                    .padding(.bottom)
                
                content
                    .offset(y: 250)
                    .padding(.bottom, 290)
                //                    .padding(.bottom, 340)
            }
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: viewState.width / 3, style: .continuous))
            .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 10)
            .scaleEffect(viewState.width / -500 + 1)
            .background(.black.opacity(viewState.width / 500))
            .background(.ultraThinMaterial)
            .gesture(isDraggable ? drag : nil)
            .ignoresSafeArea()
            
            button
        }
        .alert("Dodać do listy zakupów?", isPresented: $viewModel.addToList) {
            Button("Dodaj") {
                dataController.addItem(recipe: viewModel.recipe)
                dataController.showAddedToast.toggle()
            }
            Button("Anuluj", role: .cancel) {}
        }
        .toast(isPresenting: $dataController.showAddedToast) {
            AlertToast(type: .complete(.green), title: "Dodano do listy zakupów")
        }
        .onAppear {
            withAnimation(.easeOut.delay(0.3)) {
                viewModel.appear[0] = true
            }
            withAnimation(.easeOut.delay(0.4)) {
                viewModel.appear[1] = true
            }
            withAnimation(.easeOut.delay(0.5)) {
                viewModel.appear[2] = true
            }
        }
        .onChange(of: show) { newValue in
            fadeOut()
        }
    }
    
    var content: some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading, spacing: 30) {
                Text("Składniki")
                    .font(.headline)
                
                HStack {
                    Stepper {
                        Text("Porcje: \(viewModel.portions)")
                    } onIncrement: {
                        print("zwiekszone o 1")
                        viewModel.portions += 1
                    } onDecrement: {
                        print("zmniejszone o 1")
                        viewModel.portions -= 1
                    }
                }
                
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    IngredientRowView(ingredient: ingredient)
                }
                
                Divider()
                
                Text("Przygotowanie")
                    .font(.headline)
                
                StepperView()
                    .addSteps(viewModel.steps)
                    .indicators(viewModel.indicationTypes)
                    .stepIndicatorMode(StepperMode.vertical)
                    .lineOptions(StepperLineOptions.custom(0, .green))
                    .spacing(30)
                
                
                Divider()
                Text("Wartości odżywcze na porcje")
                    .font(.headline)
                //                    .padding(.bottom, 30)
            }
            .padding(.horizontal)
            
            HStack(spacing: 10) {
                NutritionView(recipe: recipe)
            }
            .padding(.vertical)
            .background(Color.primary.opacity(0.1))
            .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
            .opacity(viewModel.appear[2] ? 1 : 0)
        }
        .opacity(viewModel.appear[2] ? 1 : 0)
    }
    
    var review: some View {
        VStack(spacing: 25) {
            VStack {
                HStack {
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                }
                
                Text("Oceń")
                    .font(.footnote)
                    .padding(.top, 5)
            }
            .opacity(viewModel.appear[1] ? 1 : 0)
            
            HStack(spacing: 20) {
                Button {
                    if favorites.contains(recipe) {
                        favorites.remove(recipe)
                    } else {
                        favorites.add(recipe)
                    }
                    withAnimation(.spring(response: 0.9, dampingFraction: 0.9, blendDuration: 0.9)) {
                        isPressed.toggle()
                    }
                    
                } label: {
                    //                    Label("Heart", systemImage: favorites.contains(recipe) ? "heart.fill" : "heart")
                    //                        .matchedGeometryEffect(id: "likeButton", in: namespace)
                    //                        .labelStyle(.iconOnly)
                    //                        .rotationEffect(.degrees(isPressed ? 360 : 0))
                    //
                    //                    Text("542")
                    ////
                    Image(systemName: favorites.contains(recipe) ? "heart.fill" : "heart")
                        .matchedGeometryEffect(id: "likeButton", in: namespace)
                        .rotationEffect(.degrees(isPressed ? 360 : 0))
                    
                    Text("542")
                    
                }
                .foregroundColor(.green)
                
                Button {
                    viewModel.addToList = true
                } label: {
                    Image(systemName: "cart.badge.plus")
                        .foregroundColor(.primary)
                    Text("Dodaj do listy zakupów")
                }
                
                Button {
                    //MARK: TODO
                } label: {
                    Image(systemName: "square.and.arrow.up")
                    Text("Wyślij")
                }
            }
            .opacity(viewModel.appear[2] ? 1 : 0)
            .foregroundColor(.primary)
            .font(.system(size: 15))
            //            .padding(.vertical)
            
            HStack(spacing: 10) {
                RecipeDetailView(recipe: recipe)
            }
            .opacity(viewModel.appear[2] ? 1 : 0)
            .padding(.vertical)
            .background (
                Color.primary.opacity(0.1),
                in: RoundedRectangle(cornerRadius: 30, style: .continuous)
            )
            .opacity(viewModel.appear[2] ? 1 : 0)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.top)
    }
    
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .global).minY
            
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
            .foregroundColor(.black)
            .background {
                Image(recipe.id)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "image\(recipe.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
            }
            .mask {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(recipe.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            }
            .overlay {
                overlayCover
                    .offset(y: scrollY > 0 ? scrollY * -0.6 : 0)
            }
        }
        .frame(height: 500)
    }
    
    var overlayCover: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(recipe.name)
                .font(.title2.bold())
                .matchedGeometryEffect(id: "title\(recipe.id)", in: namespace)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 10)
                .opacity(viewModel.appear[0] ? 1 : 0)
            
            Divider()
                .opacity(viewModel.appear[0] ? 1 : 0)
            
            review
            
        }
        .padding(20)
        .background {
            Rectangle()
                .fill(.thinMaterial)
                .mask {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                }
        }
        .opacity(viewModel.appear[0] ? 1 : 0)
        .offset(y: 330)
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                guard value.translation.width > 0 else { return }
                
                if value.startLocation.x < 80 {
                    withAnimation(.closeCard) {
                        viewState = value.translation
                    }
                }
                if viewState.width > 120 {
                    close()
                }
            }
            .onEnded { value in
                if viewState.width > 80 {
                    close()
                } else {
                    withAnimation(.closeCard) {
                        viewState = .zero
                    }
                }
            }
    }
    
    var button: some View {
        Button {
            withAnimation(.closeCard) {
                show.toggle()
                modelData.showDetail.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.bold())
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
    
    func fadeOut() {
        viewModel.appear[0] = false
        viewModel.appear[1] = false
        viewModel.appear[2] = false
    }
    
    func close() {
        withAnimation(.closeCard.delay(0.3)) {
            show.toggle()
            modelData.showDetail.toggle()
        }
        withAnimation(.closeCard) {
            viewState = .zero
        }
        
        isDraggable = false
    }
    
    init(recipe: Recipe, show: Binding<Bool>, namespace: Namespace.ID) {
        self.recipe = recipe
        _viewModel = StateObject(wrappedValue: ViewModel(recipe: recipe))
        self._show = show
        self.namespace = namespace
    }
    
}

struct RecipeView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        Group {
            RecipeView(recipe: Recipe.example, show: .constant(true), namespace: namespace)
        }
        .environmentObject(ModelData())
        .environmentObject(DataController())
        .environmentObject(Favorites())
    }
}
