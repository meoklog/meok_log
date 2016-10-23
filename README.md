# meok_log

Meok is an illustrator.

Meok would like to have traces of her progress through posts
written in [Markdown][site-markdown] and datas written
at top of the [markdowns][site-markdown] files.

Currently, the analyzer is in WIP

If you don't know what is a markdown file with yaml meta data, please refer at
[example of a markdown file format][example-md] in the ``Usage`` section below.

__meok_log__ will read files stored in [data directory][example-config-data] and :
  - split pure markdown contents and [yaml-meta datas][site-yamlmeta]
  - analyze [yaml-meta datas][site-yamlmeta] datas

__meok_log__ use [crystal language][site-crystal]

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  api:
    github: meoklog/meok_log
```


## Usage


```crystal
require "meok_log"
```



### Examples

Markdown:

```markdown
---
travail: false
humeur: dépassé par les évènements
stress: 1
date: 2016-10-20
---

- 3ds max
```

Data directory config:
```yaml
# Given the markdown files are stored in ./data
data: "./data"
```


## Development

__meok_log__ is test-driven development using [spec2.cr][github-spec2cr]

Some spec2.cr features like ``context``, ``subject``, ``let`` are not working at the time writing;
some workarounds are needed :
- replace ``context`` with ``describe`` if you want to use context descriptions,
- put ``let`` variables locally, even if it's repeating,
- put ``subject`` as subject locally.

Use [better specs guidelines][site-better-spec] when possible.

Tests are located in ``./spec`` directory.
To run the tests, type ``crystal spec`` in a terminal.

## Contributing

1. Fork it ( https://github.com/meoklog/meok_log/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [meoklog](https://github.com/meoklog)  - creator, maintainer

[site-yamlmeta]: https://middlemanapp.com/basics/frontmatter/
[site-markdown]: http://daringfireball.net/projects/markdown/
[site-crystal]: http://crystal-lang.org
[site-better-spec]: http://betterspecs.org
[github-spec2cr]: https://github.com/waterlink/spec2.cr
[example-md]: #examples
