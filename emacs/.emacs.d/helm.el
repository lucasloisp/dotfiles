(use-package helm-org
  :ensure t
  :after helm)

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-x C-b" . helm-buffers-list)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-buffers-list))
  :config (helm-mode 1))

