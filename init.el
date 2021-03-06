(defun dotspacemacs/layers ()
  (setq-default

   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation nil
   dotspacemacs-ask-for-lazy-installation nil
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/")
   dotspacemacs-delete-orphan-packages t

   dotspacemacs-configuration-layers
   '(
     (auto-completion :variables
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets/"
                      :disabled-for org erc)
     ansible
     (c-c++ :variables c-c++-enable-clang-support t)
     clojure
     command-log
     csharp
     dash
     django
     elixir
     elfeed
     emacs-lisp
     emoji
     erc
     ess
     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     extra-langs
     fasd
     games
     git
     github
     haskell
     html
     (ibuffer :variables ibuffer-group-buffers-by nil)
     ipython-notebook
     javascript
     latex
     markdown
     org
     (python :variables python-test-runner 'pytest)
     ranger
     react
     ruby
     rust
     semantic
     (shell :variables shell-default-shell 'eshell)
     shell-scripts
     (spell-checking :variables spell-checking-enable-by-default nil)
     spotify
     (syntax-checking :variables syntax-checking-enable-by-default nil)
     typography
     (version-control :variables version-control-diff-tool 'diff-hl)
     yaml

     ;; Non-contrib layers
     encoding
     evil-little-word
;;     evil-shift-width
;;     (modify-theme :variables
;;                   modify-theme-headings-inherit-from-default 'all
;;                   modify-theme-headings-same-size 'all
;;                   modify-theme-headings-bold 'all)
     no-dots
     operators

     ;; Personal config layers
     bb-c
     bb-erc
     bb-ibuffer
     bb-git
     bb-keys
     bb-latex
     bb-org
     bb-theming
     bb-web
     )
   dotspacemacs-additional-packages
   '(cuda-mode
     defproject
     helm-flycheck
     nameless
     nginx-mode
     powerline
     (spaceline :location "~/repos/spaceline/")
     )

   dotspacemacs-excluded-packages
   '(clj-refactor
     elfeed-org
     julia-mode))
  )
(defun dotspacemacs/layers/SINTEFPC6985 ()
  (bb/remove-elts-or-cars 'dotspacemacs-configuration-layers
                          '(dash fasd spell-checking spotify))
  (bb/remove-elts-or-(car )s 'dotspacemacs-additional-packages
                     '(powerline spaceline)))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 10
   dotspacemacs-check-for-update t
   dotspacemacs-editing-style 'emacs
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists '(recents bookmarks projects)
   dotspacemacs-startup-recent-list-size 10
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes
   '(monokai material spacemacs-dark spacemacs-light solarized-dark leuven zenburn)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font
   `("Source Code Pro"
     :size ,(if (string= system-type "windows-nt") 16 13)
     :weight demibold :width normal :powerline-scale 1.15)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab t
   dotspacemacs-command-key ";"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-ex-substitute-global t
   dotspacemacs-default-layout-name "Home"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 10
   dotspacemacs-helm-resize t
   dotspacemacs-helm-no-header t
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-transient-state t
   dotspacemacs-which-key-delay 1.0
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup t
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide nil
   dotspacemacs-smooth-scrolling nil
   dotspacemacs-line-numbers nil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'changed)
  )
(defun dotspacemacs/user-init ()
  (setq-default

   ;; Miscellaneous
   sentence-end-double-space nil
   vc-follow-symlinks t
   ring-bell-function 'ignore
   require-final-newline t
   indent-tabs-mode nil
   system-time-locale "C"
   paradox-github-token t
   open-junk-file-find-file-function 'find-file

   ;; Backups
   backup-directory-alist `((".*" . ,temporary-file-directory))
   auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
   backup-by-copying t
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   make-backup-files nil

   ;; Evil
   evil-shift-round nil

   ;; Whitespace mode

   whitespace-style '(face tabs tab-mark newline-mark)
   whitespace-display-mappings
   '((newline-mark 10 [172 10])
     (tab-mark 9 [9655 9]))

   ;; Smartparens
   sp-highlight-pair-overlay nil
   sp-highlight-wrap-overlay nil
   sp-highlight-wrap-tag-overlay nil

   ;; Magit
   magit-popup-show-common-commands nil
   magit-gh-pulls-pull-detail-limit 200

   ;; Flycheck
   flycheck-check-syntax-automatically '(save mode-enabled)

   ;; Avy
   avy-all-windows 'all-frames

   ;; Ranger
   ranger-override-dired t

   ;; Spaceline
   spaceline-buffer-encoding-abbrev-p nil
   spaceline-version-control-p nil

   ;; Matlab
   matlab-auto-fill nil
   matlab-fill-code nil
   matlab-functions-have-end t
   matlab-indent-function-body t

   ;; LaTeX
   font-latex-fontify-script nil
   TeX-newline-function 'reindent-then-newline-and-indent

   ;; Shell
   shell-default-term-shell "/bin/zsh"

   ;; Web
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2

   ;; Emacs Lisp
   nameless-global-aliases
   '(("sm" . "spacemacs")
     ("dsm" . "dotspacemacs")
     ("cfl" . "configuration-layer")
     ("sl" . "spaceline")
     ("et" . "evil-targets")
     ("eip" . "evil-indent-plus"))
   nameless-discover-current-name nil
   nameless-prefix ""
   nameless-separator nil

   ;; Rust
   rust-indent-method-chain t

   ;; Elfeed
   elfeed-feeds
   '("https://www.reddit.com/r/emacs/.rss"
     "http://xkcd.com/rss.xml")

   ;; IRC
;;   erc-server-list
;;   `(("irc.gitter.im" :port "6667" :nick "drgeb" :full-name ,bb/full-name
;;      :ssl t :password ,bb/gitter-pwd)
;;     ("irc.freenode.net" :port "6667" :nick "drgeb" :full-name ,bb/full-name))
;;   erc-autojoin-channels-alist
;;   '(("1\\.0\\.0" "#syl20bnr/spacemacs" "#syl20bnr/spacemacs-devel") ; Gitter
;;     ("irc.gitter.im" "#syl20bnr/spacemacs" "#syl20bnr/spacemacs-devel")
;;     ("freenode\\.net" "#emacs" "#emacs-beginners" "#spacemacs" "#evil-mode")))

  ;; Theme modifications
  modify-theme-modifications
  '((monokai
     (company-pseudo-tooltip-annotation
      ((t (:foreground "#ff9eb8" :background "#49483e"))))
     (erc-timestamp-face
      ((t (:inherit font-lock-comment-face :foreground nil))))
     (evil-search-highlight-persist-highlight-face
      ((t (:background "#fc5fef" :foreground "#000000"))))
     (font-lock)))
  ))

(defun dotspacemacs/user-config ()

  ;; Settings
  (setq-default
   tab-width 8
   evil-move-beyond-eol nil
   helm-echo-input-in-header-line nil
   powerline-default-separator 'arrow)

  (dolist (e '(("xml" . web-mode)
               ("xinp" . web-mode)
               ("C" . c++-mode)
               ("h" . c++-mode)
               ("service" . conf-mode)
               ("timer" . conf-mode)))
    (push (cons (concat "\\." (car e) "\\'") (cdr e)) auto-mode-alist))
  (push '("PKGBUILD" . shell-script-mode) auto-mode-alist)
  (with-eval-after-load 'projectile
    (push '("C" "h") projectile-other-file-alist))

  ;; Miscellaneous
  (add-hook 'text-mode-hook 'auto-fill-mode)
  (add-hook 'makefile-mode-hook 'whitespace-mode)
  (add-hook 'prog-mode-hook 'page-break-lines-mode)
  (remove-hook 'prog-mode-hook 'spacemacs//show-trailing-whitespace)

  ;; Evil MC
  (add-hook 'prog-mode-hook 'turn-on-evil-mc-mode)
  (add-hook 'text-mode-hook 'turn-on-evil-mc-mode)
  (add-hook 'evil-mc-after-cursors-deleted
            (defun bb/clear-anzu () (interactive) (setq anzu--state nil)))

  ;; Semantic
  (with-eval-after-load 'semantic
    (setq semantic-default-submodes
          (remove 'global-semantic-stickyfunc-mode semantic-default-submodes)))

  ;; Diminish
  (spacemacs|diminish hybrid-mode)
  (spacemacs|diminish which-key-mode)
  (spacemacs|diminish evil-mc-mode)
  (with-eval-after-load 'emoji-cheat-sheet-plus
    (diminish 'emoji-cheat-sheet-plus-display-mode))
  (with-eval-after-load 'racer
    (diminish 'racer-mode))
  (with-eval-after-load 'command-log-mode
    (diminish 'command-log-mode))

  ;; Disable smartparens highlighting
  (with-eval-after-load 'smartparens
    (show-smartparens-global-mode -1))

  ;; Thanks StreakyCobra
  (evil-set-initial-state 'term-mode 'emacs)
  (push 'term-mode evil-escape-excluded-major-modes)
  (evil-define-key 'emacs term-raw-map (kbd "C-c") 'term-send-raw)

  (add-hook 'inferior-emacs-lisp-mode-hook 'smartparens-mode)

  ;; Evilification
  (with-eval-after-load 'haskell-interactive-mode
    (evilified-state-evilify-map haskell-error-mode-map
      :mode haskell-error-mode))
  (with-eval-after-load 'proced
    (evilified-state-evilify-map proced-mode-map
      :mode proced-mode))

  ;; Experimenting with transparency
  (push '(alpha . (0.94 . 0.94)) default-frame-alist)
  (set-frame-parameter (selected-frame) 'alpha '(0.94 . 0.94))

  ;; Safe local variables
  (put 'helm-make-build-dir 'safe-local-variable 'stringp)

  ;; Additional packages
  (add-hook 'cuda-mode-hook (lambda () (run-hooks 'prog-mode-hook)))
  (use-package helm-flycheck
    :defer t
    :init
    (spacemacs/set-leader-keys "eh" 'helm-flycheck))
  (use-package nginx-mode
    :defer t
    :mode ("nginx\\.conf\\'" "/etc/nginx/.*\\'"))
  (use-package nameless
    :defer t
    :init
    (progn
      (add-hook 'emacs-lisp-mode-hook 'nameless-mode-from-hook)
      (spacemacs|add-toggle nameless
        :status nameless-mode
        :on (nameless-mode)
        :off (nameless-mode -1)
        :evil-leader-for-mode (emacs-lisp-mode . "o:"))))
  (use-package warnings
    :defer t
    :config
    (push '(undo discard-info) warning-suppress-types))
  (use-package defproject
    :commands defproject))

(defun dotspacemacs/user-config/eivindf-sintef ()
  (defproject IFEM-PoroElasticity
    :path "~/work/IFEM/Apps/PoroElasticity"
    :nil
    ((helm-make-build-dir . "bld-sd"))))

(defun bb/remove-in-place (var pred)
  (set var (remove-if pred (symbol-value var))))

(defun bb/remove-elts-or-cars (var elts)
  (declare (indent 1))
  (bb/remove-in-place var (lambda (e)
                            (or (memq e elts)
                                (and (listp e) (memq (car e) elts))))))

(defmacro bb|wrap-func (func)
  (let ((advice-name (intern (format "%s--advice" func)))
        (target-name (intern (format "%s/%s" func system-name))))
    `(progn
       (defun ,advice-name (&rest args)
         (when (fboundp ',target-name)
           (apply ',target-name args)))
       (advice-add ',func :after ',advice-name))))

(bb|wrap-func dotspacemacs/layers)
(bb|wrap-func dotspacemacs/init)
(bb|wrap-func dotspacemacs/user-init)
(bb|wrap-func dotspacemacs/user-config)

(require 'spaceline-config)
(spaceline-spacemacs-theme)

(when (file-exists-p "~/local.el")
  (load "~/local.el"))

;;(require 'osx-browse)
;;(osx-browse-mode 1)

(setq-default dotspacemacs-configuration-layers '((osx :variables osx-use-option-as-meta nil)))

;Delete moving to trash
(setq delete-by-moving-to-trash t)

(defun eshell-here ()
    "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
    (interactive)
    (let* ((parent (if (buffer-file-name)
                       (file-name-directory (buffer-file-name))
                     default-directory))
           (height (/ (window-total-height) 3))
           (name   (car (last (split-string parent "/" t)))))
      (split-window-vertically (- height))
      (other-window 1)
      (eshell "new")
      (rename-buffer (concat "*eshell: " name "*"))

      (insert (concat "ls"))
      (eshell-send-input)))

(global-set-key (kbd "C-!") 'eshell-here)
