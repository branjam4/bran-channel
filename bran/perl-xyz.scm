(define-module (perl-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system perl)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages)
  #:use-module (guix packages))

(define-public perl-b-lint
  (package
    (name "perl-b-lint")
    (version "1.20")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://cpan/authors/id/R/RJ/RJBS/B-Lint-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1cqhgj17jqlrwdw2lz2sprs2zydry09y14lwhmipk2zxcj4l0jfw"))))
    (build-system perl-build-system)
    (propagated-inputs `(("perl-module-pluggable" ,perl-module-pluggable)))
    (home-page "https://metacpan.org/release/B-Lint")
    (synopsis "Perl lint")
    (description "The B::Lint module is equivalent to an extended version of the -w option of perl. It is named after the program lint which carries out a similar process for C programs.
")
    (license license:perl-license)))


(define-public perl-getopt-argvfile
  (package
    (name "perl-getopt-argvfile")
    (version "1.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/J/JS/JSTENZEL/Getopt-ArgvFile-"
                    version ".tar.gz"))
              (sha256
               (base32
                "08jvhfqcjlsn013x96qa6paif0095x6y60jslp8p3zg67i8sl29p"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/Getopt-ArgvFile")
    (synopsis
     "interpolates script options from files into @ARGV or another array")
    (description "This module is a simple supplement to other option handling modules.
It allows script options and parameters to be read from files
instead of from the command line by interpolating file contents
into @ARGV. This way it PREPARES the final option handling.

Getopt::ArgvFile does NOT perform any option processing itself, and
should work fine together with any other option handling module
(e.g. Getopt::Long) or even self coded option handling.")
    (license license:artistic2.0)))

(define-public perl-test-inline
  (package
    (name "perl-test-inline")
    (version "2.214")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/E/ET/ETHER/Test-Inline-" version
                    ".tar.gz"))
              (sha256
               (base32
                "0rp3y6kpy4a59mzq14wbzr93ps4cfpi6cr5ca7yzgif2wqygrq4m"))))
    (build-system perl-build-system)
    (native-inputs `(("perl-test-classapi" ,perl-test-classapi)
                     ("perl-test-script" ,perl-test-script)))
    (propagated-inputs `(("perl-algorithm-dependency" ,perl-algorithm-dependency)
                         ("perl-config-tiny" ,perl-config-tiny)
                         ("perl-file-chmod" ,perl-file-chmod)
                         ("perl-file-find-rule" ,perl-file-find-rule)
                         ("perl-file-flat" ,perl-file-flat)
                         ("perl-file-remove" ,perl-file-remove)
                         ("perl-params-util" ,perl-params-util)
                         ("perl-path-tiny" ,perl-path-tiny)))
    (home-page "https://metacpan.org/release/Test-Inline")
    (synopsis "Embed your tests in your code, next to what is being tested")
    (description "Embedding tests allows tests to be placed near the code being tested.

This is a nice supplement to the traditional .t files.")
    (license license:perl-license)))

(define-public perl-test-classapi
  (package
  (name "perl-test-classapi")
  (version "1.07")
  (source (origin
            (method url-fetch)
            (uri (string-append
                  "mirror://cpan/authors/id/E/ET/ETHER/Test-ClassAPI-" version
                  ".tar.gz"))
            (sha256
             (base32
              "1ahqz824bz4853dyp8yhrfp0swcaj1d4dwz8x8afxhhcbvydps9h"))))
  (build-system perl-build-system)
  (propagated-inputs `(("perl-class-inspector" ,perl-class-inspector)
                       ("perl-config-tiny" ,perl-config-tiny)
                       ("perl-params-util" ,perl-params-util)))
  (home-page "https://metacpan.org/release/Test-ClassAPI")
  (synopsis "Provides basic first-pass API testing for large class trees")
  (description "For many APIs with large numbers of classes, it can be very useful to be able to do a quick once-over to make sure that classes, methods, and inheritance is correct, before doing more comprehensive testing. This module aims to provide such a capability.")
  (license license:perl-license)))

