# iOS-app-2022

## Tytuł aplikacji

ETH Wallet Manager App

## Autor

- Szymon Lepianka, slepianka@wp.pl (slepianka@student.agh.edu.pl)

## Wizja aplikacji

- Zarządzanie portfelami Ethereum.
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

1. web3swift, https://github.com/web3swift-team/web3swift ; Biblioteka zostanie użyta do tworzenia nowych portfeli, transferu funduszy. Pierwotnie próbowałem użyć EthereumKit. Jednak okazało się, że biblioteka nie można się zbudować, przez problemy z zależnościami.
2. ActivityIndicatorView, https://github.com/exyte/ActivityIndicatorView ; Biblioteka zapewniająca szereg gotowych wskaźników ładowania. Zostanie użyta do wizualizacji ładowania podczas odświeżania danych o kontach Blockchain (co może trwać kilka(naście) sekund). Początkowo rozważane były biblioteki zapewniające pull-to-refresh (PullToBounce, pull-to-refresh), ale okazało się, że ten mechanizm jest wbudowany w SwiftUI.

## Dane

Przetwarzane i przechowywane będą dane kont ETH, takie jak:
- dane publiczne kont ETH:
  - adres konta, 
  - balans konta,
  - typ konta,
  - nazwa konta,
- dane prywatne kont ETH:
  - klucz prywatny, 
  - seed phrase (mnemonics).

## Interfejs użytkownika

### Widok 1 – CardView

