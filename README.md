# Dokumentace API Flask

Tato dokumentace poskytuje informace o Flask Blog API, které umožňuje uživatelům interakci s jednoduchým systémem blogování. API zahrnuje koncové body pro vytváření, získávání, aktualizaci a mazání blogových příspěvků. K některým operacím je vyžadována autentizace na základě tokenu poskytnutého v hlavičkách požadavků.  
Odkaz na server: http://16.171.64.109:5000/

## Endpoints

#### 1. Získat všechny blogové příspěvky  
Koncový bod: /api/blog  
Metoda: GET  
Popis: Získá všechny blogové příspěvky.  
Autentizace: Vyžadováno (Hlavička Authorization s platným tokenem).  
Odpověď: JSON pole obsahující blogové příspěvky.  

#### 2. Získat konkrétní blogový příspěvek  
Koncový bod: /api/blog/<int:blog_id>  
Metoda: GET  
Popis: Získá konkrétní blogový příspěvek podle jeho ID.  
Autentizace: Vyžadováno (Hlavička Authorization s platným tokenem).  
Odpověď: JSON objekt představující blogový příspěvek. Pokud není nalezen, vrátí chybovou zprávu.  

#### 3. Vytvořit blogový příspěvek  
Koncový bod: /api/blog  
Metoda: POST  
Popis: Vytvoří nový blogový příspěvek.  
Autentizace: Vyžadováno (Hlavička Authorization s platným tokenem).  
Požadavek: JSON objekt s title, content a author_id.  
Odpověď: Zpráva o úspěchu nebo chybová zpráva, pokud není autorizováno.  

#### 4. Aktualizovat blogový příspěvek  
Koncový bod: /api/blog/<int:blog_id>  
Metoda: PATCH  
Popis: Aktualizuje existující blogový příspěvek.  
Autentizace: Vyžadováno (Hlavička Authorization s platným tokenem).  
Požadavek: JSON objekt s volitelnými poli title a content.  
Odpověď: Zpráva o úspěchu nebo chybová zpráva, pokud blogový příspěvek není nalezen nebo není autorizován.  

#### 5. Smazat blogový příspěvek  
Koncový bod: /api/blog/<int:blog_id>  
Metoda: DELETE  
Popis: Smaže konkrétní blogový příspěvek podle jeho ID.  
Autentizace: Vyžadováno (Hlavička Authorization s platným tokenem).  
Odpověď: Zpráva o úspěchu nebo chybová zpráva, pokud blogový příspěvek není nalezen nebo není autorizován.  

#### 6. Řešení chyb  
Koncový bod pro řešení chyb: /error/<int:error_code>  
Metoda: GET  
Popis: Řeší HTTP chyby (např. 404 - Stránka nenalezena).  
Odpověď: JSON objekt s chybovou zprávou.  




