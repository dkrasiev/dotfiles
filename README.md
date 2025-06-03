# dkrasiev's dotfiles repo

## installation

```sh
export $GITHUB_USERNAME=dkrasiev
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

or with ssh

```sh
export $GITHUB_USERNAME=dkrasiev
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --ssh $GITHUB_USERNAME
```

## usage

### add

```sh
chezmoi add [...files]
```

### update

```sh
chezmoi update
```
