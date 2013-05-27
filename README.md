wintersmith-redirect
====================

Page redirects where you can't modify headers. e.g. on GitHub pages.

**NOTE** If you have the ability modify headers (a .htaccess or similar) do a 301 redirect.

## Installing

Install globally or locally using npm

```
npm install [-g] wintersmith-redirect
```

or

```
wintersmith plugin install redirect
```

and add `wintersmith-redirect` to your config.json

```json
{
  "plugins": [
    "wintersmith-redirect"
  ]
}
```

## Usage

Add a redirects object to your config.json like so:

```json
{
  "redirects": {
    "old/page.html": "new/page.html",
    "gone.html": "http://example.com"
  }
}
```

## Running tests

```
npm install
npm test
```
