# Kalkulator prowizji

Prosta aplikacja w przeglądarce (działa na telefonie) do liczenia prowizji od faktur klientów.

- przy pierwszym uruchomieniu od razu otwiera się pusty formularz,
- dla każdego klienta: nazwa, za co, data, kwota netto albo brutto (przełącznik, VAT 23/8/5/0%),
- lista kosztów stałych (domyślnie godziny pracowników z przelicznikiem rbg × stawka oraz materiały; można dodawać kolejne),
- prowizja domyślnie 20% od kwoty netto minus koszty; stawkę i podstawę zmienisz przyciskiem „Zmień” na ekranie głównym,
- suma prowizji ze wszystkich klientów na górze ekranu,
- w kafelku klienta widać, z czego składają się koszty,
- zestawienie w PDF dla jednego klienta albo dla wszystkich (jsPDF z cdnjs, czcionka Carlito na licencji SIL OFL wbudowana w plik).

Dane zapisują się w pamięci przeglądarki (localStorage) na danym urządzeniu.

## Uruchomienie

To jeden plik `index.html` bez zależności. Wystarczy go otworzyć w przeglądarce
albo włączyć GitHub Pages (Settings → Pages → branch `main`, folder `/`).
