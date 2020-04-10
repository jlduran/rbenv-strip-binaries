#!/usr/bin/env bash

after_install strip_binaries

strip_binaries()
{
	# Strip binaries only after successfully installing Ruby.
	[ "$STATUS" = "0" ] || return 0

	STRIP_CMD="/usr/bin/strip"
	PREFIX_PATH="${RBENV_ROOT}/versions/${VERSION_NAME}"
	MAJOR_VERSION=${VERSION_NAME%.*}
	SHLIB_VER=${MAJOR_VERSION/./}

	${STRIP_CMD} "${PREFIX_PATH}/bin/ruby"
	${STRIP_CMD} "${PREFIX_PATH}/lib/libruby.so.${SHLIB_VER}"
	find "${PREFIX_PATH}/lib/ruby/${MAJOR_VERSION}.0" -type f -name "*.so" -exec ${STRIP_CMD} {} \;
}
