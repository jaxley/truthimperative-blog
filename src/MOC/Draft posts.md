```base
views:
  - type: table
    name: Draft
    filters:
      and:
        - published == false
        - file.hasProperty("published")
    order:
      - file.name
      - title
      - published
      - tags
    sort:
      - property: file.mtime
        direction: DESC
    columnSize:
      file.name: 222
      note.title: 288
      note.published: 103

```


