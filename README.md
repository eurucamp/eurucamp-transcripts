eurucamp-transcripts
====================

Transcripts from eurucamp 2014 - sponsored by Asquera

### Talk format

Every talk must be Markdown. Format should be standard Markdown defined by Gruber: [Daring Fireball](http://daringfireball.net/projects/markdown/syntax)

Also every talk has a frontmatter consisting of the following properties:
```yaml
---
title: "Refactoring Ruby with Monads (or, Monads: The Good Parts)"
speaker: Tom Stuart
---
```

Optionally, there can also be a `teaser`.

### Edited talks

- Keynote
- Saturday lawn

### Conversion

Requirements:
- kramdown (`gem install kramdown`)

Convert with Ruby script:

```bash
$ ruby script/convert.rb
```
