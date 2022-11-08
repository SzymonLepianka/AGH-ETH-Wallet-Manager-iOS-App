# iOS-app-2022

# Specyfikacja realizowanej aplikacji

## Tytuł aplikacji

ETH wallet manager app

## Autor

- Szymon Lepianka, slepianka@wp.pl

## Wizja aplikacji

Zarzadzanie portfelami Ethereum:
- Mozliwosc wygenerowania nowego portfelu w wybranej sieci (glownej lub jednej z testowych).
- Mozlwiosc transferu funduszy na inne konto.

- Widok z lista portfeli uzytkownika (mozliwosc dodania nowego portfela).
- Widok ze szczegolami porfelu (mozliwosc tranferu funduszy - skan kodu qr innego uzytkownika, zawierajacy adres konta ETH) 

## Wymagania

<Krótka charakterystyka wymagań funkcjonalnych i pozafunkcjonalnych>

## Wykorzystane narzędzia

### Framework(i) iOS SDK

<Wykaz wykorzystanych frameworków wchodzących w skład iOS SDK, takich jak np. Core ML – co najmniej 1 szt.>
CoreImage - generowanie i skanowanie kodow QR zawierajacych adres konta ETH uzytkownika, na ktory maja zostac przeslane fundusze.

### Frameworki/biblioteki zewnętrzne

1. <Tytuł, URL strony (np. Github), krótki opis do czego będzie używany>
https://github.com/yuzushioh/EthereumKit , tworzenie nowych portfeli, transfer funduszy
2. <Tytuł, URL strony (np. Github), krótki opis do czego będzie używany>
https://github.com/takuoka/PullToBounce , odswiezanie w widoku szczegolow portfelu, aby sprawdzic czy np. fundusze zostaly przeslane

## Dane

<Jakie dane będą przetwarzane i przechowywane w aplikacji, które będą podlegały utrwaleniu (persystencji)>

- dane publiczne kont ETH:
  - ich adres, balans,
- dane prywatne kont ETH:
  - klucz prywatny, seed phrase

## Repozytorium

<Adres strony głównej repozytorium GitHub, Gitlab, itd.>
https://github.com/SzymonLepianka/iOS-app-2022
