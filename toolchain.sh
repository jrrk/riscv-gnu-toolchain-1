rm -rf binutils-2.32 gcc-8.3.0 newlib-3.0.0 gdb-8.3 glibc-2.26
curl ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-8.3.0/gcc-8.3.0.tar.xz |tar xJf -
curl ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/binutils/releases/binutils-2.32.tar.xz|tar xJf -
curl ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/newlib/newlib-3.0.0.tar.gz|tar xzf -
curl https://ftp.gnu.org/gnu/glibc/glibc-2.26.tar.xz|tar xJf -
curl ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gdb/releases/gdb-8.3.tar.xz | tar xJf -
cd binutils-2.32
patch -p1 < ../binutils-2.32.patch
patch -p1 < ../riscv-binutils-lowrisc-hack.patch
cd ../gcc-8.3.0
patch -p1 < ../gcc-8.3.0.patch
cd ../newlib-3.0.0
patch -p1 < ../newlib-3.0.0.patch 
cd ../gdb-8.3
patch -p1 < ../gdb-8.3.patch
cd ../glibc-2.26
patch -p1 < ../glibc-2.26.patch 
patch -p1 < ../glibc-2.26.new 
cd ..
rm -rf riscv-binutils riscv-gcc riscv-newlib riscv-gdb riscv-glibc
mv binutils-2.32 riscv-binutils
mv gcc-8.3.0 riscv-gcc
mv newlib-3.0.0 riscv-newlib
mv gdb-8.3 riscv-gdb
mv glibc-2.26 riscv-glibc
export PATH=/opt/riscv/bin
./configure --prefix=/opt/riscv
make -j 4 -s
