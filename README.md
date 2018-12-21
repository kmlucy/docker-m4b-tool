# docker-m4b-tool

To use this container, run:
```
docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/data kmlucy/docker-m4b-tool <M4B-TOOL COMMAND>
```
`<M4B-TOOL COMMAND` defaults to `--help` if nothing is provided.

You could then set this as an alias, for example:
```
alias m4b='docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/data kmlucy/docker-m4b-tool'
```
Then you could call this just as
```
m4b <M4B-TOOL COMMAND>
```

See [sandreas/m4b-tool readme](https://github.com/sandreas/m4b-tool) for details.

Based on [sandreas/m4b-tool](https://github.com/sandreas/m4b-tool)
