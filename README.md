#agcc (Android gcc wrapper script)

agcc wrapper script has been around for a long time to make it easier 
to cross compile ARM code for Andriod. However, a good deal of knowledge 
about ARM and gcc is necessary to properly configure it. In my quest to 
rebuild SL4A to set the PIE bit to run on Lollipop and later, I am 
challenged to make it work to compile Perl NDK code. So I re-invented
agcc using a completely approach and it worked for me.

The approach to this version of the agcc is not to prescript by hand 
all the tools options. Instead, a tester project is built under NDK 
and the output is captured as an example. This Perl script reads 
the example and removes all target file depedent options such as 
file names, etc. and reissue those options for your target.

The committed agcc.cfg might just work for you. Here's how I created 
it (my record shows that I am executing under cmd.exe prompt; other OS 
should be similar):

    cd D:\2\safe\gits\github\agcc\extract_ndk_opts
    set PATH=D:\2\wk\android\android-ndk-r11c;%PATH%
    set PROMPT=$P (andndk)$G
    set NDK_PROJECT_PATH=D:\2\safe\gits\github\agcc\extract_ndk_opts
    ndk-build -B -d NDK_APPLICATION_MK=Application.mk | grep -P 'CreateProcess.*toolchains.*arm-' > ..\agcc.cfg

Testing the result under cygwin:

    agcc -c -o extract_ndk_opts_c.o extract_ndk_opts_c.c
    agcc -c -o extract_ndk_opts_cpp.o extract_ndk_opts_cpp.cpp
    agcc    -o extract_ndk_opts_cpp extract_ndk_opts_c.o extract_ndk_opts_cpp.o

When I have more time I will probably polish this up a bit. But you 
are welcome to fork or create issue. So far it does what I needed.
