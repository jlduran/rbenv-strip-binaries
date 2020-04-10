# rbenv-strip-binaries

![Shellcheck](https://github.com/jlduran/rbenv-strip-binaries/workflows/Shellcheck/badge.svg)

This rbenv plugin hooks into the `rbenv install` command to
automatically strip binaries every time you install a new version of
Ruby.

## Installation

Make sure you have the latest rbenv and ruby-build versions, then run:

    git clone https://github.com/jlduran/rbenv-strip-binaries.git $(rbenv root)/plugins/rbenv-strip-binaries

## Usage

rbenv-strip-binaries automatically strips binaries every time you
successfully install a new version of Ruby with `rbenv install`.
