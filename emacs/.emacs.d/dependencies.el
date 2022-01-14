(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)
(add-to-list
  'package-archives
  (cons "melpa-stable" "https://stable.melpa.org/packages/")
  t)
(add-to-list
  'package-archives
  (cons "melpa" "https://melpa.org/packages/")
  t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)

(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

