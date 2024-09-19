V = 0
Q1 = $(V:1=)
Q = $(Q1:0=@)
ECHO1 = $(V:1=@:)
ECHO = $(ECHO1:0=@echo)

ruby = $(topdir)/miniruby -I'$(topdir)' -I'$(top_srcdir)/lib' \
       -I'$(extout)/$(arch)' -I'$(extout)/common'
RUBY = $(ruby)
extensions = ext/digest/. ext/digest/bubblebabble/. ext/digest/md5/. \
	     ext/digest/rmd160/. ext/digest/sha1/. ext/digest/sha2/.
EXTOBJS = dmyext.o
EXTLIBS =
EXTSO =
EXTLDFLAGS =
EXTINITS =
SUBMAKEOPTS = EXTOBJS="$(EXTOBJS) $(EXTENCS)" EXTLIBS="$(EXTLIBS)" \
	      EXTLDFLAGS="$(EXTLDFLAGS)" EXTINITS="$(EXTINITS)" \
	      UPDATE_LIBRARIES="$(UPDATE_LIBRARIES)" SHOWFLAGS=
NOTE_MESG = $(RUBY) $(top_srcdir)/tool/colorize.rb skip
NOTE_NAME = $(RUBY) $(top_srcdir)/tool/colorize.rb fail

all: $(extensions:/.=/all)
all: note
install: $(extensions:/.=/install)
install: note
static: $(extensions:/.=/static)
static: note
install-so: $(extensions:/.=/install-so)
install-so: note
install-rb: $(extensions:/.=/install-rb)
install-rb: note
clean: $(extensions:/.=/clean)
distclean: $(extensions:/.=/distclean)
realclean: $(extensions:/.=/realclean)

clean:
	-$(Q)$(RM) ext/extinit.o
distclean:
	-$(Q)$(RM) ext/extinit.c

ruby: $(extensions:/.=/all)
all static: ruby
ruby: $(EXTOBJS)
ruby:
	$(Q)$(MAKE) $(MFLAGS) $(SUBMAKEOPTS) $@
libencs:
	$(Q)$(MAKE) -f enc.mk V=$(V) $@

ext/digest/all:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/bubblebabble/all:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/md5/all:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/rmd160/all:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha1/all:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha2/all:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/install:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/bubblebabble/install:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/md5/install:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/rmd160/install:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha1/install:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha2/install:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/static:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/bubblebabble/static:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/md5/static:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/rmd160/static:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha1/static:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha2/static:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/install-so:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/bubblebabble/install-so:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/md5/install-so:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/rmd160/install-so:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha1/install-so:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha2/install-so:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/install-rb:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/bubblebabble/install-rb:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/md5/install-rb:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/rmd160/install-rb:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha1/install-rb:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha2/install-rb:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/clean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/bubblebabble/clean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/md5/clean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/rmd160/clean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha1/clean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha2/clean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/distclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/bubblebabble/distclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/md5/distclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/rmd160/distclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha1/distclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha2/distclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/realclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/bubblebabble/realclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/md5/realclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/rmd160/realclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha1/realclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha2/realclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)

extso:
	@echo EXTSO=$(EXTSO)

note:
