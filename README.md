# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Browser authentication

The React client uses a server-side session. `POST /api/v1/auth/login` sets a host-only,
`HttpOnly`, `SameSite=Strict` cookie and returns the user and a CSRF token, not an access
token. `GET /api/v1/auth/me` restores the user and CSRF token after a page reload.
`POST /api/v1/auth/logout` requires the CSRF token and deletes the session record.
Bearer JWT headers are no longer accepted by the browser API.

Run `bin/rails db:migrate` before deploying the API. The `auth_sessions` table stores
only a SHA-256 digest of each random session identifier. Run
`bin/rails auth:prune_sessions` periodically to remove expired records.

Set `FRONTEND_ORIGINS` to the exact HTTPS origin of the React app in production,
for example `https://app.example.com`. Multiple origins can be comma separated.
The frontend and API must be on the same site for `SameSite=Strict` cookies; the
frontend must send requests with credentials. The API must be served over HTTPS.
When HTTPS terminates at a reverse proxy, forward the original protocol so Rails
recognizes secure requests.

Sessions expire on the server after 12 hours by default, or after 30 days when
“Remember me” is selected. Browser session cookies have no persistent expiry by
default; remembered cookies expire with the server session. State-changing requests
require an allowed `Origin` and the `X-CSRF-Token` header from login or `/me`.
The login endpoint requires an allowed `Origin` but does not require a CSRF token.
