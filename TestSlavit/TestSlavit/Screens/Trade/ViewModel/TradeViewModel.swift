//
//  TradeViewModel.swift
//  TestSlavit
//
//  Created by Кирилл Коновалов on 19.10.2023.
//

import SwiftUI

class TradeViewModel: ObservableObject {
    @Published var selectCurrencyPair = "GPB / USD"
    @Published var url: String = "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP"
    @Published var shouldRefresh = false
    
    @Published var currencyPair: [CurrencyPairModel] = [
        CurrencyPairModel(name: "EUR / USD", url: "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21", isActive: false),
        CurrencyPairModel(name: "GPB / USD", url: "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP", isActive: true),
        CurrencyPairModel(name: "EUR / USD", url: "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21", isActive: false),
        CurrencyPairModel(name: "GPB / USD", url: "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP", isActive: false),
        CurrencyPairModel(name: "EUR / USD", url: "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21", isActive: false),
        CurrencyPairModel(name: "GPB / USD", url: "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP", isActive: false),
        CurrencyPairModel(name: "EUR / USD", url: "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21", isActive: false),
        CurrencyPairModel(name: "GPB / USD", url: "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP", isActive: false),
        CurrencyPairModel(name: "EUR / USD", url: "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21", isActive: false),
        CurrencyPairModel(name: "GPB / USD", url: "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP", isActive: false),
        CurrencyPairModel(name: "EUR / USD", url: "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21", isActive: false),
        CurrencyPairModel(name: "GPB / USD", url: "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP", isActive: false),
        CurrencyPairModel(name: "EUR / USD", url: "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21", isActive: false),
        CurrencyPairModel(name: "GPB / USD", url: "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP", isActive: false),
    ]
}
