baseruby="/home/titusmbanu/.rbenv/shims/ruby --disable=gems"
_\
=begin
_=
ruby="${RUBY-$baseruby}"
case "$ruby" in "echo "*) $ruby; exit $?;; esac
case "$0" in /*) r=-r"$0";; *) r=-r"./$0";; esac
exec $ruby "$r" "$@"
=end
=baseruby
class Object
  remove_const :CROSS_COMPILING if defined?(CROSS_COMPILING)
  CROSS_COMPILING = RUBY_PLATFORM
  constants.grep(/^RUBY_/) {|n| remove_const n}
  RUBY_VERSION = "2.5.8"
  RUBY_RELEASE_DATE = "2020-03-31"
  RUBY_PLATFORM = "x86_64-linux"
  RUBY_PATCHLEVEL = 224
  RUBY_REVISION = 67882
  RUBY_DESCRIPTION = "ruby 2.5.8p224 (2020-03-31 revision 67882) [x86_64-linux]"
  RUBY_COPYRIGHT = "ruby - Copyright (C) 1993-2020 Yukihiro Matsumoto"
  RUBY_ENGINE = "ruby"
  RUBY_ENGINE_VERSION = "2.5.8"
end
builddir = File.dirname(File.expand_path(__FILE__))
srcdir = "."
top_srcdir = File.realpath(srcdir, builddir)
fake = File.join(top_srcdir, "tool/fake.rb")
eval(File.read(fake), nil, fake)
ENV["RUBYOPT"] = ["-r#{__FILE__}", ENV["RUBYOPT"]].compact.join(" ")