(define-public perl-algorithm-dependency
  (package
  (name "perl-algorithm-dependency")
  (version "1.112")
  (source (origin
            (method url-fetch)
            (uri (string-append
                  "mirror://cpan/authors/id/E/ET/ETHER/Algorithm-Dependency-"
                  version ".tar.gz"))
            (sha256
             (base32
              "11y11qdx8kgs72j14skzh1p13vii60pwi582kp7xr8jnkz1vf3vy"))))
  (build-system perl-build-system)
  (native-inputs `(("perl-test-classapi" ,perl-test-classapi)))
  (propagated-inputs `(("perl-params-util" ,perl-params-util)))
  (home-page "https://metacpan.org/release/Algorithm-Dependency")
  (synopsis "Base class for implementing various dependency trees")
  (description "Algorithm::Dependency is a framework for creating simple read-only dependency hierarchies, where you have a set of items that rely on other items in the set, and require actions on them as well.

Despite the most visible of these being software installation systems like the CPAN installer, or Debian apt-get, they are useful in other situations. This module intentionally uses implementation-neutral words, to avoid confusion.")
  (license license:perl-license)))

(define-public perl-config-tiny
  (package
    (name "perl-config-tiny")
    (version "2.28")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/R/RS/RSAVAGE/Config-Tiny-" version
                    ".tgz"))
              (sha256
               (base32
                "000mw17nb7aj341s0afqimxd53w5y0c4yk61pihqzm191lx89pqj"))))
    (build-system perl-build-system)
    (native-inputs `(("perl-test-pod" ,perl-test-pod)))
    (home-page "https://metacpan.org/release/Config-Tiny")
    (synopsis "Read/Write .ini style files with as little code as possible")
    (description "Config::Tiny is a Perl class to read and write .ini style configuration files with as little code as possible, reducing load time and memory overhead.")
    (license license:perl-license)))

(define-public perl-file-chmod
  (package
    (name "perl-file-chmod")
    (version "0.42")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/X/XE/XENO/File-chmod-" version
                    ".tar.gz"))
              (sha256
               (base32
                "15bp82i5ha6v3vb526r0lgwmgjqx346xwpmmd18j315wd3zszbvc"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/File-chmod")
    (synopsis "Implements symbolic and ls chmod modes")
    (description "File::chmod is a utility that allows you to bypass system calls or bit processing of a file's permissions. It overloads the chmod() function with its own that gets an octal mode, a symbolic mode (see below), or an \"ls\" mode (see below). If you wish not to overload chmod(), you can export symchmod() and lschmod(), which take, respectively, a symbolic mode and an \"ls\" mode.")
    (license license:perl-license)))

(define-public perl-file-flat
  (package
    (name "perl-file-flat")
    (version "1.07")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/E/ET/ETHER/File-Flat-" version
                    ".tar.gz"))
              (sha256
               (base32
                "0yw6fmqaqd1fjiwq5yvdhrjbg7kafi0ihidaglsqy29ri27zdhw7"))))
    (build-system perl-build-system)
    (native-inputs `(("perl-test-classapi" ,perl-test-classapi)))
    (propagated-inputs `(("perl-file-copy-recursive" ,perl-file-copy-recursive)
                         ("perl-file-remove" ,perl-file-remove)
                         ("perl-prefork" ,perl-prefork)))
    (home-page "https://metacpan.org/release/File-Flat")
    (synopsis "Implements a flat filesystem")
    (description "File::Flat implements a flat filesystem. A flat filesystem is a filesystem in which directories do not exist. It provides an abstraction over any normal filesystem which makes it appear as if directories do not exist. In effect, it will automatically create directories as needed. This is create for things like install scripts and such, as you never need to worry about the existence of directories, just write to a file, no matter where it is.")
    (license license:perl-license)))

(define-public perl-test-pod
  (package
    (name "perl-test-pod")
    (version "1.52")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/E/ET/ETHER/Test-Pod-" version
                    ".tar.gz"))
              (sha256
               (base32
                "1z75x1pxwp8ajwq9iazlg2c3wd7rdlim08yclpdg32qnc36dpa30"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/Test-Pod")
    (synopsis "check for POD errors in files")
    (description "Check POD files for errors or warnings in a test file, using Pod::Simple to do the heavy lifting.")
    (license license:perl-license)))

(define-public perl-prefork
  (package
  (name "perl-prefork")
  (version "1.05")
  (source (origin
            (method url-fetch)
            (uri (string-append "mirror://cpan/authors/id/E/ET/ETHER/prefork-"
                  version ".tar.gz"))
            (sha256
             (base32
              "01ckn45ij3nbrsc0yc4wl4z0wndn36jh6247zbycwa1vlvgvr1vd"))))
  (build-system perl-build-system)
  (home-page "https://metacpan.org/release/prefork")
  (synopsis "Optimized module loading for forking or non-forking processes")
  (description "prefork.pm is intended to serve as a central and optional marshalling point for state detection (are we running in compile-time or run-time mode) and to act as a relatively light-weight module loader.

prefork is intended to be used in two different ways.

The first is by a module that wants to indicate that another module should be loaded before forking. This is known as a \"Loader\".

The other is a script or module that will be initiating the forking. It will tell prefork.pm that it is either going to fork, or is about to fork, or for some other reason all modules previously mentioned by the Loaders should be loaded immediately.")
  (license license:perl-license)))

(define-public perl-fusqlfs
  (package
  (name "perl-fusqlfs")
  (version "0.009")
  (source (origin
            (method url-fetch)
            (uri (string-append
                  "mirror://cpan/authors/id/K/KS/KSTEPME/FusqlFS-" version
                  ".tar.gz"))
            (sha256
             (base32
              "1bdwspa0lnpalcc6q4xxn6xd1jp489yqmx1hx6w1xl9mh0iwnqpn"))))
  (build-system perl-build-system)
  (native-inputs (list perl-module-build perl-test-deep perl-test-inline))
  (propagated-inputs (list fuse
                           perl-dbi perl-getopt-argvfile
                           perl-dbd-pg perl-dbd-sqlite perl-dbd-mysql
                           perl-yaml-tiny))
  (home-page "https://metacpan.org/release/FusqlFS")
  (synopsis
   "FUSE file system to mount DB and provide tools to control and admin it")
  (description "This FUSE-daemon allows to mount any DB as a simple filesystem. Unlike other
similar \"sqlfs\" filesystem, it doesn't provide simple DB-backed file storage,
but given you full interface to all database internals.

Every table, view, function etc. is a directory, every single field, index,
record etc. is a file, symlink or subdirectory in the mounted filesystem. You
can create table \"mkdir ./mnt/tables/tablename\", and remove them with \"rmdir\"
afterwards. You can edit fields as simple YAML-files. All your usual file
utilities are at your service including \"find\", \"rm\", \"ln\", \"mv\", \"cp\" etc.

Just mount your DB and enjoy!")
  (license license:gpl3+)))
