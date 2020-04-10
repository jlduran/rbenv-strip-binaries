#!/usr/bin/env bash

after_install strip_binaries

strip_binaries()
{
	# Strip binaries only after successfully installing Ruby.
	[ "$STATUS" = "0" ] || return 0

	PREFIX_PATH="${RBENV_ROOT}/versions/${VERSION_NAME}"
	MAJOR_VERSION=${VERSION_NAME%.*}

	case $(uname -s) in
	Darwin)
		STRIP_CMD="/usr/bin/strip -x"
		LIBRUBY_FILE="libruby.${MAJOR_VERSION}.dylib"
		SO_FILES="*.bundle"
		;;
	FreeBSD)
		STRIP_CMD="/usr/bin/strip"
		LIBRUBY_FILE="libruby.so.${MAJOR_VERSION/./}"
		SO_FILES="*.so"
		;;
	*)
		STRIP_CMD="/usr/bin/strip"
		LIBRUBY_FILE="libruby.so.${VERSION_NAME}"
		SO_FILES="*.so"
		;;
	esac

	${STRIP_CMD} "${PREFIX_PATH}/bin/ruby"
	${STRIP_CMD} "${PREFIX_PATH}/lib/${LIBRUBY_FILE}"
	find "${PREFIX_PATH}/lib/ruby/${MAJOR_VERSION}.0" -type f -name "${SO_FILES}" -exec ${STRIP_CMD} {} \;
}
