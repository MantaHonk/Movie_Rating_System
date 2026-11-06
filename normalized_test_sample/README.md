# Assignment query-test sample

This sample matches the table names and columns in the assignment's root `init.sql`: `Studio`, `Movie`, `Workers`, `CastMember`, `Role`, `User`, `WorksOn`, and `Rates`. It contains 30 movies and 750 sampled ratings, plus related rows needed for joins.

Import order: `Studio`, `Movie`, `Workers`, `CastMember`, `Role`, `User`, `WorksOn`, `Rates`.

Create a fresh test database and run the assignment's `init.sql` first, then `load_sample.sql` from the repository root. This package also includes a copy of the assignment `init.sql` so the dataset and setup steps can be shared together; when working in the project, use its root `init.sql` as the source of truth. Do not use the separate live-schema definitions from the existing database. Load into empty tables; no rows are loaded by preparing this sample.

`Movie.imdb_rating`, `Studio.studio_location`, and user name/password are blank because the data source does not provide those values. `Rates.rating` is doubled half-star units (divide by 2 for stars); `Rates.rates_timestamp` is Unix seconds to match the `INT` column. Movies with revenue over signed `INT` range are excluded.

Row counts: Studio=23, Movie=30, Workers=1248, CastMember=587, Role=607, User=739, WorksOn=685, Rates=750.
