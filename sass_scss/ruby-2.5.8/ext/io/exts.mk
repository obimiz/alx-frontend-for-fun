V = 0
Q1 = $(V:1=)
Q = $(Q1:0=@)
ECHO1 = $(V:1=@:)
ECHO = $(ECHO1:0=@echo)

ruby = $(topdir)/miniruby -I'$(topdir)' -I'$(top_srcdir)/lib' \
       -I'$(extout)/$(arch)' -I'$(extout)/common'
RUBY = $(ruby)
extensions = ext/io/console/. ext/io/nonblock/. ext/io/wait/.
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

ext/io/console/all:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/nonblock/all:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/wait/all:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/console/install:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/nonblock/install:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/wait/install:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/console/static:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/nonblock/static:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/wait/static:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/console/install-so:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/nonblock/install-so:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/wait/install-so:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/console/install-rb:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/nonblock/install-rb:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/wait/install-rb:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/console/clean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/nonblock/clean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/wait/clean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/console/distclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/nonblock/distclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/wait/distclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/console/realclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/nonblock/realclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)
ext/io/wait/realclean:
	$(Q)$(MAKE) -C $(@D) $(MFLAGS) V=$(V) $(@F)

extso:
	@echo EXTSO=$(EXTSO)

note:
