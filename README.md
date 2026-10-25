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
`bin/rails auth:prune_sessions` periodically to remove expired short sessions.

Set `FRONTEND_ORIGINS` to the exact HTTPS origin of the React app in production,
for example `https://app.example.com`. Multiple origins can be comma separated.
The frontend and API must be on the same site for `SameSite=Strict` cookies; the
frontend must send requests with credentials. The API must be served over HTTPS.
When HTTPS terminates at a reverse proxy, forward the original protocol so Rails
recognizes secure requests.

Without “Remember me”, the server expires the session after five minutes without
user activity. The React app sends `POST /api/v1/auth/activity` at most every 30
seconds while clicks, typing, or touch occur; ordinary background API requests do
not extend the timeout. At its idle deadline, the browser sends one
`POST /api/v1/auth/idle_expire`. The API uses the cookie to identify the exact
session, validates the CSRF token, and deletes the record only if it is expired.
If another tab extended it, the API returns the remaining idle time instead.
The API deletes the expired session record when it is next presented. Run
`auth:prune_sessions` periodically to remove expired records never presented again.
`POST /api/v1/auth/heartbeat` checks whether the cookie still identifies an active
session. The React app calls it every 30 seconds and on return to a visible tab;
a deleted or expired session returns 401. A valid heartbeat also returns the
remaining idle time. The heartbeat requires the CSRF token
and does not extend the idle timeout or rotate the cookie token.

Remembered sessions have no server expiry. Their opaque cookie token rotates after
five minutes on the next `/me` or `POST /api/v1/auth/refresh` request. The browser
calls refresh while the app is open; a closed or suspended browser cannot rotate
exactly on time. The old token remains valid for 30 seconds to let concurrent
requests finish. The persistent cookie has a rolling one-year browser expiry and
is renewed when the token rotates; browsers cannot guarantee a permanent cookie.
Existing sessions are expired once by the renewal migration, requiring login again.

State-changing requests require an allowed `Origin` and the `X-CSRF-Token` header
from login or `/me`. The login endpoint requires an allowed `Origin` but does not
require a CSRF token.
