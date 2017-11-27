.PHONY: build


# Variables

SRC_DIR   = src
BUILD_DIR = build


# Default task

all: dev


#
# Build tasks

clean:
	@echo "> Cleaning Build Directory"
	@rm -rf $(BUILD_DIR)


html:
	@echo "> Compiling HTML"
	@cp -rf $(SRC_DIR)/Html $(BUILD_DIR)


elm:
	@echo "> Compiling Elm"
	@elm make $(SRC_DIR)/App/App.elm --output $(BUILD_DIR)/application.js --yes


#
# Action tasks

build: clean html elm
	@echo "> Build completed ⚡"


dev: build
	@make -j serve watch


serve:
	@echo "> Serving on port 8000"
	@devd --livewatch --quiet --port 8000 --notfound 404.html --all $(BUILD_DIR)


watch:
	@echo "> Watching"
	@make -j watch_elm watch_html


watch_elm:
	@watchexec -p -w $(SRC_DIR) --filter *.elm -- make elm


watch_html:
	@watchexec -p -w $(SRC_DIR) --filter *.html -- make html
