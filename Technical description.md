# Adatbázis

## Import
Az importálás folyamata

1. Eltávolítottam a fejlécet úgy hogy a `.txt` fájlokból kitörlöm az első sort.
2. Beolvastam az adatokat a fájlokból. Ha nem kell kovertálni, vagy más funkciók ahhoz hogy az adatok helyesen bekerüljenek a táblába akkor ez a legrövidebb és legjobb megoldás.
3. `C:\xampp\mysql\data\hangos` Ide kell elhelyezni a kapott fájlt és ezzel a paranccsal belehet olvasni a fájlokat a kívánt táblákba.
```sql
delete from films;
LOAD DATA INFILE  './hangos/film.txt' INTO TABLE films;
delete from tasks;
LOAD DATA INFILE  './hangos/feladat.txt' INTO TABLE tasks;
delete from persons;
LOAD DATA INFILE  './hangos/szemely.txt' INTO TABLE persons;
```
## package json
- Átlépés a server mappába: `cd server`
- package.json telepítése: `npm init`

## Letöltendő modulok
Globális: 
- nodemon (ha még nincs letöltve): `npm i -g nodemon`
Lokális:
- [express](https://www.npmjs.com/package/express): `npm i express`
- [mysql](https://www.npmjs.com/package/mysql): `mpm i mysql`
- [sanitize-html](https://www.npmjs.com/package/sanitize-html): `npm i sanitize-html`
- [dotenv](https://www.npmjs.com/package/dotenv): `npm i dotenv`
- [bcrypt](https://www.npmjs.com/package/bcrypt): `npm i bcrypt`
- [cors](https://www.npmjs.com/package/cors): `npm i cors`
- [jsonwebtoken](https://www.npmjs.com/package/jsonwebtoken): `npm i jsonwebtoken`

## dev script megírása (package.json)
```json
"scripts": {
    "dev": "nodemon serverData.js",
    "devauth": "nodemon serverAuth.js"
  },
```

## Projekt indítása
1. Data szerver indítása: `npm run dev`
2. Auth szerver indítása: `npm run devauth`



## trips hozzárakása a cars-hoz
A `get /films:id` és ilyen választ generálunk:
```sql
{
  "success": 1,
  "message": "ok",
  "data": {
    "id": 4,
    "title": "Alkalom",
    "production": 1942,
    "length": 76,
    "presentation": "1942.10.26",
    "links": ""
  }
}
```

A megvalósítása:
```js
app.get("/films/:id", (req, res) => {
  const id = req.params.id;
  let sql = `
    SELECT id, title,  production, length, DATE_FORMAT(presentation, '%Y.%m.%d') presentation, links FROM films
    WHERE id = ?`;

  pool.getConnection(function (error, connection) {
    if (error) {
      sendingGetError(res, "Server connecting error!");
      return;
    }
    connection.query(sql, [id], async function (error, results, fields) {
      if (error) {
        const message = "Films sql error";
        sendingGetError(res, message);
        return;
      }
      if (results.length == 0) {
        const message = `Not found id: ${id}`;
        sendingGetError(res, message);
        return;
      }
      sendingGetById(res, null, results[0], id);
    });
    connection.release();
  });
});
```



## A hitelesítő szerver feladatai
A hitelesítő szerver: `serverAuth.js`
- külön porton működik: pl: 4000
- három feladata van
  1. login: a user nevére ad két tokent: accessToken (dőkorlátos: pl. 15 perc), refreshToken
  2. token: a refreshToken-el úk időkorlátos token adása
  3. logout: a refreshToken-el lehet kikejelentkezni


## Frissítési token értelme
Az nem jó megoldás, hogy a felhasználóink kapnak egy tokent, amit örökre használhatnak
A megoldás:
- A normál tokenek rövid lejáratúak: 10-15 perc
- Ha valaki megszerzi a tokenemet, az csak néhány percig használhatja
- A refresh tokeneket elmentjük egy biztonságos helyre
- Az új token beszerzéséhez a frissítési tokent kell használni
- A logout törli a frissítési tokeneket és a rabló már nem tud mit kezdeni az ellopott tokenekkel


# JWT token
branch: 12_jwt_autentikáció
- [Mi a jwt token](https://www.youtube.com/watch?v=7Q17ubqLfaM)
- [a jwt részei, tartalma](https://jwt.io/)

## JWT autentikáció
### Telepített modulok
- express: `npm i express`
- jwt: `npm i jsonwebtoken`
- .env fájl kezelés: titkos információk tárolása: `npm i dotenv`

### random hexa sztring létrehozása
Generálunk egy 64 bájtos véletlen hexa számot
```cmd
node
> require('crypto').randomBytes(64).toString('hex')
```

### .env fájl
- Itt tároljuk a "titkos" dolgokat, nem a kódban.
- A kódból ezt érjük el.

.env fájl
```env
ACCESS_TOKEN_SECRET = b7bc72b8788c983bf2b27441257b4feb3fd85d7cd0b432c87013dbd4dfeb3157317e7260e5a2542b5ba50d8c91a1d1bdf19de8d1b2c7b42b45cc11e981511d2a
REFRESH_TOKEN_SECRET = f345068c2975d477d6ad3964bec80330b99af59aee9106c37ec01a18c7be76154413b916abd984cf2eb46b3029de97408e74ada9a3285d33757db89c5daf6124
```

### A jwt autentikáció elve
1. A /login ágon megadjuk hogy kik vagyunk:
```json
{
    "username": "Jim"
}
```

2. Válaszképpen kapunk egy tokent:
```json
{
  "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiSmltIiwiaWF0IjoxNjczODA1NDYxfQ.SM3mvSojMi_SXSeGEen1UZGhO-w0nlVJPlCHkg6lYPo"
}
```
    - A token titkosítva tartalmazza "Jim"-et

3. Amikor adatot kérünk le, ezt a tokent
    - az `Authorization` kulcs `Bearer` (tulajdonos) `token` érték párral átküldjük a fejlécben:
```js
get http://localhost:3000/posts
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiSmltIiwiaWF0IjoxNjczODA1NDYxfQ.SM3mvSojMi_SXSeGEen1UZGhO-w0nlVJPlCHkg6lYPo

```