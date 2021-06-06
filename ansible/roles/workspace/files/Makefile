.PHONY: all %

_TOOL=$(word 1, $(MAKECMDGOALS))
_MAKETARGETS=$(filter-out $(_TOOL), $(MAKECMDGOALS))

define execute
	cd $1 && make $2
endef

%:
	@$(call execute,$(_TOOL),$(_MAKETARGETS))