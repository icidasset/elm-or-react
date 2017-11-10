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
	@make -j serve watch_elm


serve:
	@echo "> Serving"
	@devd --livewatch --quiet --notfound 404.html $(BUILD_DIR)


watch_elm:
	@echo "> Watching"
	@watchexec -p -w $(SRC_DIR) -- make elm
