# Fractalide Website

Website for fractalide made with the styx static site generator.


## Content management

The contents is managed in the `data` folder:

- `data/blocks`: Holds the blocks data in nix format.
- `data/news`: Holds news in nix, markdown or asciidoc format.
- `data/pages`: Holds pages data.

News can be added by adding a content file in `data/news`
Pages can be added by adding entries site.nix `pages` attribute.
Blocks are more complex and requires to create templates.

Nix expressions can be used in markdown or asciidoc files, see [documentation](https://styx-static.github.io/styx-site/documentation/index.html#data.embedded-nix) for details.
[Extensive example](https://github.com/styx-static/styx/blob/master/src/scaffold/sample-data/posts/2016-09-15-data.md).


## Configuration

[`conf.nix`](./conf.nix) manage the site settings (Footer contents, javascript libraries, ...)
The most important setting is `siteUrl` that is used for link generation. `siteUrl` should be set to the url of published site, without the trailing `/`.


## Previewing

Run:

```
$ styx preview
```

And visit [http://localhost:8080](http://localhost:8080).

`nix-build` can be used to build the site as a normal nix derivation.


## Debugging

`nix-repl` can be used for debugging, see [documentation](https://styx-static.github.io/styx-site/documentation/index.html#_debugging) for details.


## Deploying

`styx deploy` related commands can be used to quickly deploy to github pages.

* `styx deploy --init-gh-pages` will prepare the repo for github pages deployment, this command should be run only once.
* `styx-deploy --gh-pages` will copy the generated site to the `gh-pages` directory.
* Then the `gh-pages` can be pushed by running `(cd gh-pages && git push -u origin gh-pages) && git push -u origin gh-pages`
