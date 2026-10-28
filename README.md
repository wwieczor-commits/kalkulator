# Kalkulator prowizji

Prosta aplikacja w przeglądarce (działa na telefonie) do liczenia prowizji od faktur klientów.

- dla każdego klienta: nazwa, za co, data, kwota netto lub brutto (VAT 23/8/5/0%),
- lista kosztów stałych (materiały, robocizna, transport…),
- prowizja domyślnie 20% od kwoty netto minus koszty; stawkę i podstawę zmienisz w „Ustawieniach prowizji”,
- suma prowizji ze wszystkich klientów na górze ekranu.

Dane zapisują się w pamięci przeglądarki (localStorage) na danym urządzeniu.

## Uruchomienie

To jeden plik `index.html` bez zależności. Wystarczy go otworzyć w przeglądarce
albo włączyć GitHub Pages (Settings → Pages → branch `main`, folder `/`).
