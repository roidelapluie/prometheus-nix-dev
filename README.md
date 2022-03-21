# Prometheus Development Dev Shell


This is the dev environment I use to maintain Prometheus.

Usage:

```
$ git clone https://github.com/prometheus/prometheus
$ cd prometheus
$ nix develop github:roidelapluie/prometheus-nix-dev -i --keep HOME -c make
```


If you just want to build the binaries, use:

```
$ cd prometheus
$ nix develop github:roidelapluie/prometheus-nix-dev -i --keep HOME -c make build
```

You can add a alias in your bashrc:

```
alias promdev='nix develop github:roidelapluie/prometheus-nix-dev -i --keep HOME -c'
```

Then do:

```
$ cd prometheus
$ promdev make build
```
