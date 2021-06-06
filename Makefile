.PHONY: up down clean status config login provision

_VM=vagrant

clean:
	$(call venv_exec,.venv,$(_VM) destroy)

config:
	$(call venv_exec,.venv,$(_VM) validate)

down:
	$(call venv_exec,.venv,$(_VM) suspend)

login:
	$(call venv_exec,.venv,$(_VM) ssh)

provision:
	$(call venv_exec,.venv,$(_VM) provision)

status:
	$(call venv_exec,.venv,$(_VM) status)
	
up:
	$(call venv_exec,.venv,$(_VM) up)

# VENV FUNCTIONS
define venv_exec
	$(if [ ! -f "$($(1)/bin/activate)" ], python3 -m venv $(1))
	( \
    	source $(1)/bin/activate; \
    	$(2) \
	)
endef