//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

import Datasets
import TensorFlow

/// **Listing 4-2**. Demonstrate epochs and batches
let dataset = MNIST(batchSize: 64)
let epochCount = 2

epochLoop: for (epochStep, epoch) in dataset.training.prefix(epochCount).shuffled().enumerated() {
    batchLoop: for (batchStep, batch) in epoch.enumerated() {
        let (data, label) = (batch.data, batch.label)
        print("epochStep: \(epochStep) | batchStep: \(batchStep) | data shape: \(data.shape) | label shape: \(label.shape)")
        break epochLoop
    }
}

