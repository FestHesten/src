
.include "${SRCTOP}/lib/clang/clang.pre.mk"

CFLAGS+=	-I${OBJTOP}/lib/clang/libclang
CFLAGS+=	-I${OBJTOP}/lib/clang/libllvm

.include "${SRCTOP}/lib/clang/clang.build.mk"

LIBDEPS+=	clang
LIBDEPS+=	llvm

.for lib in ${LIBDEPS}
DPADD+=		${OBJTOP}/lib/clang/lib${lib}/lib${lib}.a
LDADD+=		${OBJTOP}/lib/clang/lib${lib}/lib${lib}.a
.endfor

PACKAGE=	clang

.if ${.MAKE.OS} == "FreeBSD" || !defined(BOOTSTRAPPING)
LIBADD+=	execinfo
LIBADD+=	ncursesw
.endif
LIBADD+=	pthread

.include <bsd.prog.mk>
