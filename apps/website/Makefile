SRC := $(shell find ./lib -name '*.dart')
ASSETS = $(shell find ./assets -type f)

.PHONY: all
all: build/index.html build/styles.css build/bootstrap.js \
	build/main.wasm build/main.mjs \
	build/img/

build/:
	@mkdir $@

build/%/: assets/%/ $(ASSETS)
	@cp -r $< $@

build/%: web/% build/
	@cp $< $@
	@echo $@

web/%.wasm.map: web/%.wasm
	@touch $@

web/%.mjs: web/%.wasm
	@touch $@

web/%.wasm: web/%.dart $(SRC)
	dart compile wasm $< -O4

.PHONY: init
init:
	dart pub get

.PHONY: fmt
fmt:
	deno fmt
	dart format .

.PHONY: run
run: serve

.PHONY: dev
dev: serve

.PHONY: serve
serve:
	bun dev

.PHONY: clean
clean:
	@rm -rf build
	@rm -f web/*.wasm
	@rm -f web/*.map
	@rm -f web/*.mjs
