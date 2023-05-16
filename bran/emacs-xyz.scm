(define-module (bran emacs-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages)
  #:use-module (guix packages))

(define-public emacs-mpv
  (package
    (name "emacs-mpv")
    (version "20211228.2043")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kljohann/mpv.el.git")
                    (commit "4fd8baa508dbc1a6b42b4e40292c0dbb0f19c9b9")))
              (sha256
               (base32
                "03zziy1lcvpf1wq15bsxwy0dhdb2z7rrdcj6srgrmgykz2wf33q7"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-json-mode emacs-org))
    (home-page "https://github.com/kljohann/mpv.el")
    (synopsis "control mpv for easy note-taking")
    (description
     "This package is a potpourri of helper functions to control a mpv process via its
IPC interface.  You might want to add the following to your init file:

(org-add-link-type \"mpv\" #'mpv-play) (defun org-mpv-complete-link (&optional
arg)   (replace-regexp-in-string    \"file:\" \"mpv:\"    (org-file-complete-link
arg)    t t)) (add-hook 'org-open-at-point-functions
#'mpv-seek-to-position-at-point)")
    (license license:gpl3+)))

(define-public emacs-elfeed-tube
  (package
  (name "emacs-elfeed-tube")
  (version "20220703.2128")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/karthink/elfeed-tube.git")
                  (commit "5817c91f5b3b7159965aa73839d2a0a08fd952bd")))
            (sha256
             (base32
              "1w22n54gm8my4r4kvi2id6s2wghsqdazzk168v79kw8kfw32vyy9"))))
  (build-system emacs-build-system)
  (propagated-inputs (list emacs-elfeed emacs-aio))
  (arguments
   '(#:include '("^elfeed-tube.el$" "^elfeed-tube-utils.el$")
     #:exclude '()))
  (home-page "https://github.com/karthink/elfeed-tube")
  (synopsis "YouTube integration for Elfeed")
  (description
   " Elfeed Tube is an extension for Elfeed, the feed reader for Emacs, that
enhances your Youtube RSS feed subscriptions.

Typically Youtube RSS feeds contain only the title and author of each video.
Elfeed Tube adds video descriptions, thumbnails, durations, chapters and \"live\"
transcrips to video entries.  See https://github.com/karthink/elfeed-tube for
demos.  This information can optionally be added to your entry in your Elfeed
database.

The displayed transcripts and chapter headings are time-aware, so you can click
on any transcript segment to visit the video at that time (in a browser or your
video player if you also have youtube-dl).  A companion package,
`elfeed-tube-mpv', provides complete mpv (video player) integration with the
transcript, including video seeking through the transcript and following along
with the video in Emacs.

To use this package,

(i) Subscribe to Youtube channel or playlist feeds in Elfeed.  You can use the
helper function `elfeed-tube-add-feeds' provided by this package to search for
Youtube channels by URLs or search queries.

(ii) Place in your init file the following:

(require 'elfeed-tube) (elfeed-tube-setup)

(iii) Use Elfeed as normal, typically with `elfeed'.  Your Youtube feed entries
should be fully populated.

You can also call `elfeed-tube-fetch' in an Elfeed buffer to manually populate
an entry, or obtain an Elfeed entry-like summary for ANY youtube video (no
subscription needed) by manually calling `elfeed-tube-fetch' from outside
Elfeed.

User options:

There are three options of note:

`elfeed-tube-fields': Customize this to set the kinds of metadata you want added
to Elfeed's Youtube entries.  You can selectively turn on/off thumbnails,
transcripts etc.

`elfeed-tube-auto-save-p': Set this boolean to save fetched Youtube metadata to
your Elfeed database, i.e.  to persist the data on disk for all entries.

`elfeed-tube-auto-fetch-p': Unset this boolean to turn off fetching metadata.
You can then call `elfeed-tube-fetch' to manually fetch data for specific feed
entries.

See the customization group `elfeed-tube' for more options.  See the README for
more information.")
  (license license:unlicense))
  )

(define-public emacs-elfeed-tube-mpv
  (package
  (name "emacs-elfeed-tube-mpv")
  (version "20220704.1952")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/karthink/elfeed-tube.git")
                  (commit "5817c91f5b3b7159965aa73839d2a0a08fd952bd")))
            (sha256
             (base32
              "1w22n54gm8my4r4kvi2id6s2wghsqdazzk168v79kw8kfw32vyy9"))))
  (build-system emacs-build-system)
  (propagated-inputs (list emacs-elfeed-tube emacs-mpv))
  (arguments
   '(#:include '("^elfeed-tube-mpv.el$")
     #:exclude '()))
  (home-page "https://github.com/karthink/elfeed-tube")
  (synopsis "Control mpv from Elfeed")
  (description
   " This package provides integration with the mpv video player for `elfeed-tube'
entries, which see.

With `elfeed-tube-mpv' loaded, clicking on a transcript segment in an Elfeed
Youtube video feed entry will launch mpv at that time, or seek to that point if
already playing.

It defines two commands and a minor mode:

- `elfeed-tube-mpv': Start an mpv session that is \"connected\" to an Elfeed entry
corresponding to a Youtube video.  You can use this command to start playback,
or seek in mpv to a transcript segment, or enqueue a video in mpv if one is
already playing.  Call with a prefix argument to spawn a new instance of mpv
instead.

- `elfeed-tube-mpv-where': Jump in Emacs to the transcript position
corresponding to the current playback time in mpv.

- `elfeed-tube-mpv-follow-mode': Follow along in the transcript in Emacs to the
video playback.")
  (license license:unlicense))
  )

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
  (license license:gpl3+)))

(define-public emacs-pkg-overview
  (package
  (name "emacs-pkg-overview")
  (version "20210802.1509")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/Boruch-Baum/emacs-pkg-overview.git")
                  (commit "9b2e416758a6c107bb8cc670ec4d2627f82d5590")))
            (sha256
             (base32
              "1p15jyjpiikx5y3syvhrdxabhhl898af88dv3fi95gm8v39n35i0"))))
  (build-system emacs-build-system)
  (home-page "https://github.com/Boruch-Baum/emacs-pkg-overview")
  (synopsis "Make org documentation from elisp source file")
  (description
   " This package parses an elisp file's comments, definitions, docstrings, and
other documentation into a hierarchical `org-mode' buffer.  It is intended to
facilitate familiarization with a file's contents and organization / structure.
The viewer can quickly swoop in and out and across the file structure using
standard `org-mode' commands and keybindings.


; Dependencies (all are already part of Emacs):

  org -- for `org-mode'


; Installation:

1) Evaluate or load this file.

2) I don't expect anyone who would want to define a global    keybinding for
this kind of function needs me to tell them how    do so, but I'm mindlessly
filling out my own template, so:

     (global-set-key (kbd \"S-M-C F1 M-x butterfly C-c C-h ?\") 'pkg-overview)")
  (license license:gpl3+)))
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

