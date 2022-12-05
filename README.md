# iOS-app-2022

# Specyfikacja realizowanej aplikacji

## Tytuł aplikacji

ETH Wallet Manager App

## Autor

- Szymon Lepianka, slepianka@wp.pl (slepianka@student.agh.edu.pl)

## Wizja aplikacji

- Zarzadzanie portfelami Ethereum.
- Możliwość wygenerowania nowego portfela w wybranej sieci (głównej lub jednej z testowych).
- Możliwość transferu funduszy na inne konto.
- Widok z listą portfeli użytkownika (możliwość dodania nowego portfela).
- Widok ze szczegółami porfela (możliwość tranferu funduszy - skan kodu QR innego użytkownika, zawierający adres konta ETH).

## Wymagania

- Aplikacja na iPhone pozwalająca na zarządzanie portfelami ETH użytkownika. 
- Aplikacja będzie pozwalała na podgląd listy swoich portfeli. 
- W widoku listy porfeli będzie możliwość dodania (wygenerowania) nowego portfela. 
- Po kliknięciu na portfel, pokażą się szczegóły danego portfela (adres, balans itp.).
- W szczegółach danego portfela będzie możliwość wykonania transferu etheru na inne konto.
- Możliwość zeskanowania kodu QR, który będzie zawierał dane do transferu ETH.  

## Wykorzystane narzędzia

### Framework(i) iOS SDK

- CoreImage - generowanie i skanowanie kodów QR zawierających dane (m.in. adres konta ETH użytkownika), za pomocą których będzie można wykonać transfer funduszy.

### Frameworki/biblioteki zewnętrzne

1. ~~EthereumKit, https://github.com/yuzushioh/EthereumKit ;~~ Biblioteka zostanie użyta do tworzenia nowych portfeli, transferu funduszy. Okazało się, że biblioteka nie można się zbudować, przez problemy z zależnościami.
2. web3swift, https://github.com/web3swift-team/web3swift ; Zamiennik EthereumKit.
3. ~~PullToBounce, https://github.com/takuoka/PullToBounce ;~~ Biblioteka zostanie użyta do odświeżenia widoku szczegołów portfela, aby sprawdzić czy np. fundusze zostały przesłane. Okazało się, że biblioteka nie jest obsługiwana przez Swift Package Manager.
4. pull-to-refresh, https://github.com/eggswift/pull-to-refresh ; Zamiennik PullToBounce.

## Dane

Przetwarzane i przechowywane będą dane kont ETH, takie jak:
- dane publiczne kont ETH:
  - adres konta, 
  - balans konta,
- dane prywatne kont ETH:
  - klucz prywatny, 
  - seed phrase.

## Repozytorium

https://github.com/SzymonLepianka/iOS-app-2022
