[![GitHub license](https://img.shields.io/github/license/damon-kwok/chapel-mode?logo=gnu&.svg)](https://github.com/damon-kwok/chapel-mode/blob/master/COPYING)
[![Sponsor](https://img.shields.io/badge/Support%20Me-%F0%9F%92%97-ff69b4.svg)](https://www.patreon.com/DamonKwok)
<!-- [![MELPA](http://melpa.org/packages/chapel-mode-badge.svg)](http://melpa.org/#/chapel-mode) -->
<!-- [![MELPA Stable](http://stable.melpa.org/packages/chapel-mode-badge.svg)](http://stable.melpa.org/#/chapel-mode) -->

# Chapel Mode

An Emacs major mode for the [Chapel](https://chapel-lang.org/) programming language.

- Screenshot

![screenshot](https://github.com/damon-kwok/chapel-mode/blob/master/screenshot.png)

## Features

- [x] Syntax highlighting (font-lock)
- [x] Indentation
- [x] Workspace support
- [x] Auto format on save
- [x] Compilation integration
- [x] Code navigation (using `imenu`)
- [x] Go to definition (using `ctags`)
- [x] Code completion (using `company-mode`)
<!-- - [x] TODO highlighting -->
<!-- - [x] Rainbow delimiters -->
<!-- - [x] Whitespace character dsiplay -->
<!-- - [x] Fill column indicator -->
<!-- - [x] `Chapel` mode menu -->
<!-- - [x] Code folding -->

## Installation

### ~~Using MELPA~~ ([COMING SOON](https://github.com/melpa/melpa/pull/7066))
~~This package can be obtain from
[MELPA](http://melpa.org/#/chapel-mode) or
[MELPA Stable](http://stable.melpa.org/#/chapel-mode). The `master`
branch is continuously deployed to `MELPA`, and released versions are
deployed to `MELPA Stable`.~~

<kbd>M-x package-install [RET] chapel-mode [RET]</kbd>

Right now `chapel-mode` doesn't take a lot of configuration (i.e.
it's too simple to need any).

```elisp
(require 'chapel-mode)
(define-key chapel-mode-map (kbd "M-z") 'chapel-menu)
(define-key chapel-mode-map (kbd "<f6>")  'chapel-menu)
(define-key chapel-mode-map (kbd "C-c C-f") 'chapel-format-buffer)

(with-eval-after-load 'company (company-ctags-auto-setup))
```

### Using [use-package](https://github.com/jwiegley/use-package) and [straight.el](https://github.com/raxod502/straight.el)

```elisp
(use-package chapel-mode
  :straight (chapel-mode
             :type git
             :host github
             :repo "damon-kwok/chapel-mode"
             :files ("tokens" "chapel-mode.el"))
  :config
  :bind-keymap
  ("M-z" . chapel-menu)
  ("<f6>" . chapel-menu)
  ("C-c C-f" . chapel-format-buffer)
  :mode ("\\.chpl\\'" . 'chapel-mode))

(with-eval-after-load 'company (company-ctags-auto-setup))
```
