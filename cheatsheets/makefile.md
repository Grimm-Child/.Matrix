# Makefile Cheat Sheet
[Source](https://github.com/rstacruz/cheatsheets/blob/master/makefile.md)

## Var assignment

```makefile
uglify = $(uglify)        # assignment
compressor := $(uglify)   # lazy assignment
prefix ?= /usr/local      # safe assignment
```

## Magic variables

```makefile
out.o: src.c src.h
  $@   # "out.o" (target)
  $<   # "src.c" (first prerequisite)
  $^   # "src.c src.h" (all prerequisites)

%.o: %.c
  $%   # target member name ("foo" in "foo.c")

also:
  $+   # prerequisites (all, with duplication)
  $?   # prerequisites (new ones)
  $|   # prerequisites (order-only?)
  $*   # basename without extension of the target (?)

  $(@D) # target directory
```

## Command prefixes

| Prefix | Description |
| ------ | ----------- |
| `-` | Ignore errors |
| `@` | Don't print command |
| `+` | Run even if Make is in 'don't execute' mode |

```makefile
build:
    @echo "compiling"
    -gcc $< $@

-include .depend
```

## Find files

```makefile
js_files  := $(wildcard test/*.js)
all_files := $(shell find images -name "*")
```

## Substitutions

```makefile
file     = $(SOURCE:.cpp=.o)   # foo.cpp => foo.o
outputs  = $(files:src/%.coffee=lib/%.js)

outputs  = $(patsubst %.c, %.o, $(wildcard *.c))
assets   = $(patsubst images/%, assets/%, $(wildcard images/*))
```

## More functions

```makefile
$(strip $(string_var))

$(filter %.less, $(files))
$(filter-out %.less, $(files))
```

## Building files

```makefile
%.o: %.c
  ffmpeg -i $< > $@   # Input and output
  foo $^
```

## Includes

```makefile
-include foo.make
```

## Options

```sh
make
  -e, --environment-overrides
  -B, --always-make
  -s, --silent

  -j, --jobs=N   # parallel processing
```

## Conditionals

```makefile
foo: $(objects)
ifeq ($(CC),gcc)
        $(CC) -o foo $(objects) $(libs_for_gcc)
else
        $(CC) -o foo $(objects) $(normal_libs)
endif
```

## Recursive

```makefile
deploy:
  $(MAKE) deploy2
```

## Notes

`Make` uses `/bin/sh` as the default shell. People have `/bin/sh` set up to point to different shell implementations.
Tell `Make` “this `Makefile` is written with `Bash` as the shell” by adding this to the top of the `Makefile`:
```makefile
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
```

- Note that `Makefile` makes use of $$ instead of $ for `bash` variables and subshells; `Make` uses `$` for it’s own templating variables, `$$` escapes it so `bash` sees a single `$`.

* `.ONESHELL` ensures each Make recipe is ran as one single shell session, rather than one new shell per line. This both - in my opinion - is more intuitive, and it lets you do things like loops, variable assignments and so on in bash.
* `.DELETE_ON_ERROR` does what it says on the box - if a Make rule fails, it’s target file is deleted. This ensures the next time you run Make, it’ll properly re-run the failed rule, and guards against broken files.
* `MAKEFLAGS += --warn-undefined-variables`
   This does what it says on the tin - if you are referring to Make variables that don’t exist, that’s probably wrong and it’s good to get a warning.
* `MAKEFLAGS += --no-builtin-rules`
   This disables the bewildering array of built in rules to automatically build Yacc grammars out of your data if you accidentally add the wrong file suffix. Remove magic, don’t do things unless I tell you to, Make.

## Further reading

 * [isaacs's Makefile](https://gist.github.com/isaacs/62a2d1825d04437c6f08)
