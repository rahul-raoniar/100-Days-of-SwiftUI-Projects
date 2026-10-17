//
//  ContentView.swift
//  InstaFilter
//
//  Created by Rahul Raoniar on 03/10/2026.
//

import SwiftUI
import PhotosUI
import CoreImage
import CoreImage.CIFilterBuiltins
import StoreKit

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 50.0
    @State private var filterScale = 5.0
    @State private var selectedItem: PhotosPickerItem?
    @State private var showingFilters = false
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview

    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Intensity: \(filterIntensity, specifier: "%.2f")")
                        Slider(value: $filterIntensity, in: 0...1)
                            .onChange(of: filterIntensity, applyProcessing)
                            .disabled(!currentFilter.inputKeys.contains(kCIInputIntensityKey))

                    }
                    
                    HStack {
                        Text("Filter Radius: \(filterRadius, specifier: "%.2f")")
                        Slider(value: $filterRadius, in: 0...200)
                            .onChange(of: filterRadius, applyProcessing)
                            .disabled(!currentFilter.inputKeys.contains(kCIInputRadiusKey))
                    }
                    
                    HStack {
                        Text("Filter Scale: \(filterScale, specifier: "%.1f")")
                        Slider(value: $filterScale, in: 0...100)
                            .onChange(of: filterScale, applyProcessing)
                            .disabled(!currentFilter.inputKeys.contains(kCIInputScaleKey))
                    }
                }
                .padding()
                HStack {
                    Button("Change Filter", action: changeFilter)
                        .disabled(processedImage == nil)
                    
                    Spacer()
                    
                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage))
                    }
                }
                
            }
            .padding([.horizontal, .vertical])
            .navigationTitle("Instafilter")
            .confirmationDialog("Select a Filter", isPresented: $showingFilters) {
                Button("Crystalize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Hexagonal Pixallate") { setFilter(CIFilter.hexagonalPixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("Cicular Wrap") { setFilter(CIFilter.circularWrap()) }
                Button("Bump Distortion") { setFilter(CIFilter.bumpDistortion()) }
                Button("Motion Blur") { setFilter(CIFilter.motionBlur()) }
                Button("Cancel", role: .cancel) { }
            }
        }
        
    }

    
    func changeFilter() {
        showingFilters = true
    }
    
    
    func loadImage() {
        Task {
            do {
                guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
                guard let inputImage = UIImage(data: imageData) else { return }
                
                let beginImage = CIImage(image: inputImage)
                currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
                
                applyProcessing()
            } catch {
                print("Unable to load image")
            }
        }
    }
        
        func applyProcessing() {
            
            let inputKeys = currentFilter.inputKeys
            
            if inputKeys.contains(kCIInputIntensityKey) {
                currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
            }
            
            if inputKeys.contains(kCIInputRadiusKey) {
                currentFilter.setValue(filterRadius, forKey: kCIInputRadiusKey)
            }
            
            if inputKeys.contains(kCIInputScaleKey) {
                currentFilter.setValue(filterScale, forKey: kCIInputScaleKey)
            }
            
            
            guard let outputImage = currentFilter.outputImage else { return }
            
            guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
            
            let uiImage = UIImage(cgImage: cgImage)
            
            processedImage = Image(uiImage: uiImage)
        }
        
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
        
        filterCount += 1
        
        if filterCount == 3 {
            requestReview()
        }
    }
}

#Preview {
    ContentView()
}
