# My Dotfiles

## Table of Contents
[About](#about) \
[Getting Started](#getting_started) \
[Accreditation](#accreditation)

## About <a name="about"></a>

This repo contains my dotfiles, constructed piecemeal over time through research and tinkering.

## Getting Started <a name="getting_started"></a>

### Installing

Start with the following command into a terminal:
```bash
git clone --bare https://github.com/lucaspatel/dotfiles $HOME/.cfg
 ```

If installing on macOS, this will likely prompt installation of Xcode Command Line Tools. Once installed, proceed with:
```bash
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```

Dotfiles and config will be available in `~` and tracked via `config` (which wraps `git`). Finally, run the bootstrap script:

```bash
bash .config/setup.sh
```

## Accreditation <a name="accreditation"></a>

The following are sources from which many bits of these dotfiles are derived from:

* [SJBach](http://items.sjbach.com/319/configuring-vim-right)
* [ckmah](https://github.com/ckmah/dotfiles)
* [durdn](https://www.atlassian.com/git/tutorials/dotfiles)
