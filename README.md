![Defold Polyglot logo](logo/logo.png)

Logo made with [DesignEvo](https://www.designevo.com/)

# Defold-Polyglot

Defold Polyglot is a simple Polyglot to Defold Tool for game localisations.
Polyglot is one of many community-driven open-source localisation projects available online here:
https://docs.google.com/spreadsheets/d/17f0dQawb-s_Fd7DHgmVvJoEGDMH_yoSd8EYigrb0zmM

## Installation
You can use Defold Polyglot in your own project by adding this project as a [Defold library dependency](http://www.defold.com/manuals/libraries/). Open your game.project file and in the dependencies field under project add:

	https://github.com/paweljarosz/defork/archive/master.zip

Once added, you must require the main Lua module in your code with:

```
    local polyglot = require("polyglot.polyglot")
```

You can download Polyglot sheet as .csv file and add to your Defold project.
Then add its localisation folder to Custom Resources in your game.project, e.g.:

> Custom Resources: assets

Assuming your polyglot csv file is in "assets" catalog in project catalog.

## Example usage

```
   -- 1. import resource
	polyglot.import("/assets/polyglot.csv")

	-- 2. set language
	polyglot.set_language("Polish")

	-- 3. use string_ids in getter
    local translation = polyglot.get("CONTEXT_CLASS_WARRIOR")

	label.set_text("#label", "Warrior in Polish is: "..translation)
```

### Warning
>  This tool is prepared only to work with Polyglot sheet. It is not protected from errors, when used inproperly. Please follow the API:

---

## API:

### .import(path)
Loads a Custom Resource with a Polyglot CSV. Asserts, if path is provided.
The functions returns the parsed table, but it is also stored inside the Lua module.

**PARAMETERS**
* `path` (string) - a correct address of a custom resource containing Polyglot data in CSV format.

**RETURNS**
* `parsed_table` (table) - a loaded table with parsed polyglot data. It is also stored internally in the Lua module.

### .set_language(language)
Sets a language used when getting translations by the provided getter.

**PARAMETERS**
* `language` (string) - a correct language name in english (LANGUAGE_EN row from Polyglot)

**RETURNS**
* nothing

### .get(string_id)
Gets a translated to current language string for given string_id.

**PARAMETERS**
* `string_id` (string) - a correct string id (STRING_ID column from Polyglot)

**RETURNS**
* `translation` (string) - a translated to current language string

---