(define-module (bran emacs)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:))

(define-public emacs-boxy
  (package
    (name "emacs-boxy")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://elpa.gnu.org/packages/boxy-" version
                                  ".tar"))
              (sha256
               (base32
		"0gqfs8rwqb3clwqgvv9wibl2mfx0njkdcpwl662p4bwnapl4hsi9"))))
    (build-system emacs-build-system)
    (home-page "https://gitlab.com/tygrdev/boxy")
    (synopsis "A boxy layout framework")
    (description
     "Boxy provides an interface to create a 3D representation of boxes.  Each box has
a relationship with one other box.  Multiple boxes can be related to one box.
The relationship can be any of the following: - in - on - behind - on top of -
in front of - above - below - to the right of - to the left of The relationship
determines the ordering and structure of the resulting boxy diagram.  Only boxes
which have their :name slot set will be drawn to the buffer.  Boxes without
names still take up space and can have children, so can be used for grouping.
All diagrams have one top level unnamed box called a `world'.  Each box should
have either a list of markers or an action function.  When viewing a box that
has a list of markers, the following keybindings are available: RET/mouse-1 -
Jump to the first marker o - Open next marker in other window.  Pressed multiple
times, cycle through markers.  M-RET - Open all markers as separate buffers.
This will split the current window as needed.  When viewing a box with an action
function, RET and <mouse-1> will be bound to that function.  Additionally, all
boxes have the following keybindings defined: r - Jump to the box directly
related to the current box.  Repeated presses will eventually take you to the
top level box.  TAB - Cycle visibility of box's children See the class
definition for `boxy-box for all other available properties.  To start, create
an empty box named `world'. (let ((world (boxy-box))) Use the method
`boxy-add-next to add top-level boxes to the world, without relationships: (let
((cyprus (boxy-box :name \"Cyprus\")) (greece (boxy-box :name \"Greece\")))
(boxy-add-next cyprus world) (boxy-add-next greece world) To ease the boxy
renderer, use the :expand-siblings and :expand-children slots.  These should be
list of functions which take the current box as an argument and call
`boxy-add-next to add sibling boxes and children boxes respectively.  Children
boxes are defined as any box with a relationship of in, on, behind, in front of,
or on top of.  Sibling boxes are defined as any box with a relationship of
above, below, to the left of, or to the right of. (object-add-to-list cyprus
:expand-siblings (lambda (box) (boxy-add-next (boxy-box :name \"Lebanon\" :rel
\"below\") box))) The expansion slots will be called when the user toggles the
box's visibility.  To display a box in a popup buffer, use the function
`boxy-pp'.  The methods `boxy-merge and `boxy-merge-into should be used to merge
boxes together. `boxy-merge takes a list of boxes and merges them into one box.
`boxy-merge-into takes two boxes and merges the first into the second.")
    (license license:gpl3+)))

(define-public emacs-boxy-headings
  (package
    (name "emacs-boxy-headings")
    (version "2.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://elpa.gnu.org/packages/boxy-headings-"
				  version ".tar"))
              (sha256
               (base32
		"101kiw10p0sd8j8px16zsw57my7h2f1anhnwj678z22hxhs8vla7"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-boxy emacs-org))
    (home-page "https://gitlab.com/tygrdev/boxy-headings")
    (synopsis "View org files in a boxy diagram")
    (description
     "━━━━━━━━━━━━━━━ 			 BOXY HEADINGS 			 ━━━━━━━━━━━━━━━ Table of Contents
───────────────── 1.  Usage ..  1. `boxy-headings 2.  License 3.  Development ..
 1.  Setup ..  2.  Commands .....  1. `eldev lint .....  2. `eldev compile .....
 3. `eldev package .....  4. `eldev md5 View org files as a boxy diagram.
`package-install RET boxy-headings RET 1 Usage ═══════ 1.1 `boxy-headings
─────────────────── To view all headings in an org-mode file as a boxy diagram,
use the interactive function `boxy-headings Suggested keybinding: ┌──── │
(define-key org-mode-map (kbd \"C-c r o\") boxy-headings) └──── To modify the
relationship between a headline and its parent, add the property REL to the
child headline.  Valid values are: • on-top • in-front • behind • above • below
• right • left The tooltip for each headline shows the values that would be
displayed if the org file was in org columns view. <file:demo/headings.gif> 2
License ═════════ GPLv3 3 Development ═════════════ 3.1 Setup ───────── Install
[eldev] [eldev] <https://github.com/doublep/eldev#installation> 3.2 Commands
──────────── 3.2.1 `eldev lint ╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌ Lint the `boxy-headings.el
file 3.2.2 `eldev compile ╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌ Test whether ELC has any
complaints 3.2.3 `eldev package ╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌ Creates a dist folder with
`boxy-headings-<version>.el 3.2.4 `eldev md5 ╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌ Creates an md5
checksum against all files in the dist folder.")
    (license license:gpl3+)))

(define-public emacs-verb
  (package
  (name "emacs-verb")
  (version "20230301.2117")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/federicotdn/verb.git")
                  (commit "cf4ea599a4d0a5cf1f5be114318843a48d57d35b")))
            (sha256
             (base32
              "0833ls2m90d5wh5wbrialq9hgzd20dp2c114kzh8b41vvqaxqbn0"))))
  (build-system emacs-build-system)
  (home-page "https://github.com/federicotdn/verb")
  (synopsis "Organize and send HTTP requests")
  (description
   "Verb is a package that allows you to organize and send HTTP requests from Emacs.
 See the project's README.md file for more details.")
  (license #f)))

emacs-verb
emacs-boxy
emacs-boxy-headings
