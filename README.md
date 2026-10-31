# Kalkulator prowizji

Prosta aplikacja w przeglądarce (działa na telefonie) do liczenia prowizji od faktur klientów.

- start od ekranu głównego: najpierw handlowiec i stawka, potem „+ Dodaj klienta”,
- dla każdego klienta: nazwa, za co (opcjonalnie), nr faktury (opcjonalnie), data, kwota netto albo brutto (przełącznik, VAT 23/8/5/0%),
- lista kosztów stałych (domyślnie godziny pracowników z przelicznikiem rbg × stawka oraz materiały; można dodawać kolejne),
- prowizja domyślnie 20% od kwoty netto minus koszty; stawkę, podstawę i osobę ustawiasz na samej górze ekranu głównego,
- pole „Kogo dotyczy prowizja” (imię i nazwisko widoczne w nagłówku PDF),
- suma prowizji ze wszystkich klientów na górze ekranu,
- w kafelku klienta widać, z czego składają się koszty,
- zestawienie w PDF dla jednego klienta albo dla wszystkich (jsPDF z cdnjs, czcionka Carlito na licencji SIL OFL wbudowana w plik).

## Logowanie i historia faktur (Supabase)

Gdy w `index.html` wpisane są `SUPABASE_URL` i `SUPABASE_ANON_KEY`, kalkulator:

- wymaga logowania e-mailem i hasłem (zakładanie konta, reset hasła),
- zapisuje ustawienia handlowca i wszystkie faktury w bazie Supabase na stałe,
- pokazuje historię z filtrem po miesiącach (domyślnie bieżący miesiąc),
- przy każdej fakturze ma ptaszek „W raporcie”; raport PDF zawiera tylko zaznaczone pozycje z wybranego miesiąca,
- każdy handlowiec widzi tylko swoje dane (Row Level Security),
- proponuje przeniesienie klientów zapisanych wcześniej tylko w przeglądarce.

Gdy te pola są puste, kalkulator działa jak wcześniej: bez logowania, dane w localStorage.

### Konfiguracja bazy

1. W Supabase: SQL Editor → New query → wklej `supabase/schema.sql` → Run.
2. Project Settings → API: skopiuj Project URL i klucz `anon public` do stałych na początku skryptu w `index.html`.
3. Authentication → URL Configuration: w „Site URL” wpisz adres, pod którym działa aplikacja (np. adres z Netlify), żeby linki z maili (potwierdzenie konta, reset hasła) wracały do aplikacji.
4. Gdy wszyscy handlowcy założą konta, można wyłączyć zakładanie nowych kont (Authentication → Sign In / Providers → „Allow new users to sign up”) i dodawać kolejne osoby przez „Invite user”.

Klucz `anon public` jest jawny z założenia; dostęp do danych chronią reguły RLS w bazie. Klucza `service_role` nigdy nie wpisuj do pliku.

## Uruchomienie

To jeden plik `index.html`. Można go wystawić pod linkiem na kilka sposobów:

- **Netlify Drop**: wejdź na https://app.netlify.com/drop i przeciągnij folder z plikiem `index.html`,
- **GitHub Pages**: Settings → Pages → branch `main`, folder `/`.

---

© 2026 Wojciech Wieczorek
