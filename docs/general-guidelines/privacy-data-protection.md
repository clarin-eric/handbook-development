# Privacy and data protection

Include (reference to) terms and conditions in each user facing application: [https://www.clarin.eu/content/terms-use-and-disclaimer](https://www.clarin.eu/content/terms-use-and-disclaimer)

Recommendations on what kind of user information applications should collect
SERVER SIDE:

In general store as little as possible.

- Username
   - IFF user needs to be identified uniquely; there is some kind of persistent
   user specific state/profile
- Password / token
   - IFF AAI solution is not available/applicable
- Names
   - IFF prompted (user has full control)
   - Should not be adopted from the IdP
- email address
   - IFF requirements include communicating to the user via e-mail
   - Note: if username is e-mail address it can be stored as such, but therefore
   not recommended
   - Note: EPPN cannot be assumed to be a (working) e-mail address
- IP address
   - IFF required for white/black listing
   - If possible, securely hashed
   - If possible, anonymized
- behavioural data (stats)
   - Should be anonymized; use Matomo
   - Trace of actions (e.g. last login or full audit log)
      - IFF functionality depends on it, and user is informed and/or on opt-in basis

It must be possible to delete personal data if requested.
