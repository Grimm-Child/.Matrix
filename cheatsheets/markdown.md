# Markdown Cheat Sheet
*Source: [Grimm-Child](https://github.com/Grimm-Child/.Matrix)*

# Headers
Examples:
# H1
## H2
### H3
#### H4
##### H5
###### H6

h1 header
=========
h2 header
---------

Code:
```
# H1
## H2
### H3
#### H4
##### H5
###### H6

h1 header
=========
h2 header
---------
```

# Text
Examples:
*Italicized text* | _Italicized text_
**Bold text**     | __Bold text__
~~Strikethrough~~

Code:
```
*Italicized text* | _Italicized text_
**Bold text**     | __Bold text__
~~Strikethrough~~
```

# Blockquotes
Examples:
> first level and paragraph
>> second level and first paragraph
>
> first level and second paragraph

Code:
```
> first level and paragraph
>> second level and first paragraph
>
> first level and second paragraph
```

# Lists
Examples:
## unordered - use *, +, or -
  * Red
  * Green
  * Blue

## ordered
  1. First
  2. Second
  3. Third
## nested - 4 spaces
    - Level 1
        - Level 2
            - Level 3
                - Level 4
                    - Level 5
                        - Level 6

Code:
```
## unordered - use *, +, or -
  * Red
  * Green
  * Blue

## ordered
  1. First
  2. Second
  3. Third
## nested - 4 spaces
    - Level 1
        - Level 2
            - Level 3
                - Level 4
                    - Level 5
                        - Level 6
```

# Code
Examples:
## use 4 spaces/1 tab
regular text
        code code code

## or:
Use the `printf()` function

## blockfence
```
code code code
```
## inline code
This is a regular sentance with `code` inline.

Code:
```
## use 4 spaces/1 tab
regular text
        code code code
## or:
Use the `printf()` function
## or:
```
blockfence
```
## inline code:
This is a regular sentance with `code` inline.
```

# HR's
Examples:
***
---
___

Code:
```
## three or more of the following
***
---
___
```

# Links
Examples:
This is [an example](http://example.com "Title") inline link.

Code:
```
This is [an example](http://example.com "Title") inline link.
```

# Images
```
![Alt Text](/path/to/file.png)
```

# Tables
Examples:
| Syntax | Description |
| ----------- | ----------- |
| Header | Title |
| Paragraph | Text |

Code:
```
| Syntax | Description |
| ----------- | ----------- |
| Header | Title |
| Paragraph | Text |
```

# Footnotes
Examples:
Here's a sentence with a footnote. [^1]

[^1]: This is the footnote.

Code:
```
Here's a sentence with a footnote. [^1]

[^1]: This is the footnote.
```

# Heading IDs
Examples:
### My Great Heading {#custom-id}

Code:
```
 	### My Great Heading {#custom-id}
```

# Definition lists
Examples:
term
: definition
term
: definition

Code:
```
term
: definition
term
: definition
```

# Task lists
```
- [x] Make a list
- [ ] Add things to list
- [ ] Profit?
```
