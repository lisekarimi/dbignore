ignore: ## Ignore files in Dropbox
	powershell -ExecutionPolicy Bypass -File dropbox_ignore.ps1

unignore:	## Unignore files in Dropbox
	powershell -ExecutionPolicy Bypass -File dropbox_unignore.ps1


# =====================================
# 📚 Documentation & Help
# =====================================

help: ## Show this help message
	@echo Available commands:
	@echo.
	@python -c "import re; lines=open('Makefile', encoding='utf-8').readlines(); targets=[re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$',l) for l in lines]; [print(f'  make {m.group(1):<20} {m.group(2)}') for m in targets if m]"


# =====================================
# 🧹 Phony Targets
# =====================================
.PHONY: ignore unignore
.PHONY: help