# Middleman-Widont

`middleman-widont` is an extension for [Middleman][1] that removes widows, which
are single words on a line by itself at the end of a block of text, from for
specified HTML tags. The plugin was inspired by (and owes its named too) [Shaun
Inman's][2] old Wordpress plugin from yesteryear.

## Installation

Add `gem "middleman-widont"` to your `Gemfile` and run `bundle install`

## Configuration

```ruby
activate :widont
```

The tags which to apply Widon't to can be specified:
```ruby
activate :widont, tags: %w[p li]
```

By default, Widon't places the Unicode non-breaking space character
([`\u00A0`][3]) between the first and last words of a block of text. You can
specify which string you'd like use instead:
```ruby
activate :widont, nbsp: "&nbsp;"
```

These are the default settings:
```ruby
activate :widont do |widont|
  widont.nbsp = "\u00A0"
  widont.tags = %w[p h1 h2 h3 h4 h5 h6]
end
```

[1]: http://middlemanapp.com/
[2]: http://www.shauninman.com/archive/2006/08/22/widont_wordpress_plugin
[3]: http://www.fileformat.info/info/unicode/char/a0/index.htm
