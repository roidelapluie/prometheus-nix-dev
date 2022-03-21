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
$ nix develop github:roidelapluie/prometheus-nix-dev -i --keep HOME -c make build
```

