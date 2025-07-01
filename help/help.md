# Clock Plugin

The Clock plugin lets you customize the status line with date and time info.
Currently, date and time info can only  be updated on every action and not in real time.

Simply put one of the following custom functions in the `statusformatl`
or `statusformatr` settings.json option

* `clock.time` - Current time in 12 hour format
* `clock.time24` - Current time in 24 hour format 
* `clock.date` - Current date in day/month/year format
* `clock.dateUS` - Current date in month/day/year format
* `clock.dateReverse` - Current date in year/month/day format
* `clock.day` - Displays the day shortened. Ex. Mon
* `clock.month` - Displays the month shortened. Ex. Jan
* `clock.year` - Displays the full year
* `clock.custom` - Displays a user defined custom format

`clock.custom` is a special option that reads its value from `settings.json`
So if you want a customized format using the lua date format options then you
would need to define the clock.custom setting like so

```json
{
	"clock.custom": "%a - %Y"
}
```
Would display `Wed - 2025` assuming the day is Wednesday and the year is 2025

## Lua Date Formatting

Using the `clock.custom` config option allows you to format with lua date tags.
Below is the full list of usable lua tags and what they render to.


* `%a` - abbreviated weekday name (e.g., Wed)
* `%A` - full weekday name (e.g., Wednesday)
* `%b` - abbreviated month name (e.g., Sep)
* `%B` - full month name (e.g., September)
* `%c` - date and time (e.g., 09/16/98 23:48:10)
* `%d` - day of the month (16) {01-31}
* `%H` - hour, using a 24-hour clock (23) {00-23}
* `%I` - hour, using a 12-hour clock (11) {01-12}
* `%M` - minute (48) {00-59}
* `%m` - month (09) {01-12}
* `%p` - either "am" or "pm" (pm)
* `%S` - second (10) {00-61}
* `%w` - weekday (3) {0-6 = Sunday-Saturday}
* `%x` - date (e.g., 09/16/98)
* `%X` - time (e.g., 23:48:10)
* `%Y` - full year (1998)
* `%y` - two-digit year (98) {00-99}
* `%%` - the character "%"

## Examples

To add the time in 12 hour format to the right side of the status line:
```json
{
	"statusformatr": "$(clock.time)",
}
```

To add the date to the left side of the status line, along with the micro defaults:
```json
{
	"statusformatl": "$(clock.date) $(filename) $(modified)$(overwrite)($(line),$(col)) $(status.paste)| ft:$(opt:filetype) | $(opt:fileformat) | $(opt:encoding)"
}
```

To add a custom format (date - time) to the right side of the status line:
```json
{
	"clock.custom": "%x - %X"
	"statusformatr": "$(clock.custom) <- This is a custom format!"
}
```