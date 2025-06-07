.PHONY: build
build:
	@jaspr build \
		--experimental-wasm \
		--verbose \
		--optimize=4
	@mkdir -p build/_404
	@mv build/jaspr/ja/404 build/_404/ja
	@mv build/jaspr/en/404 build/_404/en

.PHONY: init
init:
	dart pub get
	bun install
	dart pub global activate jaspr_cli

.PHONY: fmt
fmt:
	@dprint fmt
	@dart format .

.PHONY: test
test:
	dart test .

.PHONY: run
run: serve

.PHONY: dev
dev: serve

.PHONY: serve
serve:
	jaspr serve

.PHONY: start
start:
	bun start

.PHONY: check
check:
	dart analyze

.PHONY: clean
clean:
	@rm -rf build
