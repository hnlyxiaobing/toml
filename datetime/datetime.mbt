///|
/// TOML datetime variants (RFC 3339 subset).
///
/// TOML distinguishes four kinds of datetime literals:
/// - `OffsetDateTime` — full date + time + UTC offset (e.g. `1979-05-27T07:32:00Z`)
/// - `LocalDateTime` — date + time, no offset (e.g. `1979-05-27T07:32:00`)
/// - `LocalDate` — date only (e.g. `1979-05-27`)
/// - `LocalTime` — time only (e.g. `07:32:00`)
///
/// Values are stored as their original string form. The parser preserves
/// the spelling supplied in the TOML source; it does not normalize or
/// validate the underlying calendar arithmetic.
pub(all) enum TomlDateTime {
  OffsetDateTime(String)
  LocalDateTime(String)
  LocalDate(String)
  LocalTime(String)
} derive(Eq, Debug)

///|
/// Extend TomlDateTime with Eq and Debug methods
pub extend TomlDateTime with Eq::{not_equal, equal}
pub extend TomlDateTime with @moonbitlang/core/debug.Debug::{to_repr}

///|
/// Render the variant for human-readable diagnostics:
/// `OffsetDateTime("1979-05-27T07:32:00Z")` etc.
pub impl Show for TomlDateTime with fn output(self, logger) {
  match self {
    OffsetDateTime(s) =>
      logger <+
        $|OffsetDateTime("\{s}")
    LocalDateTime(s) =>
      logger <+
        $|LocalDateTime("\{s}")
    LocalDate(s) =>
      logger <+
        $|LocalDate("\{s}")
    LocalTime(s) =>
      logger <+
        $|LocalTime("\{s}")
  }
}

///|
/// Extend TomlDateTime with Show methods
pub extend TomlDateTime with Show::{to_string, output}
