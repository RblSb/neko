# https://jira.mariadb.org/browse/CONC-174
set(cmakelists ${mariadb_source}/CMakeLists.txt)

file(READ ${cmakelists} content)

# do not use replace /MD with /MT
string(REPLACE 
	"STRING(REPLACE \"/MD\" \"/MT\" COMPILER_FLAGS \${COMPILER_FLAGS})"
	"# STRING(REPLACE \"/MD\" \"/MT\" COMPILER_FLAGS \${COMPILER_FLAGS})"
	content ${content}
)

file(WRITE ${cmakelists} ${content})

set(cmakelists ${mariadb_source}/cmake/ConnectorName.cmake)

file(READ ${cmakelists} content)

# Fix broken syntax on newer CMake
string(REPLACE
	"  END()"
	"  ENDIF()"
	content ${content}
)

file(WRITE ${cmakelists} ${content})