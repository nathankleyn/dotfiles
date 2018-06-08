<p align="center">
  <img src="icon.svg" width="300" />
</p>

# Dotfiles

My personal dotfiles repo from which you are most welcome to take inspiration! In here is everything I need to do my work and/or setup a computer from scratch.

## How To Use

### First Time Setup

The first time I setup a laptop, I run [`/bootstrap.sh`](/bootstrap.sh) which installs and configures everything I need (all tools, applications and configuration).

### Ongoing Basis

I keep everything updated by either editing the symlinked config files directly, or if I edit them here and they need copying, I:

* Run `rake` which repeats the install process for just the config; or,
* Run `/bootstrap.sh` again if I need to update applications in addition or instead.

## License

This project is [licensed under the MIT license](LICENSE).

The icon is by [Pixel Perfect](https://www.flaticon.com/authors/pixel-perfect) from [Flaticon](https://www.flaticon.com/), and is licensed under a [Creative Commons 3.0 BY](http://creativecommons.org/licenses/by/3.0/) license.