![image](https://user-images.githubusercontent.com/48469955/210276502-91778a71-8444-4ede-9c65-22cdc62de543.png)

#### Zadanie

- Wyświetlanie pojedynczego elementu (portfela), który będzie zawarty w liście portfeli danego użytkownika. 
- Wyświetla nazwę, adres oraz balans danego portfela.

### Widok 2 – DetailView

![image](https://user-images.githubusercontent.com/48469955/210276573-7d351dca-1cde-4552-8a60-1e6b5200603c.png)

#### Zadanie

- Wyświetlanie szczegółów danego portfela. 
- Przycisk do wygenerowania kodu QR z adresem danego portfela. 
- Możliwość zeskanowania kodu QR innego użytkownika, aby móc przesłać fundusze. (nie udało się wykonać) 

### Widok 3 – WalletView

![image](https://user-images.githubusercontent.com/48469955/210276766-d62216df-2f2c-4199-8c2b-a6f66561cc67.png)

#### Zadanie

- Wyświetlanie listy portfeli użytkownika (każdy element zawiera podstawowe informacje o portfelu). 
- Dostępny jest przycisk pozwalający na wygenerowanie nowego portfela. 
- Dosępny jest przycisk pozwalający na odświeżenie informacji o portfelach. 
- Widok pojawia się po uruchomieniu aplikacji.

### Widok 4 – DetailEditView

![image](https://user-images.githubusercontent.com/48469955/210345744-7b504168-3c98-4ea4-b681-1d617b3a8e24.png)

#### Zadanie

- Edycja danych o danym portfelu.
- Możliwość zatwierdzenia lub odrzucenia zmian.

### Widok 5 – QrCodeView

![image](https://user-images.githubusercontent.com/48469955/210276902-ae29e06c-581d-4024-8a8d-b83f7eafcd15.png)

#### Zadanie

- Wyświtlanie wygenerowanego kodu QR zawierającego dane (m.in. adres konta ETH użytkownika), za pomocą których będzie można wykonać transfer funduszy.

## Scenariusze użycia

### Scenariusz 1 - przegląd szczegółów swoich portfeli

1. Użytkownik uruchamia aplikację. 
2. Widzi listę swoich portfeli (nazwę, balans, adres).
3. Klika w wybrany portfel.
4. Użytkownik widzi szczegóły danego portfela (m.in. klucz prywatny, seed phrase, sieć).

### Scenariusz 2 - edycja szczegółów portfela

1. Użytkownik uruchamia aplikację. 
2. Widzi listę swoich portfeli.
3. Klika w wybrany portfel.
4. Klika w przycisk do edycji portfela.
5. Użytkownik edytuje dane (np. nazwę) portfela.
6. Po zapisaniu dostępne są zaktualizowane dane.

### Scenariusz 3 - generowanie nowego portfela

1. Użytkownik uruchamia aplikację. 
2. Widzi listę swoich portfeli.
3. Klika w przycisk do wygenerowania nowego portfela.
4. Wprowadza swoją nazwę dla tego portfela.
5. Portfel zostaje wygenerowany - znajduje się na liście portfeli.

![image](https://user-images.githubusercontent.com/48469955/210345512-3489173a-9b5d-463b-94a1-3bbd35caf126.png)

![image](https://user-images.githubusercontent.com/48469955/210345635-04bf9f26-b21a-4df7-9902-04f8e4c52e37.png)

![image](https://user-images.githubusercontent.com/48469955/210345669-57eaffb9-35e3-4030-aff9-d7256651c3db.png)

### Scenariusz 4 – transfer funduszy na inne konto (jako nadawca)

1. Użytkownik uruchamia aplikację. 
2. Widzi listę swoich portfeli.
3. Klika w wybrany portfel.
4. Klika skaner kodów QR. (nie wystarczyło czasu na wykonanie tego punktu)
5. Po zeskanowaniu potwierdza dane przelewu (adres odbiorcy, ilość, sieć).
6. Fundusze zostają przesłane na dane konto, a stan konta użytkownika zostaje pomniejszony o daną kwotę.

### Scenariusz 5 – transfer funduszy na inne konto (jako odbiorca)

1. Użytkownik uruchamia aplikację. 
2. Widzi listę swoich portfeli.
3. Klika w wybrany portfel.
4. Klika generator kodu QR.
5. Udostępnia do zaskanowania kod dla zadawcy.
6. Fundusze zostają przesłane na dane konto, a stan konta użytkownika zostaje pomniejszony o daną kwotę.

### Scenariusz 6 - odświeżanie danych o kontach użytkownika

1. Użytkownik uruchamia aplikację. 
2. Widzi listę swoich portfeli.
3. Klika w przycisk do odświeżania danych o swoich portfelach.
4. Wyświetlanie zostaje ładowanie się - akcja w trakcie.
5. Informacje zostają odświeżone - lista portfeli jest zaktualizowana.

![image](https://user-images.githubusercontent.com/48469955/210345403-2004c765-352f-4a17-b86c-ecb71f9b100f.png)

## Wybrane rozwiązanie do przechowywania danych

Core Data

### Opis

Udało się wykonać połączenie z bazą danych (za pomocą PersistenceController.swift). W pliku EthWalletManagerAppApp.swift znajdują się:
- func temp() - pozwalająca na odczyt danych z bazy,
- func temp2() - pozwalająca na zapis danych do bazy.
Nie zostało wykonane połączenie odczytu i zapisu z interfejsem użytkownika, za względu na brak czasu. Jedynie udało się wykonać przykładowe zapisy i odczyty danych hardcoded. 

![image](https://user-images.githubusercontent.com/48469955/210344613-6989598a-8a9f-4424-a03c-1486901d3afd.png)

## Model danych
Stworzona encja:
1. EWallet - każdy rekord odpowiada danemu portfelowi

Atrybuty: 

- title: String - nazwa portfela
- address: String - adres (klucz publiczny) portfela
- privateKey: String - klucz prywatny (hasło) portfela
- balance: Double - ilość funduszy na koncie
- type: String - typ portfela (bez albo z seed phrase)
- mnemonics: String - opcja odzyskania portfela, losowe 12 słów
    
![image](https://user-images.githubusercontent.com/48469955/210343866-fefcff91-385e-472d-9ef6-e4eeb6217d76.png)


